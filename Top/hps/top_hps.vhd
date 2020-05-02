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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;



entity top_hps is
  generic(
    radius      : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- control
    -- SLc
    -- i_uCM_pam           : in ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
    i_uCM2hps_av          : in ucm2hps_avt(MAX_NUM_HEG -1 downto 0);
    -- MDT hit
    i_mdt_tar_av      : in tar2heg_mdt_avt(MAX_NUM_HP -1 downto 0);
    -- to pt calc
    o_sf2pt_av           : out hps2pt_sf_avt(MAX_NUM_HEG -1 downto 0)
  );
end entity top_hps;

architecture beh of top_hps is

begin

  HPS : entity hps_lib.hps
    generic map(
      radius => radius
    )
    port map(
      clk                 => clk,
      
      Reset_b             => Reset_b,
      glob_en             => glob_en,
      -- configuration & control
      -- i_uCM_pam           => i_uCM_pam,
      -- SLc
      i_uCM2hps_av        => i_uCM2hps_av,
      -- MDT hit
      i_mdt_tar_av        => i_mdt_tar_av,
      -- to pt calc
      o_sf2pt_av          => o_sf2pt_av
    );


end beh;
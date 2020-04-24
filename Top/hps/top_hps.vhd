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
use shared_lib.interfaces_types_pkg.all;

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
    -- configuration & control
    i_uCM_pam           : in ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
    -- SLc
    i_uCM_data          : in ucm2heg_slc_astdst(MAX_NUM_HEG -1 downto 0);
    -- MDT hit
    i_mdt_tar_data     : in tar2heg_mdt_astdt(MAX_NUM_HP -1 downto 0);
    -- to pt calc
    o_sf_data           : out hps2pt_sf_astdst(MAX_NUM_HEG -1 downto 0)
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
      i_uCM_pam           => i_uCM_pam,
      -- SLc
      i_uCM_data          => i_uCM_data,
      -- MDT hit
      i_mdt_tar_data      => i_mdt_tar_data,
      -- to pt calc
      o_sf_data           => o_sf_data
    );


end beh;
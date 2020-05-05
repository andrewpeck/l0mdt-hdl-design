--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: HPS mdt parameters calculation
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

entity hps_pc is
  generic(
    radius      : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration & control
    -- MDT hit
    i_mdt_tar_v         : in tar2hps_vt;
    o_mdt_full_data     : out hp_hpsPc2hp_vt
  );
end entity hps_pc;

architecture beh of hps_pc is

  signal mdt_full_data  : hp_hpsPc2hp_rt;
  signal mdt_tar_data   : tar2hps_rt;
  
begin

  -- o_mdt_full_data <= hp_hit_data_f_r2std(mdt_full_data);
  -- mdt_tar_data <= tar2heg_mdt_f_std2rt(i_mdt_tar_data);

  -- mdt_full_data.layer   <= mdt_tar_data.layer;
  -- mdt_full_data.tube    <= mdt_tar_data.tube;

end beh;
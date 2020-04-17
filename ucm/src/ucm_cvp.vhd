--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc vector processor
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_cvp is
  -- generic(
  --   num_delays          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    --
    i_in_en             : in std_logic;
    --
    i_data              : in slprepro_data_stdst;
    o_ucm2hps           : out ucm_vp_data_astdst(MAX_NUM_HPS -1 downto 0)
      
  );
end entity ucm_cvp;

architecture beh of ucm_cvp is

begin

end beh;
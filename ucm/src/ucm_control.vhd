--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc Control Sorting algorithm + PAM
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

entity ucm_ctrl is
  -- generic(
  --   num_delays          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    --
    i_data              : in slprepro_Data_astdst(MAX_NUM_SL -1 downto 0);
    --
    o_csw_ctrl          : out ucm_csw_control_rt;
    o_cvp_ctrl          : out std_logic_vector(MAX_NUM_HEG -1 downto 0);
    o_pam               : out ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0)    
  );
end entity ucm_ctrl;

architecture beh of ucm_ctrl is

begin

end beh;
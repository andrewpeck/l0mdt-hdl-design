--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: phimod calculator
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_cvp_phi_comp is
  generic(
    g_NUM_DIFF_RADIUS : integer := 4;
    g_PIPELINE : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    --
    i_phicenter           : in sector_phi_center_t;--unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
    --
    i_posphi            : in unsigned(SLC_COMMON_POSPHI_LEN -1 downto 0);
    i_dv                : in std_logic;
    --
    o_rads              : out ucm_cvp_rads_art(g_NUM_DIFF_RADIUS -1 downto 0)
    -- o_dv                : out std_logic;
  );
end entity ucm_cvp_phi_comp;

architecture beh of ucm_cvp_phi_comp is


  
begin



  
end architecture beh;
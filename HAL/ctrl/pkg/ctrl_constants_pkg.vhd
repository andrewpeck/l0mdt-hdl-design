--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
--  Description:
--  
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------



library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

library ctrl_lib;
  use ctrl_lib.HPS_CTRL.all;
  use ctrl_lib.TAR_CTRL.all;
  use ctrl_lib.MTC_CTRL.all;
  use ctrl_lib.UCM_CTRL.all;
  use ctrl_lib.DAQ_CTRL.all;
  use ctrl_lib.TF_CTRL.all;
  use ctrl_lib.MPL_CTRL.all;

package ctrl_constants_pkg is
  
  signal  sc_HPS_CTRL_LEN : HPS_CTRL_t;
  constant c_HPS_CTRL_LEN : integer := len(sc_HPS_CTRL_LEN);

  signal  sc_HPS_CTRL_LEN : HPS_CTRL_t;
  constant c_HPS_CTRL_LEN : integer := len(sc_HPS_CTRL_LEN);
  
end package ctrl_constants_pkg;

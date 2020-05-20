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
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;

library heg_roi_lib;
use heg_roi_lib.ROI_LUT_BILA3.all;
use heg_roi_lib.ROI_LUT_BMLA3.all;
use heg_roi_lib.ROI_LUT_BOLA3.all;

package RoI_LUT_pkg is

  type trLUT_limits_t is array (0 to 1) of integer;
  type trLUT_layer_t is array (0 to 5) of trLUT_limits_t;
  type trLUT_mem_t is array(0 to 13000) of trLUT_layer_t;

  type b_stations_mem is record
    i   : trLUT_mem_t;
    m   : trLUT_mem_t;
    o   : trLUT_mem_t;
    e   : trLUT_mem_t;
  end record;

  type b_sector_mem is record
    a   : S3A_mem;
    c   : S3C_mem;
  end record;
  
  type RoI_LUT_mem is record
    S3  : b_sector_mem;

  end record;
  
  
end package RoI_LUT_pkg;
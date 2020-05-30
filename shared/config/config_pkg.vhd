--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module: configuration file
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--    
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.cfg_global_pkg.all;
use shared_lib.some_functions_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.detector_param_pkg.all;

library project_lib;
use project_lib.prj_cfg.all;

package config_pkg is

  constant CFG : cfg_rt := set_project_cfg;

-- =============================================================================
-- SETTING CONSTANTS FROM CONFIGURATION FILE 
-- =============================================================================
  --------------------------------------------------------------------------------
  -- Sector information
  --------------------------------------------------------------------------------
  constant SECTOR_ID            : integer   := CFG.SECTOR_ID;
  constant SECTOR_SIDE          : std_logic := CFG.SECTOR_SIDE;         -- 0:A          1:C
  constant ST_nBARREL_ENDCAP    : std_logic := CFG.ST_nBARREL_ENDCAP;   -- 0: barrel    1: Endcap
  constant ENDCAP_nSMALL_LARGE  : std_logic := CFG.ENDCAP_nSMALL_LARGE; -- 0: small     1: large
  constant ENABLE_NEIGHTBORS    : std_logic := CFG.ENABLE_NEIGHTBORS;   -- 0: disabled  1: enabled

  -- physical values

  constant PHY_BARREL_R0            : signed(SLC_Z_RPC_LEN-1 downto 0) := get_barrel_radius(CFG.SECTOR_ID,0);
  constant PHY_BARREL_R1            : signed(SLC_Z_RPC_LEN-1 downto 0) := get_barrel_radius(CFG.SECTOR_ID,1);
  constant PHY_BARREL_R2            : signed(SLC_Z_RPC_LEN-1 downto 0) := get_barrel_radius(CFG.SECTOR_ID,2);
  constant PHY_BARREL_R3            : signed(SLC_Z_RPC_LEN-1 downto 0) := get_barrel_radius(CFG.SECTOR_ID,3);

  -- Processing channel
  constant HPS_ENABLE_ST_INN          : std_logic := CFG.ENABLE_ST_INN ;              
  constant HPS_NUM_MDT_CH_INN         : integer   := CFG.NUM_MDT_CH_INN;              
  constant HPS_ENABLE_ST_EXT          : std_logic := CFG.ENABLE_ST_EXT ;              
  constant HPS_NUM_MDT_CH_EXT         : integer   := CFG.NUM_MDT_CH_EXT;              
  constant HPS_ENABLE_ST_MID          : std_logic := CFG.ENABLE_ST_MID ;              
  constant HPS_NUM_MDT_CH_MID         : integer   := CFG.NUM_MDT_CH_MID;              
  constant HPS_ENABLE_ST_OUT          : std_logic := CFG.ENABLE_ST_OUT ;              
  constant HPS_NUM_MDT_CH_OUT         : integer   := CFG.NUM_MDT_CH_OUT;              
  --------------------------------------------------------------------------------
  -- BLOCKS configuration
  --------------------------------------------------------------------------------
  constant SF_type  : std_logic := '0';  -- 0: CSF 1:LSF

  --------------------------------------------------------------------------------
  -- IN COMPILATION CONFIGURATIONS 
  --------------------------------------------------------------------------------
  constant MAX_NUM_HP   : integer := 
        max(to_integer(unsigned'('0' & CFG.ENABLE_ST_INN))*CFG.NUM_MDT_CH_INN,
          max(to_integer(unsigned'('0' & CFG.ENABLE_ST_EXT))*CFG.NUM_MDT_CH_EXT,
            max(to_integer(unsigned'('0' & CFG.ENABLE_ST_MID))*CFG.NUM_MDT_CH_MID,
            to_integer(unsigned'('0' & CFG.ENABLE_ST_OUT))*CFG.NUM_MDT_CH_OUT)
          )
        );
        
  constant MAX_NUM_HPS  : integer :=  4;
          -- to_integer(unsigned'('0' & CFG.ENABLE_ST_INN)) + 
          -- to_integer(unsigned'('0' & CFG.ENABLE_ST_EXT)) + 
          -- to_integer(unsigned'('0' & CFG.ENABLE_ST_MID)) + 
          -- to_integer(unsigned'('0' & CFG.ENABLE_ST_OUT));
  constant EN_HPS_VECTOR : std_logic_vector(MAX_NUM_HPS -1 downto 0) :=
          CFG.ENABLE_ST_INN &
          CFG.ENABLE_ST_MID &
          CFG.ENABLE_ST_OUT &
          CFG.ENABLE_ST_EXT;


  constant MAX_NUM_SL   : integer := 3 + 
  to_integer(unsigned'("" & ST_nBARREL_ENDCAP))*to_integer(unsigned'("" & ENDCAP_nSMALL_LARGE))*3 + 
  to_integer(unsigned'("" & ENABLE_NEIGHTBORS))*2;

  -- parallel channels
  constant NUM_THREADS  : integer := CFG.NUM_THREADS;

  ---------------------------------------------------------
  -- FUNCTIONS
  ---------------------------------------------------------

  

end package config_pkg;

package body config_pkg is
  

  
end package body config_pkg;


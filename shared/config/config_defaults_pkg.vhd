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
--    05/02/2020    0.1     File created
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package cfg_global_pkg is

  type cfg_rt is record
    --------------------------------------------------------------------------------
    -- Sector information
    --------------------------------------------------------------------------------
    SECTOR_ID                     : integer;    -- number of sector
    SECTOR_SIDE                   : std_logic;  -- 0:A          1:C
    ST_nBARREL_ENDCAP             : std_logic;  -- 0: barrel    1: Endcap
    ENDCAP_nSMALL_LARGE           : std_logic;  -- 0: small     1: large
    ENABLE_NEIGHTBORS             : std_logic;  -- 0: disabled  1: enabled
    --------------------------------------------------------------------------------
    -- blocks configuration
    --------------------------------------------------------------------------------
    HW_PRESENT                    : std_logic; -- enables/disable 
    -- Processing channel
    ENABLE_ST_INN                 : std_logic;
    NUM_MDT_CH_INN                : integer;
    ENABLE_ST_EXT                 : std_logic;
    NUM_MDT_CH_EXT                : integer;
    ENABLE_ST_MID                 : std_logic;
    NUM_MDT_CH_MID                : integer;
    ENABLE_ST_OUT                 : std_logic;
    NUM_MDT_CH_OUT                : integer;
    -- muon control manager
    ENABLE_UCM                    : std_logic;
    -- Segment Finder
    ENABLE_SF                     : std_logic;
    SF_type                       : std_logic;  -- 0: CSF 1:LSF
    -- pt-calc
    ENABLE_PT                     : std_logic;
    PT_type                       : std_logic;
    -- DAQ
    ENABLE_DAQ                    : std_logic;



    -- number of elements processed
    NUM_THREADS                   : integer;-- := 3;
    --------------------------------------------------------------------------------
    -- mdt hardware interface config
    --------------------------------------------------------------------------------

  end record;

  constant CFG_DEFAULTS : cfg_rt :=(
    --------------------------------------------------------------------------------
    -- Sector information
    --------------------------------------------------------------------------------
    SECTOR_ID                     => 3,  -- default sector 3
    SECTOR_SIDE                   => '0', -- 0:A          1:C
    ST_nBARREL_ENDCAP             => '0', -- 0: barrel    1: Endcap
    ENDCAP_nSMALL_LARGE           => '0', -- 0: small     1: large
    ENABLE_NEIGHTBORS             => '1', -- 0: disabled  1: enabled
    --------------------------------------------------------------------------------
    -- blocks configuration
    --------------------------------------------------------------------------------
    HW_PRESENT                    => '0';
    -- Processing channels
    ENABLE_ST_INN                 => '1', -- default enable
    NUM_MDT_CH_INN                => 6,   -- default 6            
    ENABLE_ST_EXT                 => '0', -- default disabled
    NUM_MDT_CH_EXT                => 6,   -- default 6  
    ENABLE_ST_MID                 => '1', -- default enable
    NUM_MDT_CH_MID                => 6,   -- default 6  
    ENABLE_ST_OUT                 => '1', -- default enable
    NUM_MDT_CH_OUT                => 6,   -- default 6  
    -- muon control manager
    ENABLE_UCM                    => '1',
    -- Segment Finder
    ENABLE_SF                     => '1', -- default enable
    SF_type                       => '0', -- default CSF
    -- pt-calc
    ENABLE_PT                     => '1', -- default enable
    PT_type                       => '0', -- default 0
    -- DAQ
    ENABLE_DAQ                    => '1',
    -- number of elements ( )
    NUM_THREADS                   => 3
    --------------------------------------------------------------------------------
    -- mdt hardware interface config
    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    -- Segment Finder
    --------------------------------------------------------------------------------
  );

  -- function set_configuration() return cfg_rt;

end package cfg_global_pkg;

package body cfg_global_pkg is

  -- function set_configuration return cfg_rt is
  --   variable proj_cfg : cfg_rt := CFG_DEFAULTS;
  -- begin
  --   --------------------------------------------------------------------------------
  --   -- Sector information
  --   --------------------------------------------------------------------------------
  --   proj_cfg.SECTOR_ID               := 3,
  --   proj_cfg.ST_nBARREL_ENDCAP       := '0', -- 0: barrel    1: Endcap
  --   proj_cfg.ENDCAP_nSMALL_LARGE     := '0', -- 0: small     1: large
  --   proj_cfg.ENABLE_NEIGHTBORS       := '1', -- 0: disabled  1: enabled
  --   --------------------------------------------------------------------------------
  --   -- IN COMPILATION CONFIGURATIONS 
  --   --------------------------------------------------------------------------------
  --   proj_cfg.MAX_NUM_HP              := 6,
  --   proj_cfg.NUM_THREADS             := 3,
  --   proj_cfg.MAX_NUM_HPS             := 3,
  --   proj_cfg.MAX_NUM_SL              := 5,--3 + to_integer(unsigned'("" & CFG_DEFAULTS.ST_nBARREL_ENDCAP))*to_integer(unsigned'("" & CFG_DEFAULTS.ENDCAP_nSMALL_LARGE))*3 + to_integer(unsigned'("" & CFG_DEFAULTS.ENABLE_NEIGHTBORS))*2,
  --   --------------------------------------------------------------------------------
  --   -- mdt hardware interface config
  --   --------------------------------------------------------------------------------
  --   -- numTDCs_lpGBT           := 9, 
  --   -- numlpGBTs_mux           := 2, 
  --   -- numInputs_mux           := numlpGBTs_mux * numTDCs_lpGBT, 
  --   --------------------------------------------------------------------------------
  --   -- Segment Finder
  --   --------------------------------------------------------------------------------
  --   proj_cfg.SF_type                 := '0',  -- 0: CSF 1:LSF
 
  --   return proj_cfg;
  -- end function set_configuration;

end package body cfg_global_pkg;
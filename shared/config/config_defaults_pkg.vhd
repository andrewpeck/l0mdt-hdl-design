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
    -- hardware modules
    HW_PRESENT                    : std_logic;  -- enables or disables the hardware modules on compilation  
    -- Processing channels
    ENABLE_ST_INN                 : std_logic;  -- enable or disable inner processing station
    NUM_MDT_CH_INN                : integer;    -- set the number of hir processors on the station
    ENABLE_ST_EXT                 : std_logic;  -- enable or disable extra processing station
    NUM_MDT_CH_EXT                : integer;    -- set the number of hir processors on the station
    ENABLE_ST_MID                 : std_logic;  -- enable or disable middle processing station
    NUM_MDT_CH_MID                : integer;    -- set the number of hir processors on the station
    ENABLE_ST_OUT                 : std_logic;  -- enable or disable outer processing station
    NUM_MDT_CH_OUT                : integer;    -- set the number of hir processors on the station
    -- muon control manager
    ENABLE_UCM                    : std_logic;  -- enable or disable the muon control manager
    -- Segment Finder
    ENABLE_SF                     : std_logic;  -- enable or disable the segment finder block
    SF_type                       : std_logic;  -- select the type of segment finder
    -- pt-calc
    ENABLE_PT                     : std_logic;  -- enable or disable the pt calculator
    PT_type                       : std_logic;  -- select the type of pt calculator
    -- DAQ
    ENABLE_DAQ                    : std_logic;  -- enable or disable DAQ module

    -- number of parallel processing threads
    NUM_THREADS                   : integer;
    --------------------------------------------------------------------------------
    -- mdt hardware interface config
    --------------------------------------------------------------------------------

  end record;

  constant CFG_DEFAULTS : cfg_rt :=(
    --------------------------------------------------------------------------------
    -- Sector information
    --------------------------------------------------------------------------------
    SECTOR_ID                     => 3,   -- default sector 3
    SECTOR_SIDE                   => '0', -- 0:A          1:C
    ST_nBARREL_ENDCAP             => '0', -- 0: barrel    1: Endcap
    ENDCAP_nSMALL_LARGE           => '0', -- 0: small     1: large
    ENABLE_NEIGHTBORS             => '1', -- 0: disabled  1: enabled
    --------------------------------------------------------------------------------
    -- blocks configuration
    --------------------------------------------------------------------------------
    HW_PRESENT                    => '0', -- default disabled
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
    ENABLE_UCM                    => '1', -- default
    -- Segment Finder
    ENABLE_SF                     => '1', -- default enable
    SF_type                       => '0', -- default CSF
    -- pt-calc
    ENABLE_PT                     => '1', -- default enable
    PT_type                       => '0', -- default 0
    -- DAQ
    ENABLE_DAQ                    => '1', -- default enabled
    --------------------------------------------------------------------------------
    --  Thread configuration
    --------------------------------------------------------------------------------
    NUM_THREADS                   => 3    -- default 3
  );

  -- function set_configuration() return cfg_rt;

end package cfg_global_pkg;

-- --------------------------------------------------------------------------------
-- WHEN CREATING A NEW PROJECT
-- COPY THE LINES AFTER THE COPY HERE MARCK
-- TO THE PROJECT FILE CONFIGURATION
-- THIS FILE SHOULD BE NAMED : prj_cfg.vhd
-- --------------------------------------------------------------------------------

-- COPY FROM HERE =============>

-- --------------------------------------------------------------------------------
-- --  UMass , Physics Department
-- --  Guillermo Loustau de Linares
-- --  gloustau@cern.ch
-- --  
-- --  Project: ATLAS L0MDT Trigger 
-- --  Module: configuration file
-- --  Description:
-- --
-- --------------------------------------------------------------------------------
-- --  Revisions:
-- --    05/02/2020    0.1     File created
-- --------------------------------------------------------------------------------
-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

-- library shared_lib;
-- use shared_lib.cfg_global_pkg.all;

-- package prj_cfg is
--   function set_project_cfg return cfg_rt;
-- end package prj_cfg;

-- package body prj_cfg is
--   function set_configuration return cfg_rt is
--     variable proj_cfg : cfg_rt := CFG_DEFAULTS;
--   begin
--     --------------------------------------------------------------------------------
--     -- Sector information
--     --------------------------------------------------------------------------------
--     proj_cfg.SECTOR_ID                     => 3;   -- default sector 3
--     proj_cfg.SECTOR_SIDE                   => '0'; -- 0:A          1:C
--     proj_cfg.ST_nBARREL_ENDCAP             => '0'; -- 0: barrel    1: Endcap
--     proj_cfg.ENDCAP_nSMALL_LARGE           => '0'; -- 0: small     1: large
--     proj_cfg.ENABLE_NEIGHTBORS             => '1'; -- 0: disabled  1: enabled
--     --------------------------------------------------------------------------------
--     -- blocks configuration
--     --------------------------------------------------------------------------------
--     proj_cfg.HW_PRESENT                    => '0'; -- default disabled
--     -- Processing channels
--     proj_cfg.ENABLE_ST_INN                 => '1'; -- default enable
--     proj_cfg.NUM_MDT_CH_INN                => 6;   -- default 6            
--     proj_cfg.ENABLE_ST_EXT                 => '0'; -- default disabled
--     proj_cfg.NUM_MDT_CH_EXT                => 6;   -- default 6  
--     proj_cfg.ENABLE_ST_MID                 => '1'; -- default enable
--     proj_cfg.NUM_MDT_CH_MID                => 6;   -- default 6  
--     proj_cfg.ENABLE_ST_OUT                 => '1'; -- default enable
--     proj_cfg.NUM_MDT_CH_OUT                => 6;   -- default 6  
--     -- muon control manager
--     proj_cfg.ENABLE_UCM                    => '1'; -- default
--     -- Segment Finder
--     proj_cfg.ENABLE_SF                     => '1'; -- default enable
--     proj_cfg.SF_type                       => '0'; -- default CSF
--     -- pt-calc
--     proj_cfg.ENABLE_PT                     => '1'; -- default enable
--     proj_cfg.PT_type                       => '0'; -- default 0
--     -- DAQ
--     proj_cfg.ENABLE_DAQ                    => '1'; -- default enabled
--     --------------------------------------------------------------------------------
--     --  Thread configuration
--     --------------------------------------------------------------------------------
--     proj_cfg.NUM_THREADS                   => 3;    -- default 3
   
--     return proj_cfg;
--   end function set_configuration;
-- end package body prj_cfg;

-- <======== TO HERE
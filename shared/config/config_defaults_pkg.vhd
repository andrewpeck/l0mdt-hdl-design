--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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

package cfg_global_default_pkg is

  constant CFG_MAX_HP : integer := 6;

  type cfg_rt is record
    --------------------------------------------------------------------------------
    -- Sector information
    --------------------------------------------------------------------------------
    SECTOR_ID                     : integer;    -- selects the number of sector
    SECTOR_SIDE                   : integer;  -- selects the side of the sector - 0:A          1:C
    ST_nBARREL_ENDCAP             : std_logic;  -- selects the part of detector   - 0: barrel    1: Endcap
    ENDCAP_nSMALL_LARGE           : std_logic;  -- select the type of endcap      - 0: small     1: large
    ENABLE_NEIGHBORS              : std_logic;  -- enables or disables the processing of SL neighbors
    ENABLE_ILA                    : std_logic;  -- enables the ILA debug cores for the MGT
    --------------------------------------------------------------------------------
    -- blocks configuration
    --------------------------------------------------------------------------------
    -- hardware modules
    UL_PRESENT                    : std_logic;  -- enables or disables the user logic modul on compilation
    HW_PRESENT                    : std_logic;  -- enables or disables the hardware modules on compilation
    -- Processing channels
    ENABLE_ST_INN                 : std_logic;  -- enable or disable inner processing station
    EN_MDT_CH_INN                 : std_logic_vector(CFG_MAX_HP -1 downto 0);
    -- NUM_MDT_CH_INN                : integer;    -- set the number of hir processors on the station

    ENABLE_ST_EXT                 : std_logic;  -- enable or disable extra processing station
    EN_MDT_CH_EXT                 : std_logic_vector(CFG_MAX_HP -1 downto 0);
    -- NUM_MDT_CH_EXT                : integer;    -- set the number of hir processors on the station

    ENABLE_ST_MID                 : std_logic;  -- enable or disable middle processing station
    EN_MDT_CH_MID                 : std_logic_vector(CFG_MAX_HP -1 downto 0);
    -- NUM_MDT_CH_MID                : integer;    -- set the number of hir processors on the station

    ENABLE_ST_OUT                 : std_logic;  -- enable or disable outer processing station
    EN_MDT_CH_OUT                 : std_logic_vector(CFG_MAX_HP -1 downto 0);
    -- NUM_MDT_CH_OUT                : integer;    -- set the number of hir processors on the station
    -- stations in current fpga
    FPGA_EN_ST_INN                 : std_logic;
    FPGA_EN_ST_EXT                 : std_logic;
    FPGA_EN_ST_MID                 : std_logic;
    FPGA_EN_ST_OUT                 : std_logic;
    -- tube address remap
    ENABLE_TAR                    : std_logic;
    -- INSEL_MDT_nTAR                : std_logic;
    -- muon control manager
    ENABLE_UCM                    : std_logic;  -- enable or disable the muon control manager
    -- main pipeline
    ENABLE_MPL                    : std_logic;
    -- Segment Finder
    ENABLE_SF                     : std_logic;  -- enable or disable the segment finder block
    SF_TYPE                       : std_logic;  -- select the type of segment finder
    SF_BYPASS                     : std_logic;  -- bypass of the sf to avoid optimizations
    -- pt-calc
    ENABLE_PT                     : std_logic;  -- enable or disable the pt calculator
    PT_TYPE                       : std_logic;  -- select the type of pt calculator
    -- DAQ
    ENABLE_DAQ                    : std_logic;  -- enable or disable DAQ module
    -- MTC
    ENABLE_MTC                    : std_logic;
    --FAST MONITORING
    ENABLE_FM                     : std_logic;
    -- number of parallel processing threads
    NUM_THREADS                   : integer;
    -- MTC configuration based on links to primary, neighboring sectors
    -- (barrel, endcap)
    NUM_MTC                       : integer;
    --
    ENABLE_H2S                    : std_logic;
    UPT_LATENCY                   : integer;
    MPT_LATENCY                   : integer;  

    --------------------------------------------------------------------------------
    -- mdt hardware interface config
    --------------------------------------------------------------------------------

  end record;

  constant CFG_DEFAULTS : cfg_rt :=(
    --------------------------------------------------------------------------------
    -- Sector information
    --------------------------------------------------------------------------------
    SECTOR_ID                     => 3,   -- default sector 3
    SECTOR_SIDE                   => 0, -- 0:A          1:C
    ST_nBARREL_ENDCAP             => '0', -- 0: barrel    1: Endcap
    ENDCAP_nSMALL_LARGE           => '0', -- 0: small     1: large
    ENABLE_NEIGHBORS              => '1', -- 0: disabled  1: enabled
    --------------------------------------------------------------------------------
    -- blocks configuration
    --------------------------------------------------------------------------------
    UL_PRESENT                    => '1', -- 0: disabled  1: enabled -- default enabled
    HW_PRESENT                    => '0', -- 0: disabled  1: enabled -- default disabled
    -- Processing channels
    ENABLE_ST_INN                 => '1', -- 0: disabled  1: enabled -- default enabled
    EN_MDT_CH_INN                 => (others => '1'),
    -- NUM_MDT_CH_INN                => 6,   -- default 6
    ENABLE_ST_EXT                 => '0', -- 0: disabled  1: enabled -- default disabled
    EN_MDT_CH_EXT                 => (others => '0'),
    -- NUM_MDT_CH_EXT                => 6,   -- default 6
    ENABLE_ST_MID                 => '1', -- 0: disabled  1: enabled -- default enabled
    EN_MDT_CH_MID                 => (others => '1'),
    -- NUM_MDT_CH_MID                => 6,   -- default 6
    ENABLE_ST_OUT                 => '1', -- 0: disabled  1: enabled -- default enabled
    EN_MDT_CH_OUT                 => (others => '1'),
    -- NUM_MDT_CH_OUT                => 6,   -- default 6
    -- stations enabled in hte fpga
    FPGA_EN_ST_INN                => '1',
    FPGA_EN_ST_EXT                => '0',
    FPGA_EN_ST_MID                => '1',
    FPGA_EN_ST_OUT                => '1',
    -- tube address remap
    ENABLE_TAR                    => '1',
    -- INSEL_MDT_nTAR                => '0',
    -- muon control manager
    ENABLE_UCM                    => '1', -- 0: disabled  1: enabled -- default enabled
    ENABLE_MPL                    => '1',
    -- Segment Finder
    ENABLE_SF                     => '1', -- 0: disabled  1: enabled -- default enabled
    SF_TYPE                       => '0', -- default CSF
    SF_BYPASS                     => '0', -- 0: disabled
    -- pt-calc
    ENABLE_PT                     => '1', -- 0: disabled  1: enabled -- default enabled
    PT_TYPE                       => '0', -- default 0
    -- DAQ
    ENABLE_DAQ                    => '1', -- 0: disabled  1: enabled -- default enabled
    -- MTC
    ENABLE_MTC                    => '1',
    --FAST MONITORING
    ENABLE_FM                     => '1',

    -- H2S
    ENABLE_H2S                    => '1',
    --------------------------------------------------------------------------------
    --  Thread configuration
    --------------------------------------------------------------------------------
    NUM_THREADS                   => 3 ,   -- default 3
    -- MTC configuration based on links to primary, neighboring sectors
    -- (barrel, endcap)
    NUM_MTC                       => 3 ,   -- default 3, connecting to primary SL
    MPT_LATENCY                   => 17,
    UPT_LATENCY                   => 24
  );

  function get_num_HP(enable_list : std_logic_vector) return integer;
  function get_pt_latency (pt_type:std_logic; upt_latency:integer; mpt_latency:integer) return integer ;  
end package cfg_global_default_pkg;

package body cfg_global_default_pkg is

  function get_num_HP(enable_list : std_logic_vector) return integer is
    variable num : integer := 0;
  begin
    for en_i in 0 to enable_list'length - 1 loop
      if enable_list(en_i) = '1' then
        num := num + 1;
      end if;
    end loop;
    return num;
  end function;


  function get_pt_latency (pt_type:std_logic; upt_latency:integer; mpt_latency:integer) return integer is
        variable latency     : integer := 0;       
    begin
        if pt_type = '1' then
            latency := upt_latency;
        else
            latency := mpt_latency;
        end if;
        return latency;
    end function;
end package body cfg_global_default_pkg;

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
-- --  guillermo.ldl@cern.ch
-- --
-- --  Project: ATLAS L0MDT Trigger
-- --  Module: project configurations customization
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
-- use shared_lib.cfg_global_default_pkg.all;

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
--     proj_cfg.ENABLE_NEIGHBORS             => '1'; -- 0: disabled  1: enabled
--     --------------------------------------------------------------------------------
--     -- blocks configuration
--     --------------------------------------------------------------------------------
--     proj_cfg.UL_PRESENT                    => '1'; -- default enabled
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
--     proj_cfg.SF_TYPE                       => '0'; -- default CSF
--     -- pt-calc
--     proj_cfg.ENABLE_PT                     => '1'; -- default enable
--     proj_cfg.PT_TYPE                       => '0'; -- default 0
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

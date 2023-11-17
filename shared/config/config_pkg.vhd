--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.chrn.ch
--
--  Project: ATLAS L0MDT Trigger
--  Module: configuration constants generation
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--
--------------------------------------------------------------------------------
-- *****************************************************************************
-- ** DO NOT EDIT THE VALUES OF THIS FILE MANUALY, USE THE CONFIGURATION FLOW **
-- *****************************************************************************
--------------------------------------------------------------------------------
 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
--use shared_lib.cfg_global_default_pkg.all;
use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;
use shared_lib.fct_barrel_R_rpc_pkg.all;


library shared_cfg_def_lib;
use shared_cfg_def_lib.cfg_global_default_pkg.all;


library project_lib;
use project_lib.prj_cfg.all;

package config_pkg is

  constant CFG : cfg_rt := set_project_cfg;

  constant c_MAX_NUM_ST : integer := 4;

-- =============================================================================
-- SETTING CONSTANTS FROM CONFIGURATION FILE
-- =============================================================================

 
  constant c_ENABLE_ILA           : std_logic := CFG.ENABLE_ILA;  -- 0: disabled 1: enabled
  constant c_LPGBT_VER            : std_logic := CFG.LPGBT_VER; -- 0: ver0 1: ver1 
  --------------------------------------------------------------------------------
  -- Sector information
  --------------------------------------------------------------------------------
  constant MAIN_CFG_COMPILE_HW         : std_logic := CFG.HW_PRESENT;
  constant MAIN_CFG_COMPILE_UL         : std_logic := CFG.UL_PRESENT;
  --------------------------------------------------------------------------------
  -- Sector information
  --------------------------------------------------------------------------------
  constant c_SECTOR_ID            : integer := CFG.SECTOR_ID;
  constant c_SECTOR_SIDE          : integer := CFG.SECTOR_SIDE;         -- 0:A          1:C
  constant c_ST_nBARREL_ENDCAP    : std_logic := CFG.ST_nBARREL_ENDCAP;   -- 0: barrel    1: Endcap
  constant c_ENDCAP_nSMALL_LARGE  : std_logic := CFG.ENDCAP_nSMALL_LARGE; -- 0: small     1: large
  constant c_ENABLE_NEIGHBORS     : std_logic := CFG.ENABLE_NEIGHBORS;   -- 0: disabled  1: enabled

  -- physical values

  constant PHY_BARREL_R0 : signed(SLC_Z_RPC_LEN-1 downto 0) := signed(get_barrel_R_rpc(c_SECTOR_ID,c_SECTOR_SIDE,0,0,SLC_Z_RPC_MULT,SLC_Z_RPC_LEN,32)(0));
  constant PHY_BARREL_R1 : signed(SLC_Z_RPC_LEN-1 downto 0) := signed(get_barrel_R_rpc(c_SECTOR_ID,c_SECTOR_SIDE,1,0,SLC_Z_RPC_MULT,SLC_Z_RPC_LEN,32)(0));
  constant PHY_BARREL_R2 : signed(SLC_Z_RPC_LEN-1 downto 0) := signed(get_barrel_R_rpc(c_SECTOR_ID,c_SECTOR_SIDE,1,1,SLC_Z_RPC_MULT,SLC_Z_RPC_LEN,32)(0));
  constant PHY_BARREL_R3 : signed(SLC_Z_RPC_LEN-1 downto 0) := signed(get_barrel_R_rpc(c_SECTOR_ID,c_SECTOR_SIDE,2,0,SLC_Z_RPC_MULT,SLC_Z_RPC_LEN,32)(0));

  -- Processing channel/stations
  constant c_HPS_ENABLE_ST_INN          : std_logic := CFG.ENABLE_ST_INN;
  constant c_HPS_ENABLED_HP_INN         : std_logic_vector(CFG_MAX_HP -1 downto 0) := CFG.EN_MDT_CH_INN;
  constant c_HPS_NUM_MDT_CH_INN         : integer := get_num_HP(CFG.EN_MDT_CH_INN);--CFG.NUM_MDT_CH_INN;
  constant c_HPS_MAX_HP_INN             : integer := 6;

  constant c_HPS_ENABLE_ST_EXT          : std_logic := CFG.ENABLE_ST_EXT;
  constant c_HPS_ENABLED_HP_EXT         : std_logic_vector(CFG_MAX_HP -1 downto 0) := CFG.EN_MDT_CH_EXT;
  constant c_HPS_NUM_MDT_CH_EXT         : integer   := get_num_HP(CFG.EN_MDT_CH_EXT);--CFG.NUM_MDT_CH_EXT;
  constant c_HPS_MAX_HP_EXT             : integer := 6;

  constant c_HPS_ENABLE_ST_MID          : std_logic := CFG.ENABLE_ST_MID;
  constant c_HPS_ENABLED_HP_MID         : std_logic_vector(CFG_MAX_HP -1 downto 0) := CFG.EN_MDT_CH_MID;
  constant c_HPS_NUM_MDT_CH_MID         : integer   := get_num_HP(CFG.EN_MDT_CH_MID);--CFG.NUM_MDT_CH_MID;
  constant c_HPS_MAX_HP_MID             : integer := 6;
  
  constant c_HPS_ENABLE_ST_OUT          : std_logic := CFG.ENABLE_ST_OUT;
  constant c_HPS_ENABLED_HP_OUT         : std_logic_vector(CFG_MAX_HP -1 downto 0) := CFG.EN_MDT_CH_OUT;
  constant c_HPS_NUM_MDT_CH_OUT         : integer   := get_num_HP(CFG.EN_MDT_CH_OUT);--CFG.NUM_MDT_CH_OUT;
  constant c_HPS_MAX_HP_OUT             : integer := 6;

  type integer_array_t is array (integer range <>) of integer;
  constant c_HPS_MAX_ARRAY : integer_array_t(0 to c_MAX_NUM_ST - 1) := (c_HPS_MAX_HP_INN,c_HPS_MAX_HP_MID,c_HPS_MAX_HP_OUT,c_HPS_MAX_HP_EXT);

  constant c_ENABLED_ST : std_logic_vector(0 to c_MAX_NUM_ST -1 ) := (
    c_HPS_ENABLE_ST_INN,c_HPS_ENABLE_ST_MID,c_HPS_ENABLE_ST_OUT,c_HPS_ENABLE_ST_EXT
  );

  constant c_TOTAL_MAX_NUM_HP   : integer :=
      max(to_integer(unsigned'('0' & c_HPS_ENABLE_ST_INN))*c_HPS_NUM_MDT_CH_INN,
      max(to_integer(unsigned'('0' & c_HPS_ENABLE_ST_EXT))*c_HPS_NUM_MDT_CH_EXT,
      max(to_integer(unsigned'('0' & c_HPS_ENABLE_ST_MID))*c_HPS_NUM_MDT_CH_MID,to_integer(unsigned'('0' & c_HPS_ENABLE_ST_OUT))*c_HPS_NUM_MDT_CH_OUT)
    )
  );

  type hp_num_in_station_a is array (0 to c_MAX_NUM_ST -1 ) of integer;
  constant c_HP_NUM_SECTOR_STATION : hp_num_in_station_a := (
    c_HPS_NUM_MDT_CH_INN,
    c_HPS_NUM_MDT_CH_MID,
    c_HPS_NUM_MDT_CH_OUT,
    c_HPS_NUM_MDT_CH_EXT
  );
  constant c_HP_MAX_NUM_SECTOR_STATION : hp_num_in_station_a := (
    c_HPS_MAX_HP_INN,
    c_HPS_MAX_HP_MID,
    c_HPS_MAX_HP_OUT,
    c_HPS_MAX_HP_EXT
  );

  type hp_in_station_a is array (0 to c_MAX_NUM_ST -1 ) of std_logic_vector(CFG_MAX_HP -1 downto 0);
  constant c_HP_SECTOR_STATION : hp_in_station_a := (
    c_HPS_ENABLED_HP_INN,
    c_HPS_ENABLED_HP_MID,
    c_HPS_ENABLED_HP_OUT,
    c_HPS_ENABLED_HP_EXT
  );

  constant c_STATIONS_IN_SECTOR : std_logic_vector(0 to c_MAX_NUM_ST -1 ) :=
      CFG.ENABLE_ST_INN & CFG.ENABLE_ST_MID & CFG.ENABLE_ST_OUT & CFG.ENABLE_ST_EXT;

  constant c_STATIONS_IN_FPGA : std_logic_vector(0 to c_MAX_NUM_ST -1 ) :=
      CFG.FPGA_EN_ST_INN & CFG.FPGA_EN_ST_MID & CFG.FPGA_EN_ST_OUT & CFG.FPGA_EN_ST_EXT;


  ---------------------------------------------------------
  -- PORTS CONFIG
  ---------------------------------------------------------
  constant c_NUM_NSP                    : integer := 2;

  --------------------------------------------------------------------------------
  -- Blocks configuration
  --------------------------------------------------------------------------------
  constant c_TAR_ENABLED            : std_logic := CFG.ENABLE_TAR;
  -- constant c_TAR_VERSION            : string := CFG.VERSION_TAR;

  constant c_UCM_ENABLED            : std_logic := CFG.ENABLE_UCM;
  -- constant c_UCM_VERSION            : string := "1.2";--CFG.VERSION_UCM;

  constant c_H2S_ENABLED            : std_logic := CFG.ENABLE_H2S;
  -- constant c_HPS_VERSION            : string := CFG.VERSION_HPS;
  -- constant c_HEG_VERSION            : string := CFG.VERSION_HEG;
  -- constant c_HP_VERSION             : string := CFG.VERSION_HP;

  constant c_MPL_ENABLED            : std_logic := CFG.ENABLE_MPL;
  -- constant c_MPL_VERSION            : string := CFG.VERSION_MPL;
  constant c_CPS_ENABLED            : std_logic := CFG.ENABLE_CPS;
  -- constant c_CPS_VERSION            : string := CFG.VERSION_CPS;
  --
  constant c_SF_ENABLED             : std_logic := CFG.ENABLE_SF;
  constant c_SF_TYPE                : std_logic := CFG.SF_TYPE; -- 0: CSF 1:LSF
  constant c_SF_BYPASS              : std_logic := CFG.SF_BYPASS; 
  --
  constant c_PT_ENABLED             : std_logic := CFG.ENABLE_PT;
  constant c_PT_TYPE                : std_logic := CFG.PT_TYPE; -- 0: MPT 1:UPT
  --
  constant c_MTC_ENABLED             : std_logic := CFG.ENABLE_MTC;

  --
  constant c_DAQ_ENABLED            : std_logic := CFG.ENABLE_DAQ;
  constant c_FM_ENABLED             : std_logic := CFG.ENABLE_FM;
  constant c_NUM_DAQ_STREAMS        : integer := c_HPS_NUM_MDT_CH_INN
                                                 + c_HPS_NUM_MDT_CH_MID
                                                 + c_HPS_NUM_MDT_CH_OUT
                                                 + c_HPS_NUM_MDT_CH_EXT;
  --------------------------------------------------------------------------------
  -- IN COMPILATION CONFIGURATIONS
  --------------------------------------------------------------------------------



  constant c_MAX_POSSIBLE_HPS : integer := 4;--c_MAX_NUM_ST 

  constant c_MAX_NUM_HPS  : integer :=
          to_integer(unsigned'('0' & CFG.ENABLE_ST_INN)) +
          to_integer(unsigned'('0' & CFG.ENABLE_ST_EXT)) +
          to_integer(unsigned'('0' & CFG.ENABLE_ST_MID)) +
          to_integer(unsigned'('0' & CFG.ENABLE_ST_OUT));

  -- type constant_order_array is array(0 to c_MAX_POSSIBLE_HPS - 1) of integer;
  -- constant c_STATION_ORDER : integer :

  -- constant EN_HPS_VECTOR : std_logic_vector(CFG.MAX_NUM_HPS -1 downto 0) :=
  --         CFG.ENABLE_ST_INN &
  --         CFG.ENABLE_ST_MID &
  --         CFG.ENABLE_ST_OUT &
  --         CFG.ENABLE_ST_EXT;

  constant c_NUM_SF_INPUTS : integer := to_integer(unsigned'("0" & CFG.ENABLE_NEIGHBORS));
  constant c_NUM_SF_OUTPUTS : integer := to_integer(unsigned'("0" & CFG.ENABLE_NEIGHBORS));

  constant c_NUM_NEIGHBORS : integer := to_integer(unsigned'("" & CFG.ENABLE_NEIGHBORS))*2;
  constant c_MAX_NUM_SL   : integer := 3 +
  to_integer(unsigned'("" & CFG.ST_nBARREL_ENDCAP))*to_integer(unsigned'("" & CFG.ENDCAP_nSMALL_LARGE))*3 +
  to_integer(unsigned'("" & CFG.ENABLE_NEIGHBORS))*2;

  -- parallel channels
  constant c_NUM_THREADS  : integer := CFG.NUM_THREADS;
  constant c_NUM_ACCEPTS  : integer := CFG.NUM_ACCEPTS;
  constant c_NUM_MTC      : integer := CFG.NUM_MTC; --1;
  ---------------------------------------------------------
  -- DELAYS & TIME CONSTANTS
  ---------------------------------------------------------
  constant c_UCM_2HPS_LATENCY   : integer := UCM_2HPS_LATENCY;
  constant c_HEG_SF_START_DELAY : integer := get_sf_time(CFG.SF_TYPE,HEG_CSF_START_DELAY,HEG_LSF_START_DELAY);
  constant c_HEG_SF_END_DELAY   : integer := get_sf_time(CFG.SF_TYPE,HEG_CSF_END_DELAY,HEG_LSF_END_DELAY);

  constant c_HEG_TIME_LOAD      : integer := get_heg_load_time(c_HEG_SF_START_DELAY) +  1;
  constant c_HEG_TIME_BUSY      : integer := get_heg_busy_time(c_HEG_SF_START_DELAY);
  constant c_HEG_TIME_UNLOAD    : integer := get_heg_unload_time(c_HEG_SF_START_DELAY,c_HEG_SF_END_DELAY);

  constant c_HEG_PROC_TIME : integer := c_HEG_TIME_UNLOAD + get_sf_time(CFG.SF_TYPE,CSF_POST_PROCESSING,LSF_POST_PROCESSING);

  --constant c_MPL_PL_A_LATENCY   : integer := c_HEG_PROC_TIME;

  constant c_MPL_PL_B_LATENCY   : integer := get_pt_latency(CFG.PT_TYPE,CFG.UPT_LATENCY, CFG.MPT_LATENCY) ; 

  ---------------------------------------------------------
  -- FUNCTIONS
  ---------------------------------------------------------

  function get_num_layers(station : integer) return integer;

  function get_proper_chamber(in_chamber : integer) return integer;

  ---------------------------------------------------------
  -- DAQ
  ---------------------------------------------------------

  constant c_DAQ_INN_LINKS : integer := 3;
  constant c_DAQ_MID_LINKS : integer := 3;
  constant c_DAQ_OUT_LINKS : integer := 3;
  constant c_DAQ_EXT_LINKS : integer := 0;
  constant c_DAQ_LINKS : integer := c_DAQ_INN_LINKS + c_DAQ_MID_LINKS + c_DAQ_OUT_LINKS + c_DAQ_EXT_LINKS;
  
 
end package config_pkg;

package body config_pkg is

  

  function get_num_layers(station : integer) return integer is
    variable layers : integer;
  begin

    if c_ST_nBARREL_ENDCAP = '0' then
      if station = 0 then
        layers := 8;
      else
        layers := 6;
      end if;
    else
      layers := 2;
    end if;

    return layers;
  end function;

  function get_proper_chamber(in_chamber : integer)  return integer is
    variable out_chamber : integer := 0;
  begin
    return out_chamber;
  end function;

end package body config_pkg;

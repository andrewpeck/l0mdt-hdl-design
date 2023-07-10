--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: config
-- File: cfg_display_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /cfg_display_pkg.vhd
-- -----
-- File Created: Wednesday, 17th May 2023 9:37:01 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 17th May 2023 9:37:06 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;


package cfg_display_pkg is
  
  procedure report_cfg (verb : boolean);
  
end package cfg_display_pkg;
  
package body cfg_display_pkg is
  
  procedure report_cfg (verb : boolean) is
      variable verbose : boolean;
  begin

    verbose := not verb;

    assert verbose report "-------------------------------------------";
    assert verbose report "------- CONFIGURATION CONSTANTS -----------";
    assert verbose report "-------------------------------------------";
    assert verbose report "c_MAX_NUM_ST = " & integer'image(c_MAX_NUM_ST);
    assert verbose report "MAIN_CFG_COMPILE_HW = " & std_logic'image(MAIN_CFG_COMPILE_HW) ;
    assert verbose report "MAIN_CFG_COMPILE_UL = " & std_logic'image(MAIN_CFG_COMPILE_UL) ;
    assert verbose report "-------------------------------------------";
    assert verbose report "c_SECTOR_ID = " & integer'image(c_SECTOR_ID) ;
    assert verbose report "c_SECTOR_SIDE = " & integer'image(c_SECTOR_SIDE) ;
    assert verbose report "c_ST_nBARREL_ENDCAP = " & std_logic'image(c_ST_nBARREL_ENDCAP) ;
    assert verbose report "c_ENDCAP_nSMALL_LARGE = " & std_logic'image(c_ENDCAP_nSMALL_LARGE) ;
    assert verbose report "c_ENABLE_NEIGHBORS = " & std_logic'image(c_ENABLE_NEIGHBORS) ;
    assert verbose report "-------------------------------------------";
    -- assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) ;
    -- assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) ;
    -- assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) ;
    -- assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) ;
    assert verbose report "-------------------------------------------";
    assert verbose report "c_HPS_ENABLE_ST_INN = " & std_logic'image(c_HPS_ENABLE_ST_INN) ;
    -- assert verbose report "c_HPS_ENABLED_HP_INN = " & to_string(c_HPS_ENABLED_HP_INN) ;
    assert verbose report "c_HPS_NUM_MDT_CH_INN = " & integer'image(c_HPS_NUM_MDT_CH_INN) ;
    assert verbose report "c_HPS_MAX_HP_INN = " & integer'image(c_HPS_MAX_HP_INN) ;

    assert verbose report "c_HPS_ENABLE_ST_MID = " & std_logic'image(c_HPS_ENABLE_ST_MID) ;
    -- assert verbose report "c_HPS_ENABLED_HP_MID = " & to_string(c_HPS_ENABLED_HP_MID) ;
    assert verbose report "c_HPS_NUM_MDT_CH_MID = " & integer'image(c_HPS_NUM_MDT_CH_MID) ;
    assert verbose report "c_HPS_MAX_HP_MID = " & integer'image(c_HPS_MAX_HP_MID) ;

    assert verbose report "c_HPS_ENABLE_ST_OUT = " & std_logic'image(c_HPS_ENABLE_ST_OUT) ;
    -- assert verbose report "c_HPS_ENABLED_HP_OUT = " & to_string(c_HPS_ENABLED_HP_OUT) ;
    assert verbose report "c_HPS_NUM_MDT_CH_OUT = " & integer'image(c_HPS_NUM_MDT_CH_OUT) ;
    assert verbose report "c_HPS_MAX_HP_OUT = " & integer'image(c_HPS_MAX_HP_OUT) ;

    assert verbose report "c_HPS_ENABLE_ST_EXT = " & std_logic'image(c_HPS_ENABLE_ST_EXT) ;
    -- assert verbose report "c_HPS_ENABLED_HP_EXT = " & to_string(c_HPS_ENABLED_HP_EXT) ;
    assert verbose report "c_HPS_NUM_MDT_CH_EXT = " & integer'image(c_HPS_NUM_MDT_CH_EXT) ;
    assert verbose report "c_HPS_MAX_HP_EXT = " & integer'image(c_HPS_MAX_HP_EXT) ;
    assert verbose report "-------------------------------------------";
    assert verbose report "c_NUM_NSP = " & integer'image(c_NUM_NSP) ;
    assert verbose report "c_TAR_ENABLED = " & std_logic'image(c_TAR_ENABLED) ;
    assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) ;
    assert verbose report "c_H2S_ENABLED = " & std_logic'image(c_H2S_ENABLED) ;
    assert verbose report "c_MPL_ENABLED = " & std_logic'image(c_MPL_ENABLED) ;
    assert verbose report "c_SF_ENABLED = " & std_logic'image(c_SF_ENABLED) ;
    assert verbose report "c_SF_TYPE = " & std_logic'image(c_SF_TYPE) ;
    assert verbose report "c_SF_BYPASS = " & std_logic'image(c_SF_BYPASS) ;
    assert verbose report "c_PT_ENABLED = " & std_logic'image(c_PT_ENABLED) ;
    assert verbose report "c_PT_TYPE = " & std_logic'image(c_PT_TYPE) ;
    assert verbose report "c_MTC_ENABLED = " & std_logic'image(c_MTC_ENABLED) ;
    assert verbose report "c_DAQ_ENABLED = " & std_logic'image(c_DAQ_ENABLED) ;
    assert verbose report "c_FM_ENABLED = " & std_logic'image(c_FM_ENABLED) ;
    assert verbose report "c_NUM_DAQ_STREAMS = " & integer'image(c_NUM_DAQ_STREAMS) ;
    assert verbose report "-------------------------------------------";
    assert verbose report "c_MAX_POSSIBLE_HPS = " & integer'image(c_MAX_POSSIBLE_HPS) ;
    assert verbose report "c_MAX_NUM_HPS = " & integer'image(c_MAX_NUM_HPS) ;
    assert verbose report "c_NUM_SF_INPUTS = " & integer'image(c_NUM_SF_INPUTS) ;
    assert verbose report "c_NUM_SF_OUTPUTS = " & integer'image(c_NUM_SF_OUTPUTS) ;
    assert verbose report "-------------------------------------------";
    assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) ;
    assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) ;
    assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) ;
    assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) ;
    assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) ;





    assert verbose report "-------------------------------------------";
    assert verbose report "----- END CONFIGURATION CONSTANTS ---------";
    assert verbose report "-------------------------------------------";

    -- outvar := 0;
    -- return outvar;

  end;
  
end package body cfg_display_pkg;
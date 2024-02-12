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
use shared_lib.vhdl_tb_utils_pkg.all;


package cfg_display_pkg is
  
  procedure report_cfg (verb : boolean; sim : boolean := false);
  
end package cfg_display_pkg;
  
package body cfg_display_pkg is
  
  procedure report_cfg (verb : boolean; sim : boolean := false) is
      variable verbose : boolean;
  begin


    verbose := not verb;

    if not sim then


      assert verbose report "-------------------------------------------" severity note;
      assert verbose report "------- CONFIGURATION CONSTANTS -----------" severity note;
      assert verbose report "-------------------------------------------" severity note;
      assert verbose report "c_ENABLE_ILA = " & std_logic'image(c_ENABLE_ILA) severity note;
      assert verbose report "c_LPGBT_VER = " & std_logic'image(c_LPGBT_VER) severity note;
      assert verbose report "c_MAX_NUM_ST = " & integer'image(c_MAX_NUM_ST) severity note;
      assert verbose report "MAIN_CFG_COMPILE_HW = " & std_logic'image(MAIN_CFG_COMPILE_HW) severity note ;
      assert verbose report "MAIN_CFG_COMPILE_UL = " & std_logic'image(MAIN_CFG_COMPILE_UL) severity note;
      assert verbose report "-------------------------------------------"severity note;
      assert verbose report "c_SECTOR_ID = " & integer'image(c_SECTOR_ID) severity note;
      assert verbose report "c_SECTOR_SIDE = " & integer'image(c_SECTOR_SIDE) severity note;
      assert verbose report "c_ST_nBARREL_ENDCAP = " & std_logic'image(c_ST_nBARREL_ENDCAP) severity note;
      assert verbose report "c_ENDCAP_nSMALL_LARGE = " & std_logic'image(c_ENDCAP_nSMALL_LARGE) severity note;
      assert verbose report "c_ENABLE_NEIGHBORS = " & std_logic'image(c_ENABLE_NEIGHBORS) severity note;
      assert verbose report "-------------------------------------------"severity note;
      assert verbose report "-------------------------------------------"severity note;
      assert verbose report "c_HPS_ENABLE_ST_INN = " & std_logic'image(c_HPS_ENABLE_ST_INN) severity note;
      assert verbose report "c_HPS_ENABLED_HP_INN = " & to_string(c_HPS_ENABLED_HP_INN) severity note;
      assert verbose report "c_HPS_NUM_MDT_CH_INN = " & integer'image(c_HPS_NUM_MDT_CH_INN) severity note;
      assert verbose report "c_HPS_MAX_HP_INN = " & integer'image(c_HPS_MAX_HP_INN) severity note;
      assert verbose report "c_HPS_ENABLE_ST_MID = " & std_logic'image(c_HPS_ENABLE_ST_MID) severity note;
      assert verbose report "c_HPS_ENABLED_HP_MID = " & to_string(c_HPS_ENABLED_HP_MID) severity note;
      assert verbose report "c_HPS_NUM_MDT_CH_MID = " & integer'image(c_HPS_NUM_MDT_CH_MID) severity note;
      assert verbose report "c_HPS_MAX_HP_MID = " & integer'image(c_HPS_MAX_HP_MID) severity note;
      assert verbose report "c_HPS_ENABLE_ST_OUT = " & std_logic'image(c_HPS_ENABLE_ST_OUT) severity note;
      assert verbose report "c_HPS_ENABLED_HP_OUT = " & to_string(c_HPS_ENABLED_HP_OUT) severity note;
      assert verbose report "c_HPS_NUM_MDT_CH_OUT = " & integer'image(c_HPS_NUM_MDT_CH_OUT) severity note;
      assert verbose report "c_HPS_MAX_HP_OUT = " & integer'image(c_HPS_MAX_HP_OUT) severity note;
      assert verbose report "c_HPS_ENABLE_ST_EXT = " & std_logic'image(c_HPS_ENABLE_ST_EXT) severity note;
      assert verbose report "c_HPS_ENABLED_HP_EXT = " & to_string(c_HPS_ENABLED_HP_EXT) severity note;
      assert verbose report "c_HPS_NUM_MDT_CH_EXT = " & integer'image(c_HPS_NUM_MDT_CH_EXT) severity note;
      assert verbose report "c_HPS_MAX_HP_EXT = " & integer'image(c_HPS_MAX_HP_EXT) severity note;
      assert verbose report "-------------------------------------------"severity note;
      assert verbose report "c_NUM_NSP = " & integer'image(c_NUM_NSP) severity note;
      assert verbose report "c_TAR_ENABLED = " & std_logic'image(c_TAR_ENABLED) severity note;
      assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) severity note;
      assert verbose report "c_H2S_ENABLED = " & std_logic'image(c_H2S_ENABLED) severity note;
      assert verbose report "c_MPL_ENABLED = " & std_logic'image(c_MPL_ENABLED) severity note;
      assert verbose report "c_SF_ENABLED = " & std_logic'image(c_SF_ENABLED) severity note;
      assert verbose report "c_SF_TYPE = " & std_logic'image(c_SF_TYPE) severity note;
      assert verbose report "c_SF_BYPASS = " & std_logic'image(c_SF_BYPASS) severity note;
      assert verbose report "c_PT_ENABLED = " & std_logic'image(c_PT_ENABLED) severity note;
      assert verbose report "c_PT_TYPE = " & std_logic'image(c_PT_TYPE) severity note;
      assert verbose report "c_MTC_ENABLED = " & std_logic'image(c_MTC_ENABLED) severity note;
      assert verbose report "c_DAQ_ENABLED = " & std_logic'image(c_DAQ_ENABLED) severity note;
      assert verbose report "c_FM_ENABLED = " & std_logic'image(c_FM_ENABLED) severity note;
      assert verbose report "c_NUM_DAQ_STREAMS = " & integer'image(c_NUM_DAQ_STREAMS) severity note;
      assert verbose report "-------------------------------------------"severity note;
      assert verbose report "c_MAX_POSSIBLE_HPS = " & integer'image(c_MAX_POSSIBLE_HPS) severity note;
      assert verbose report "c_MAX_NUM_HPS = " & integer'image(c_MAX_NUM_HPS) severity note;
      assert verbose report "c_NUM_SF_INPUTS = " & integer'image(c_NUM_SF_INPUTS) severity note;
      assert verbose report "c_NUM_SF_OUTPUTS = " & integer'image(c_NUM_SF_OUTPUTS) severity note;
      assert verbose report "-------------------------------------------"severity note;
      assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) severity note;
      assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) severity note;
      assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) severity note;
      assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) severity note;
      assert verbose report "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) severity note;
      assert verbose report "-------------------------------------------"severity note;
      assert verbose report "----- END CONFIGURATION CONSTANTS ---------"severity note;
      assert verbose report "-------------------------------------------"severity note;
    else
      puts( "-------------------------------------------" );
      puts( "------- CONFIGURATION CONSTANTS -----------" );
      puts( "-------------------------------------------" );
      puts( "c_ENABLE_ILA = " & std_logic'image(c_ENABLE_ILA) );
      puts( "c_LPGBT_VER = " & std_logic'image(c_LPGBT_VER) );
      puts( "c_MAX_NUM_ST = " & integer'image(c_MAX_NUM_ST) );
      puts( "MAIN_CFG_COMPILE_HW = " & std_logic'image(MAIN_CFG_COMPILE_HW) );
      puts( "MAIN_CFG_COMPILE_UL = " & std_logic'image(MAIN_CFG_COMPILE_UL) );
      puts( "-------------------------------------------");
      puts( "  Sector configuration ");
      puts( "-------------------------------------------");
      puts( "c_SECTOR_ID = " & integer'image(c_SECTOR_ID) );
      puts( "c_SECTOR_SIDE = " & integer'image(c_SECTOR_SIDE) );
      puts( "c_ST_nBARREL_ENDCAP = " & std_logic'image(c_ST_nBARREL_ENDCAP) );
      puts( "c_ENDCAP_nSMALL_LARGE = " & std_logic'image(c_ENDCAP_nSMALL_LARGE) );
      puts( "c_ENABLE_NEIGHBORS = " & std_logic'image(c_ENABLE_NEIGHBORS) );
      puts( "-------------------------------------------");
      puts( "  Stations configuration ");
      puts( "-------------------------------------------");
      puts( "c_HPS_ENABLE_ST_INN = " & std_logic'image(c_HPS_ENABLE_ST_INN) );
      puts( "c_HPS_ENABLED_HP_INN = " & to_string(c_HPS_ENABLED_HP_INN) );
      puts( "c_HPS_NUM_MDT_CH_INN = " & integer'image(c_HPS_NUM_MDT_CH_INN) );
      puts( "c_HPS_MAX_HP_INN = " & integer'image(c_HPS_MAX_HP_INN) );
      puts( "c_HPS_ENABLE_ST_MID = " & std_logic'image(c_HPS_ENABLE_ST_MID) );
      puts( "c_HPS_ENABLED_HP_MID = " & to_string(c_HPS_ENABLED_HP_MID) );
      puts( "c_HPS_NUM_MDT_CH_MID = " & integer'image(c_HPS_NUM_MDT_CH_MID) );
      puts( "c_HPS_MAX_HP_MID = " & integer'image(c_HPS_MAX_HP_MID) );
      puts( "c_HPS_ENABLE_ST_OUT = " & std_logic'image(c_HPS_ENABLE_ST_OUT) );
      puts( "c_HPS_ENABLED_HP_OUT = " & to_string(c_HPS_ENABLED_HP_OUT) );
      puts( "c_HPS_NUM_MDT_CH_OUT = " & integer'image(c_HPS_NUM_MDT_CH_OUT) );
      puts( "c_HPS_MAX_HP_OUT = " & integer'image(c_HPS_MAX_HP_OUT) );
      puts( "c_HPS_ENABLE_ST_EXT = " & std_logic'image(c_HPS_ENABLE_ST_EXT) );
      puts( "c_HPS_ENABLED_HP_EXT = " & to_string(c_HPS_ENABLED_HP_EXT) );
      puts( "c_HPS_NUM_MDT_CH_EXT = " & integer'image(c_HPS_NUM_MDT_CH_EXT) );
      puts( "c_HPS_MAX_HP_EXT = " & integer'image(c_HPS_MAX_HP_EXT) );
      puts( "-------------------------------------------");
      puts( "c_MAX_POSSIBLE_HPS = " & integer'image(c_MAX_POSSIBLE_HPS) );
      puts( "c_MAX_NUM_HPS = " & integer'image(c_MAX_NUM_HPS) );
      puts( "c_NUM_SF_INPUTS = " & integer'image(c_NUM_SF_INPUTS) );
      puts( "c_NUM_SF_OUTPUTS = " & integer'image(c_NUM_SF_OUTPUTS) );
      puts( "-------------------------------------------");
      puts( "  Blocks configuration ");
      puts( "-------------------------------------------");
      puts( "c_NUM_NSP = " & integer'image(c_NUM_NSP) );
      puts( "c_TAR_ENABLED = " & std_logic'image(c_TAR_ENABLED) );
      puts( "c_UCM_ENABLED = " & std_logic'image(c_UCM_ENABLED) );
      puts( "c_H2S_ENABLED = " & std_logic'image(c_H2S_ENABLED) );
      puts( "c_MPL_ENABLED = " & std_logic'image(c_MPL_ENABLED) );
      puts( "c_SF_ENABLED = " & std_logic'image(c_SF_ENABLED) );
      puts( "c_SF_TYPE = " & std_logic'image(c_SF_TYPE) );
      puts( "c_SF_BYPASS = " & std_logic'image(c_SF_BYPASS) );
      puts( "c_PT_ENABLED = " & std_logic'image(c_PT_ENABLED) );
      puts( "c_PT_TYPE = " & std_logic'image(c_PT_TYPE) );
      puts( "c_MTC_ENABLED = " & std_logic'image(c_MTC_ENABLED) );
      puts( "c_DAQ_ENABLED = " & std_logic'image(c_DAQ_ENABLED) );
      puts( "c_FM_ENABLED = " & std_logic'image(c_FM_ENABLED) );
      puts( "c_NUM_DAQ_STREAMS = " & integer'image(c_NUM_DAQ_STREAMS) );
      puts( "-------------------------------------------");
      puts( "  Parallelitzation configuration ");
      puts( "-------------------------------------------");
      puts( "c_NUM_THREADS = " & integer'image(c_NUM_THREADS) );
      puts( "c_NUM_SUBTHREADS = " & integer'image(c_NUM_SUBTHREADS) );
      puts( "c_NUM_ACCEPTS = " & integer'image(c_NUM_ACCEPTS) );
      puts( "c_NUM_MTC = " & integer'image(c_NUM_MTC) );
      puts( "-------------------------------------------");
      puts( "  Latencies configuration ");
      puts( "-------------------------------------------");
      puts( "c_UCM_2HPS_LATENCY = " & integer'image(c_UCM_2HPS_LATENCY) );
      puts( "c_HEG_SF_START_DELAY = " & integer'image(c_HEG_SF_START_DELAY) );
      puts( "c_HEG_SF_END_DELAY = " & integer'image(c_HEG_SF_END_DELAY) );
      puts( "c_HEG_TIME_LOAD = " & integer'image(c_HEG_TIME_LOAD) );
      puts( "c_HEG_TIME_BUSY = " & integer'image(c_HEG_TIME_BUSY) );
      puts( "c_HEG_TIME_UNLOAD = " & integer'image(c_HEG_TIME_UNLOAD) );
      puts( "c_HEG_PROC_TIME = " & integer'image(c_HEG_PROC_TIME) );
      puts( "c_MPL_PL_B_LATENCY = " & integer'image(c_MPL_PL_B_LATENCY) );
      -- puts( "c_UCM_ENABLED = " & integer'image(c_UCM_ENABLED) );
      puts( "-------------------------------------------");
      puts( "----- END CONFIGURATION CONSTANTS ---------");
      puts( "-------------------------------------------");
    end if;

  end;
  
end package body cfg_display_pkg;
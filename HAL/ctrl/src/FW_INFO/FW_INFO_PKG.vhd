-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl
-- 2023-10-13 07:34:00

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package FW_INFO_CTRL is

   -- Custom types and functions --

   type FW_INFO_CONFIG_MON_t is record
      MAIN_CFG_COMPILE_HW : std_logic;
      MAIN_CFG_COMPILE_UL : std_logic;
      ST_nBARREL_ENDCAP : std_logic;
      ENDCAP_nSMALL_LARGE : std_logic;
      ENABLE_NEIGHBORS : std_logic;
      SECTOR_ID : std_logic_vector(32 - 1 downto 0);
      PHY_BARREL_R0 : std_logic_vector(32 - 1 downto 0);
      PHY_BARREL_R1 : std_logic_vector(32 - 1 downto 0);
      PHY_BARREL_R2 : std_logic_vector(32 - 1 downto 0);
      PHY_BARREL_R3 : std_logic_vector(32 - 1 downto 0);
      HPS_ENABLE_ST_INN : std_logic;
      HPS_ENABLE_ST_EXT : std_logic;
      HPS_ENABLE_ST_MID : std_logic;
      HPS_ENABLE_ST_OUT : std_logic;
      HPS_NUM_MDT_CH_INN : std_logic_vector(8 - 1 downto 0);
      HPS_NUM_MDT_CH_EXT : std_logic_vector(8 - 1 downto 0);
      HPS_NUM_MDT_CH_MID : std_logic_vector(8 - 1 downto 0);
      HPS_NUM_MDT_CH_OUT : std_logic_vector(8 - 1 downto 0);
      NUM_MTC : std_logic_vector(8 - 1 downto 0);
      NUM_NSP : std_logic_vector(8 - 1 downto 0);
      UCM_ENABLED : std_logic;
      MPL_ENABLED : std_logic;
      SF_ENABLED : std_logic;
      SF_TYPE : std_logic;
      NUM_DAQ_STREAMS : std_logic_vector(8 - 1 downto 0);
      NUM_SF_INPUTS : std_logic_vector(8 - 1 downto 0);
      NUM_SF_OUTPUTS : std_logic_vector(8 - 1 downto 0);
      MAX_NUM_SL : std_logic_vector(8 - 1 downto 0);
      NUM_THREADS : std_logic_vector(8 - 1 downto 0);
   end record FW_INFO_CONFIG_MON_t;
   attribute w of FW_INFO_CONFIG_MON_t : type is 261;
   function width(x: FW_INFO_CONFIG_MON_t) return natural;
   function convert(x: FW_INFO_CONFIG_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: FW_INFO_CONFIG_MON_t) return FW_INFO_CONFIG_MON_t;
   function zero(tpl: FW_INFO_CONFIG_MON_t) return FW_INFO_CONFIG_MON_t;

   type FW_INFO_MON_t is record
      CONFIG : FW_INFO_CONFIG_MON_t;
   end record FW_INFO_MON_t;
   attribute w of FW_INFO_MON_t : type is 261;
   function width(x: FW_INFO_MON_t) return natural;
   function convert(x: FW_INFO_MON_t; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: FW_INFO_MON_t) return FW_INFO_MON_t;
   function zero(tpl: FW_INFO_MON_t) return FW_INFO_MON_t;

end package FW_INFO_CTRL;

------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package body FW_INFO_CTRL is

   -- Custom types and functions --

   function width(x: FW_INFO_CONFIG_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.MAIN_CFG_COMPILE_HW);
      w := w + width(x.MAIN_CFG_COMPILE_UL);
      w := w + width(x.ST_nBARREL_ENDCAP);
      w := w + width(x.ENDCAP_nSMALL_LARGE);
      w := w + width(x.ENABLE_NEIGHBORS);
      w := w + width(x.SECTOR_ID);
      w := w + width(x.PHY_BARREL_R0);
      w := w + width(x.PHY_BARREL_R1);
      w := w + width(x.PHY_BARREL_R2);
      w := w + width(x.PHY_BARREL_R3);
      w := w + width(x.HPS_ENABLE_ST_INN);
      w := w + width(x.HPS_ENABLE_ST_EXT);
      w := w + width(x.HPS_ENABLE_ST_MID);
      w := w + width(x.HPS_ENABLE_ST_OUT);
      w := w + width(x.HPS_NUM_MDT_CH_INN);
      w := w + width(x.HPS_NUM_MDT_CH_EXT);
      w := w + width(x.HPS_NUM_MDT_CH_MID);
      w := w + width(x.HPS_NUM_MDT_CH_OUT);
      w := w + width(x.NUM_MTC);
      w := w + width(x.NUM_NSP);
      w := w + width(x.UCM_ENABLED);
      w := w + width(x.MPL_ENABLED);
      w := w + width(x.SF_ENABLED);
      w := w + width(x.SF_TYPE);
      w := w + width(x.NUM_DAQ_STREAMS);
      w := w + width(x.NUM_SF_INPUTS);
      w := w + width(x.NUM_SF_OUTPUTS);
      w := w + width(x.MAX_NUM_SL);
      w := w + width(x.NUM_THREADS);
      return w;
   end function width;
   function convert(x: FW_INFO_CONFIG_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.MAIN_CFG_COMPILE_HW);
         y(u to u+w-1) := convert(x.MAIN_CFG_COMPILE_HW, y(u to u+w-1));
         u := u + w;
         w := width(x.MAIN_CFG_COMPILE_UL);
         y(u to u+w-1) := convert(x.MAIN_CFG_COMPILE_UL, y(u to u+w-1));
         u := u + w;
         w := width(x.ST_nBARREL_ENDCAP);
         y(u to u+w-1) := convert(x.ST_nBARREL_ENDCAP, y(u to u+w-1));
         u := u + w;
         w := width(x.ENDCAP_nSMALL_LARGE);
         y(u to u+w-1) := convert(x.ENDCAP_nSMALL_LARGE, y(u to u+w-1));
         u := u + w;
         w := width(x.ENABLE_NEIGHBORS);
         y(u to u+w-1) := convert(x.ENABLE_NEIGHBORS, y(u to u+w-1));
         u := u + w;
         w := width(x.SECTOR_ID);
         y(u to u+w-1) := convert(x.SECTOR_ID, y(u to u+w-1));
         u := u + w;
         w := width(x.PHY_BARREL_R0);
         y(u to u+w-1) := convert(x.PHY_BARREL_R0, y(u to u+w-1));
         u := u + w;
         w := width(x.PHY_BARREL_R1);
         y(u to u+w-1) := convert(x.PHY_BARREL_R1, y(u to u+w-1));
         u := u + w;
         w := width(x.PHY_BARREL_R2);
         y(u to u+w-1) := convert(x.PHY_BARREL_R2, y(u to u+w-1));
         u := u + w;
         w := width(x.PHY_BARREL_R3);
         y(u to u+w-1) := convert(x.PHY_BARREL_R3, y(u to u+w-1));
         u := u + w;
         w := width(x.HPS_ENABLE_ST_INN);
         y(u to u+w-1) := convert(x.HPS_ENABLE_ST_INN, y(u to u+w-1));
         u := u + w;
         w := width(x.HPS_ENABLE_ST_EXT);
         y(u to u+w-1) := convert(x.HPS_ENABLE_ST_EXT, y(u to u+w-1));
         u := u + w;
         w := width(x.HPS_ENABLE_ST_MID);
         y(u to u+w-1) := convert(x.HPS_ENABLE_ST_MID, y(u to u+w-1));
         u := u + w;
         w := width(x.HPS_ENABLE_ST_OUT);
         y(u to u+w-1) := convert(x.HPS_ENABLE_ST_OUT, y(u to u+w-1));
         u := u + w;
         w := width(x.HPS_NUM_MDT_CH_INN);
         y(u to u+w-1) := convert(x.HPS_NUM_MDT_CH_INN, y(u to u+w-1));
         u := u + w;
         w := width(x.HPS_NUM_MDT_CH_EXT);
         y(u to u+w-1) := convert(x.HPS_NUM_MDT_CH_EXT, y(u to u+w-1));
         u := u + w;
         w := width(x.HPS_NUM_MDT_CH_MID);
         y(u to u+w-1) := convert(x.HPS_NUM_MDT_CH_MID, y(u to u+w-1));
         u := u + w;
         w := width(x.HPS_NUM_MDT_CH_OUT);
         y(u to u+w-1) := convert(x.HPS_NUM_MDT_CH_OUT, y(u to u+w-1));
         u := u + w;
         w := width(x.NUM_MTC);
         y(u to u+w-1) := convert(x.NUM_MTC, y(u to u+w-1));
         u := u + w;
         w := width(x.NUM_NSP);
         y(u to u+w-1) := convert(x.NUM_NSP, y(u to u+w-1));
         u := u + w;
         w := width(x.UCM_ENABLED);
         y(u to u+w-1) := convert(x.UCM_ENABLED, y(u to u+w-1));
         u := u + w;
         w := width(x.MPL_ENABLED);
         y(u to u+w-1) := convert(x.MPL_ENABLED, y(u to u+w-1));
         u := u + w;
         w := width(x.SF_ENABLED);
         y(u to u+w-1) := convert(x.SF_ENABLED, y(u to u+w-1));
         u := u + w;
         w := width(x.SF_TYPE);
         y(u to u+w-1) := convert(x.SF_TYPE, y(u to u+w-1));
         u := u + w;
         w := width(x.NUM_DAQ_STREAMS);
         y(u to u+w-1) := convert(x.NUM_DAQ_STREAMS, y(u to u+w-1));
         u := u + w;
         w := width(x.NUM_SF_INPUTS);
         y(u to u+w-1) := convert(x.NUM_SF_INPUTS, y(u to u+w-1));
         u := u + w;
         w := width(x.NUM_SF_OUTPUTS);
         y(u to u+w-1) := convert(x.NUM_SF_OUTPUTS, y(u to u+w-1));
         u := u + w;
         w := width(x.MAX_NUM_SL);
         y(u to u+w-1) := convert(x.MAX_NUM_SL, y(u to u+w-1));
         u := u + w;
         w := width(x.NUM_THREADS);
         y(u to u+w-1) := convert(x.NUM_THREADS, y(u to u+w-1));
      else
         w := width(x.MAIN_CFG_COMPILE_HW);
         y(u downto u-w+1) := convert(x.MAIN_CFG_COMPILE_HW, y(u downto u-w+1));
         u := u - w;
         w := width(x.MAIN_CFG_COMPILE_UL);
         y(u downto u-w+1) := convert(x.MAIN_CFG_COMPILE_UL, y(u downto u-w+1));
         u := u - w;
         w := width(x.ST_nBARREL_ENDCAP);
         y(u downto u-w+1) := convert(x.ST_nBARREL_ENDCAP, y(u downto u-w+1));
         u := u - w;
         w := width(x.ENDCAP_nSMALL_LARGE);
         y(u downto u-w+1) := convert(x.ENDCAP_nSMALL_LARGE, y(u downto u-w+1));
         u := u - w;
         w := width(x.ENABLE_NEIGHBORS);
         y(u downto u-w+1) := convert(x.ENABLE_NEIGHBORS, y(u downto u-w+1));
         u := u - w;
         w := width(x.SECTOR_ID);
         y(u downto u-w+1) := convert(x.SECTOR_ID, y(u downto u-w+1));
         u := u - w;
         w := width(x.PHY_BARREL_R0);
         y(u downto u-w+1) := convert(x.PHY_BARREL_R0, y(u downto u-w+1));
         u := u - w;
         w := width(x.PHY_BARREL_R1);
         y(u downto u-w+1) := convert(x.PHY_BARREL_R1, y(u downto u-w+1));
         u := u - w;
         w := width(x.PHY_BARREL_R2);
         y(u downto u-w+1) := convert(x.PHY_BARREL_R2, y(u downto u-w+1));
         u := u - w;
         w := width(x.PHY_BARREL_R3);
         y(u downto u-w+1) := convert(x.PHY_BARREL_R3, y(u downto u-w+1));
         u := u - w;
         w := width(x.HPS_ENABLE_ST_INN);
         y(u downto u-w+1) := convert(x.HPS_ENABLE_ST_INN, y(u downto u-w+1));
         u := u - w;
         w := width(x.HPS_ENABLE_ST_EXT);
         y(u downto u-w+1) := convert(x.HPS_ENABLE_ST_EXT, y(u downto u-w+1));
         u := u - w;
         w := width(x.HPS_ENABLE_ST_MID);
         y(u downto u-w+1) := convert(x.HPS_ENABLE_ST_MID, y(u downto u-w+1));
         u := u - w;
         w := width(x.HPS_ENABLE_ST_OUT);
         y(u downto u-w+1) := convert(x.HPS_ENABLE_ST_OUT, y(u downto u-w+1));
         u := u - w;
         w := width(x.HPS_NUM_MDT_CH_INN);
         y(u downto u-w+1) := convert(x.HPS_NUM_MDT_CH_INN, y(u downto u-w+1));
         u := u - w;
         w := width(x.HPS_NUM_MDT_CH_EXT);
         y(u downto u-w+1) := convert(x.HPS_NUM_MDT_CH_EXT, y(u downto u-w+1));
         u := u - w;
         w := width(x.HPS_NUM_MDT_CH_MID);
         y(u downto u-w+1) := convert(x.HPS_NUM_MDT_CH_MID, y(u downto u-w+1));
         u := u - w;
         w := width(x.HPS_NUM_MDT_CH_OUT);
         y(u downto u-w+1) := convert(x.HPS_NUM_MDT_CH_OUT, y(u downto u-w+1));
         u := u - w;
         w := width(x.NUM_MTC);
         y(u downto u-w+1) := convert(x.NUM_MTC, y(u downto u-w+1));
         u := u - w;
         w := width(x.NUM_NSP);
         y(u downto u-w+1) := convert(x.NUM_NSP, y(u downto u-w+1));
         u := u - w;
         w := width(x.UCM_ENABLED);
         y(u downto u-w+1) := convert(x.UCM_ENABLED, y(u downto u-w+1));
         u := u - w;
         w := width(x.MPL_ENABLED);
         y(u downto u-w+1) := convert(x.MPL_ENABLED, y(u downto u-w+1));
         u := u - w;
         w := width(x.SF_ENABLED);
         y(u downto u-w+1) := convert(x.SF_ENABLED, y(u downto u-w+1));
         u := u - w;
         w := width(x.SF_TYPE);
         y(u downto u-w+1) := convert(x.SF_TYPE, y(u downto u-w+1));
         u := u - w;
         w := width(x.NUM_DAQ_STREAMS);
         y(u downto u-w+1) := convert(x.NUM_DAQ_STREAMS, y(u downto u-w+1));
         u := u - w;
         w := width(x.NUM_SF_INPUTS);
         y(u downto u-w+1) := convert(x.NUM_SF_INPUTS, y(u downto u-w+1));
         u := u - w;
         w := width(x.NUM_SF_OUTPUTS);
         y(u downto u-w+1) := convert(x.NUM_SF_OUTPUTS, y(u downto u-w+1));
         u := u - w;
         w := width(x.MAX_NUM_SL);
         y(u downto u-w+1) := convert(x.MAX_NUM_SL, y(u downto u-w+1));
         u := u - w;
         w := width(x.NUM_THREADS);
         y(u downto u-w+1) := convert(x.NUM_THREADS, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FW_INFO_CONFIG_MON_t) return FW_INFO_CONFIG_MON_t is
      variable y : FW_INFO_CONFIG_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.MAIN_CFG_COMPILE_HW);
         y.MAIN_CFG_COMPILE_HW := convert(x(u to u+w-1), tpl.MAIN_CFG_COMPILE_HW);
         u := u + w;
         w := width(tpl.MAIN_CFG_COMPILE_UL);
         y.MAIN_CFG_COMPILE_UL := convert(x(u to u+w-1), tpl.MAIN_CFG_COMPILE_UL);
         u := u + w;
         w := width(tpl.ST_nBARREL_ENDCAP);
         y.ST_nBARREL_ENDCAP := convert(x(u to u+w-1), tpl.ST_nBARREL_ENDCAP);
         u := u + w;
         w := width(tpl.ENDCAP_nSMALL_LARGE);
         y.ENDCAP_nSMALL_LARGE := convert(x(u to u+w-1), tpl.ENDCAP_nSMALL_LARGE);
         u := u + w;
         w := width(tpl.ENABLE_NEIGHBORS);
         y.ENABLE_NEIGHBORS := convert(x(u to u+w-1), tpl.ENABLE_NEIGHBORS);
         u := u + w;
         w := width(tpl.SECTOR_ID);
         y.SECTOR_ID := convert(x(u to u+w-1), tpl.SECTOR_ID);
         u := u + w;
         w := width(tpl.PHY_BARREL_R0);
         y.PHY_BARREL_R0 := convert(x(u to u+w-1), tpl.PHY_BARREL_R0);
         u := u + w;
         w := width(tpl.PHY_BARREL_R1);
         y.PHY_BARREL_R1 := convert(x(u to u+w-1), tpl.PHY_BARREL_R1);
         u := u + w;
         w := width(tpl.PHY_BARREL_R2);
         y.PHY_BARREL_R2 := convert(x(u to u+w-1), tpl.PHY_BARREL_R2);
         u := u + w;
         w := width(tpl.PHY_BARREL_R3);
         y.PHY_BARREL_R3 := convert(x(u to u+w-1), tpl.PHY_BARREL_R3);
         u := u + w;
         w := width(tpl.HPS_ENABLE_ST_INN);
         y.HPS_ENABLE_ST_INN := convert(x(u to u+w-1), tpl.HPS_ENABLE_ST_INN);
         u := u + w;
         w := width(tpl.HPS_ENABLE_ST_EXT);
         y.HPS_ENABLE_ST_EXT := convert(x(u to u+w-1), tpl.HPS_ENABLE_ST_EXT);
         u := u + w;
         w := width(tpl.HPS_ENABLE_ST_MID);
         y.HPS_ENABLE_ST_MID := convert(x(u to u+w-1), tpl.HPS_ENABLE_ST_MID);
         u := u + w;
         w := width(tpl.HPS_ENABLE_ST_OUT);
         y.HPS_ENABLE_ST_OUT := convert(x(u to u+w-1), tpl.HPS_ENABLE_ST_OUT);
         u := u + w;
         w := width(tpl.HPS_NUM_MDT_CH_INN);
         y.HPS_NUM_MDT_CH_INN := convert(x(u to u+w-1), tpl.HPS_NUM_MDT_CH_INN);
         u := u + w;
         w := width(tpl.HPS_NUM_MDT_CH_EXT);
         y.HPS_NUM_MDT_CH_EXT := convert(x(u to u+w-1), tpl.HPS_NUM_MDT_CH_EXT);
         u := u + w;
         w := width(tpl.HPS_NUM_MDT_CH_MID);
         y.HPS_NUM_MDT_CH_MID := convert(x(u to u+w-1), tpl.HPS_NUM_MDT_CH_MID);
         u := u + w;
         w := width(tpl.HPS_NUM_MDT_CH_OUT);
         y.HPS_NUM_MDT_CH_OUT := convert(x(u to u+w-1), tpl.HPS_NUM_MDT_CH_OUT);
         u := u + w;
         w := width(tpl.NUM_MTC);
         y.NUM_MTC := convert(x(u to u+w-1), tpl.NUM_MTC);
         u := u + w;
         w := width(tpl.NUM_NSP);
         y.NUM_NSP := convert(x(u to u+w-1), tpl.NUM_NSP);
         u := u + w;
         w := width(tpl.UCM_ENABLED);
         y.UCM_ENABLED := convert(x(u to u+w-1), tpl.UCM_ENABLED);
         u := u + w;
         w := width(tpl.MPL_ENABLED);
         y.MPL_ENABLED := convert(x(u to u+w-1), tpl.MPL_ENABLED);
         u := u + w;
         w := width(tpl.SF_ENABLED);
         y.SF_ENABLED := convert(x(u to u+w-1), tpl.SF_ENABLED);
         u := u + w;
         w := width(tpl.SF_TYPE);
         y.SF_TYPE := convert(x(u to u+w-1), tpl.SF_TYPE);
         u := u + w;
         w := width(tpl.NUM_DAQ_STREAMS);
         y.NUM_DAQ_STREAMS := convert(x(u to u+w-1), tpl.NUM_DAQ_STREAMS);
         u := u + w;
         w := width(tpl.NUM_SF_INPUTS);
         y.NUM_SF_INPUTS := convert(x(u to u+w-1), tpl.NUM_SF_INPUTS);
         u := u + w;
         w := width(tpl.NUM_SF_OUTPUTS);
         y.NUM_SF_OUTPUTS := convert(x(u to u+w-1), tpl.NUM_SF_OUTPUTS);
         u := u + w;
         w := width(tpl.MAX_NUM_SL);
         y.MAX_NUM_SL := convert(x(u to u+w-1), tpl.MAX_NUM_SL);
         u := u + w;
         w := width(tpl.NUM_THREADS);
         y.NUM_THREADS := convert(x(u to u+w-1), tpl.NUM_THREADS);
      else
         w := width(tpl.MAIN_CFG_COMPILE_HW);
         y.MAIN_CFG_COMPILE_HW := convert(x(u downto u-w+1), tpl.MAIN_CFG_COMPILE_HW);
         u := u - w;
         w := width(tpl.MAIN_CFG_COMPILE_UL);
         y.MAIN_CFG_COMPILE_UL := convert(x(u downto u-w+1), tpl.MAIN_CFG_COMPILE_UL);
         u := u - w;
         w := width(tpl.ST_nBARREL_ENDCAP);
         y.ST_nBARREL_ENDCAP := convert(x(u downto u-w+1), tpl.ST_nBARREL_ENDCAP);
         u := u - w;
         w := width(tpl.ENDCAP_nSMALL_LARGE);
         y.ENDCAP_nSMALL_LARGE := convert(x(u downto u-w+1), tpl.ENDCAP_nSMALL_LARGE);
         u := u - w;
         w := width(tpl.ENABLE_NEIGHBORS);
         y.ENABLE_NEIGHBORS := convert(x(u downto u-w+1), tpl.ENABLE_NEIGHBORS);
         u := u - w;
         w := width(tpl.SECTOR_ID);
         y.SECTOR_ID := convert(x(u downto u-w+1), tpl.SECTOR_ID);
         u := u - w;
         w := width(tpl.PHY_BARREL_R0);
         y.PHY_BARREL_R0 := convert(x(u downto u-w+1), tpl.PHY_BARREL_R0);
         u := u - w;
         w := width(tpl.PHY_BARREL_R1);
         y.PHY_BARREL_R1 := convert(x(u downto u-w+1), tpl.PHY_BARREL_R1);
         u := u - w;
         w := width(tpl.PHY_BARREL_R2);
         y.PHY_BARREL_R2 := convert(x(u downto u-w+1), tpl.PHY_BARREL_R2);
         u := u - w;
         w := width(tpl.PHY_BARREL_R3);
         y.PHY_BARREL_R3 := convert(x(u downto u-w+1), tpl.PHY_BARREL_R3);
         u := u - w;
         w := width(tpl.HPS_ENABLE_ST_INN);
         y.HPS_ENABLE_ST_INN := convert(x(u downto u-w+1), tpl.HPS_ENABLE_ST_INN);
         u := u - w;
         w := width(tpl.HPS_ENABLE_ST_EXT);
         y.HPS_ENABLE_ST_EXT := convert(x(u downto u-w+1), tpl.HPS_ENABLE_ST_EXT);
         u := u - w;
         w := width(tpl.HPS_ENABLE_ST_MID);
         y.HPS_ENABLE_ST_MID := convert(x(u downto u-w+1), tpl.HPS_ENABLE_ST_MID);
         u := u - w;
         w := width(tpl.HPS_ENABLE_ST_OUT);
         y.HPS_ENABLE_ST_OUT := convert(x(u downto u-w+1), tpl.HPS_ENABLE_ST_OUT);
         u := u - w;
         w := width(tpl.HPS_NUM_MDT_CH_INN);
         y.HPS_NUM_MDT_CH_INN := convert(x(u downto u-w+1), tpl.HPS_NUM_MDT_CH_INN);
         u := u - w;
         w := width(tpl.HPS_NUM_MDT_CH_EXT);
         y.HPS_NUM_MDT_CH_EXT := convert(x(u downto u-w+1), tpl.HPS_NUM_MDT_CH_EXT);
         u := u - w;
         w := width(tpl.HPS_NUM_MDT_CH_MID);
         y.HPS_NUM_MDT_CH_MID := convert(x(u downto u-w+1), tpl.HPS_NUM_MDT_CH_MID);
         u := u - w;
         w := width(tpl.HPS_NUM_MDT_CH_OUT);
         y.HPS_NUM_MDT_CH_OUT := convert(x(u downto u-w+1), tpl.HPS_NUM_MDT_CH_OUT);
         u := u - w;
         w := width(tpl.NUM_MTC);
         y.NUM_MTC := convert(x(u downto u-w+1), tpl.NUM_MTC);
         u := u - w;
         w := width(tpl.NUM_NSP);
         y.NUM_NSP := convert(x(u downto u-w+1), tpl.NUM_NSP);
         u := u - w;
         w := width(tpl.UCM_ENABLED);
         y.UCM_ENABLED := convert(x(u downto u-w+1), tpl.UCM_ENABLED);
         u := u - w;
         w := width(tpl.MPL_ENABLED);
         y.MPL_ENABLED := convert(x(u downto u-w+1), tpl.MPL_ENABLED);
         u := u - w;
         w := width(tpl.SF_ENABLED);
         y.SF_ENABLED := convert(x(u downto u-w+1), tpl.SF_ENABLED);
         u := u - w;
         w := width(tpl.SF_TYPE);
         y.SF_TYPE := convert(x(u downto u-w+1), tpl.SF_TYPE);
         u := u - w;
         w := width(tpl.NUM_DAQ_STREAMS);
         y.NUM_DAQ_STREAMS := convert(x(u downto u-w+1), tpl.NUM_DAQ_STREAMS);
         u := u - w;
         w := width(tpl.NUM_SF_INPUTS);
         y.NUM_SF_INPUTS := convert(x(u downto u-w+1), tpl.NUM_SF_INPUTS);
         u := u - w;
         w := width(tpl.NUM_SF_OUTPUTS);
         y.NUM_SF_OUTPUTS := convert(x(u downto u-w+1), tpl.NUM_SF_OUTPUTS);
         u := u - w;
         w := width(tpl.MAX_NUM_SL);
         y.MAX_NUM_SL := convert(x(u downto u-w+1), tpl.MAX_NUM_SL);
         u := u - w;
         w := width(tpl.NUM_THREADS);
         y.NUM_THREADS := convert(x(u downto u-w+1), tpl.NUM_THREADS);
      end if;
      return y;
   end function convert;
   function zero(tpl: FW_INFO_CONFIG_MON_t) return FW_INFO_CONFIG_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FW_INFO_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.CONFIG);
      return w;
   end function width;
   function convert(x: FW_INFO_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.CONFIG);
         y(u to u+w-1) := convert(x.CONFIG, y(u to u+w-1));
      else
         w := width(x.CONFIG);
         y(u downto u-w+1) := convert(x.CONFIG, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FW_INFO_MON_t) return FW_INFO_MON_t is
      variable y : FW_INFO_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.CONFIG);
         y.CONFIG := convert(x(u to u+w-1), tpl.CONFIG);
      else
         w := width(tpl.CONFIG);
         y.CONFIG := convert(x(u downto u-w+1), tpl.CONFIG);
      end if;
      return y;
   end function convert;
   function zero(tpl: FW_INFO_MON_t) return FW_INFO_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

end package body FW_INFO_CTRL;

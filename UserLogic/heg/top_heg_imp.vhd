--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: heg
-- File: top_heg_imp.vhd
-- Module: <<moduleName>>
-- File PATH: /top_heg_imp.vhd
-- -----
-- File Created: Thursday, 14th April 2022 8:57:28 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Sunday, 2nd October 2022 7:53:41 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2022-10-02	GLdL	Update of old TB with new CSV pkg
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
-- use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;

package heg_imp_pkg is
  type ctrl_aabt is array (c_MAX_NUM_ST -1 downto 0) of std_logic_vector(c_NUM_THREADS -1 downto 0);
  type mon_aabt is array (c_MAX_NUM_ST -1 downto 0) of std_logic_vector(c_NUM_THREADS -1 downto 0);
  type ucm2heg_aabt is array (c_MAX_NUM_ST -1 downto 0) of std_logic_vector(c_NUM_THREADS -1 downto 0);
  type hps_pc2heg_aabt is array (c_MAX_NUM_ST -1 downto 0) of std_logic_vector(c_TOTAL_MAX_NUM_HP -1 downto 0);
  type hps_heg2sf_aabt is array (c_MAX_NUM_ST -1 downto 0) of std_logic_vector(c_NUM_THREADS -1 downto 0);
end package ;

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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

library work;
use work.heg_imp_pkg.all;

entity top_heg is
  generic(
    g_ST_ENABLE         : std_logic_vector(3 downto 0) := (others => '0');
    g_THREAD            : std_logic_vector(3 downto 0) := (others => '0')
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';
    -- configuration
    ctrl_aab              : in ctrl_aabt;
    mon_aab               : out mon_aabt;
    -- SLc
    i_uCM_data_aab        : in ucm2heg_aabt;
    -- MDT hit
    i_mdt_full_data_aab  : in hps_pc2heg_aabt;
    -- to Segment finder
    o_sf_control_aab      : out hps_heg2sf_aabt;
    o_sf_slc_data_aab     : out hps_heg2sf_aabt;
    o_sf_mdt_data_aab     : out hps_heg2sf_aabt
  );
end entity top_heg;

architecture beh of top_heg is

begin
  ST_FOR: for st_i in 0 to c_MAX_NUM_ST-1 generate
    ST_IG: if g_ST_ENABLE(st_i) generate
      signal i_mdt_full_data_av   : heg_pc2heg_avt(c_HP_NUM_SECTOR_STATION(st_i) -1 downto 0);
    begin
      HP_FOR: for hp_i in c_HP_NUM_SECTOR_STATION(st_i) -1 downto 0 generate
        des1 : entity shared_lib.vhdl_utils_deserializer 
          generic map (g_DATA_WIDTH => i_mdt_full_data_av(hp_i)'length)
          port map(clk => clk,rst  => rst,i_data => i_mdt_full_data_aab(st_i)(hp_i),o_data => i_mdt_full_data_av(hp_i));
      end generate;
      TH_FOR: for th_i in 0 to c_NUM_THREADS-1 generate
        TH_IF: if g_THREAD(th_i) generate
          signal ctrl_r             : HPS_HEG_HEG_CTRL_t;
          signal mon_r              : HPS_HEG_HEG_MON_t;
          signal ctrl_v             : std_logic_vector(HPS_HEG_HEG_CTRL_t'w -1 downto 0);
          signal mon_v              : std_logic_vector(HPS_HEG_HEG_MON_t'w -1 downto 0);
          signal i_uCM_data_rv        : ucm2hps_vt;
          signal i_uCM_data_v         : std_logic_vector(i_uCM_data_rv'range);
          signal o_sf_control_rv      : heg_ctrl2sf_vt;
          signal o_sf_slc_data_v      : heg2sfslc_vt;
          signal o_sf_mdt_data_v      : heg2sfhit_vt;
        begin
          ctrl : entity shared_lib.vhdl_utils_deserializer 
          generic map (g_DATA_WIDTH => ctrl_v'length) 
          port map(clk => clk,rst  => rst,i_data => ctrl_aab(st_i)(th_i),o_data => ctrl_v);
          mon_aab(st_i)(th_i) <= xor_reduce(mon_v);

          --------------------------------------------------------------
          des0 : entity shared_lib.vhdl_utils_deserializer 
            generic map (g_DATA_WIDTH => i_uCM_data_v'length)
            port map(clk => clk,rst  => rst,i_data => i_uCM_data_aab(st_i)(th_i),o_data => i_uCM_data_v);
          -- i_uCM_data_v <= i_uCM_data_v;
          --------------------------------------------------------------
          o_sf_control_aab(st_i)(th_i) <= xor_reduce(o_sf_control_rv);
          o_sf_slc_data_aab(st_i)(th_i) <= xor_reduce(o_sf_slc_data_v);
          o_sf_mdt_data_aab(st_i)(th_i) <= xor_reduce(o_sf_mdt_data_v);
          --------------------------------------------------------------
          HEG : entity heg_lib.heg
            generic map(
              g_STATION_RADIUS    => st_i,
              g_HPS_NUM_MDT_CH    => c_HP_NUM_SECTOR_STATION(st_i)
            )
            port map(
              clk                 => CLK,
              rst                 => rst,
              glob_en             => glob_en,
              -- configuration+
              ctrl_v              => ctrl_v,
              mon_v              => mon_v,
              -- SLc
              i_uCM_data_v          => i_uCM_data_v,
              -- MDT hit
              i_mdt_full_data_av     => i_mdt_full_data_av,
              -- to Segment finder
              o_sf_control_v        => o_sf_control_rv,
              o_sf_slc_data_v       => o_sf_slc_data_v,
              o_sf_mdt_data_v       => o_sf_mdt_data_v
          );
        end generate TH_IF;
      end generate TH_FOR;
    end generate ST_IG;    
  end generate ST_FOR;
end beh;



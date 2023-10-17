--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: hps
-- File: top_hps_imp.vhd
-- Module: <<moduleName>>
-- File PATH: /top_hps_imp.vhd
-- -----
-- File Created: Thursday, 14th April 2022 8:57:28 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 27th September 2022 8:00:38 pm
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

package hps_imp_pkg is
  type hps_maxth_abt is array (3 downto 0) of std_logic_vector(c_NUM_THREADS -1 downto 0);
  type hps_maxhp_abt is array (3 downto 0) of std_logic_vector(c_TOTAL_MAX_NUM_HP -1 downto 0);
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
library hps_lib;
use hps_lib.hps_pkg.all;

library work;
use work.hps_imp_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

library fm_lib;
use fm_lib.fm_types.all;

entity top_hps is
  generic(
    -- g_HPS_MAX_HP : integer := 6;
    g_ST_ENABLE : std_logic_vector(3 downto 0) := (others => '0')
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena             : in std_logic := '1';
    -- control
    i_ctrl_ab        : in  std_logic_vector(3 downto 0);
    o_mon_ab         : out std_logic_vector(3 downto 0);
    -- control
    -- SLc
    i_uCM2hps_ab    : in hps_maxth_abt;--std_logic_vector(c_NUM_THREADS -1 downto 0);
    -- MDT hit
    i_mdt_tar_ab    : in hps_maxhp_abt;
    -- to pt calc
    o_hps2pt_ab      : out hps_maxth_abt;
    -- to pt calc
    o_hps2nsa_ab      : out hps_maxth_abt

  );
end entity top_hps;

architecture beh of top_hps is

  constant  c_CTRL_LEN      : integer := HPS_CTRL_t'w;--len(ctrl_r);
  constant c_MON_LEN        : integer := HPS_MON_t'w;--len(mon_r);

begin

  STATION_GEN: for st_i in 0 to 3 generate
    HPS: if g_ST_ENABLE(st_i)='1' generate
      -- constant st_i : integer := 0;
      signal ctrl_r         : HPS_CTRL_t;
      signal mon_r          : HPS_MON_t;
      signal ctrl_v         : std_logic_vector(c_CTRL_LEN -1 downto 0);
      signal mon_v          : std_logic_vector(c_MON_LEN -1 downto 0);
    
      signal uCM2hps_av        : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
      signal mdt_tar_av          : tar2hps_avt(c_HP_NUM_SECTOR_STATION(st_i) -1 downto 0);
      signal sf2pt_av               : sf2ptcalc_avt(c_NUM_THREADS -1 downto 0);
      signal fm_hps_sf_mon_inn_v : std_logic_vector(fm_hps_sf_mon'w-1 downto 0);
    begin
      ctrl : entity shared_lib.vhdl_utils_deserializer 
        generic map (g_DATA_WIDTH => c_CTRL_LEN) 
        port map(clk => clk,rst  => rst,i_data => i_ctrl_ab(st_i),o_data => ctrl_v);
      o_mon_ab(st_i) <= xor_reduce(mon_v);
      --------------------------------------------------------------
      for0: for th_i in c_NUM_THREADS -1 downto 0 generate
        des0 : entity shared_lib.vhdl_utils_deserializer 
          generic map (g_DATA_WIDTH => uCM2hps_av(th_i)'length)
          port map(clk => clk,rst  => rst,i_data => i_uCM2hps_ab(st_i)(th_i),o_data => uCM2hps_av(th_i));
      end generate;
      for1: for hp_i in c_HP_NUM_SECTOR_STATION(st_i) -1 downto 0 generate
        des1 : entity shared_lib.vhdl_utils_deserializer 
          generic map (g_DATA_WIDTH => mdt_tar_av(hp_i)'length)
          port map(clk => clk,rst  => rst,i_data => i_mdt_tar_ab(st_i)(hp_i),o_data => mdt_tar_av(hp_i));
      end generate;
      --------------------------------------------------------------
      for3: for th_i in c_NUM_THREADS -1 downto 0 generate
        o_hps2pt_ab(st_i)(th_i) <= xor_reduce(sf2pt_av(th_i));
      end generate;
      --------------------------------------------------------------
      HPS : entity hps_lib.hps
        generic map(
          g_STATION_RADIUS    => st_i,
          g_HPS_NUM_MDT_CH     => c_HP_NUM_SECTOR_STATION(st_i)
        )
        port map(
          clk                 => clk,
          rst                 => rst,
          glob_en             => ena,
          -- configuration & control
          ctrl_v              => ctrl_v,
          mon_v               => mon_v,
          fm_hps_mon_v =>  fm_hps_sf_mon_inn_v,
          -- SLc
          i_uCM2hps_av        => uCM2hps_av,
          -- MDT hit
          i_mdt_tar_av        => mdt_tar_av,
          -- to pt calc
          o_sf2pt_av          => sf2pt_av
      );
    end generate;
  end generate STATION_GEN;
 end beh;

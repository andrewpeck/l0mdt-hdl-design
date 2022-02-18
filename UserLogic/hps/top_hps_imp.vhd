--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;
-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;
-- use hegtypes_lib.heg_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

entity top_hps is
  generic(
    -- mdt type
    -- type mdt_type;
    -- parameters
    FLAVOUR             : integer := 0;
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH     : integer := 6 
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';

    -- control
    ctrl_b              : in  std_logic;
    mon_b               : out std_logic;

    -- control
    -- SLc
    i_uCM2hps_ab        : in std_logic_vector(c_NUM_THREADS -1 downto 0);
    -- MDT hit
    -- i_mdt_polmux_av    : in tar2hps_avt(g_HPS_NUM_MDT_CH -1 downto 0);
    i_mdt_tar_ab        : in std_logic_vector(g_HPS_NUM_MDT_CH -1 downto 0);
    -- to pt calc
    o_sf2pt_ab          : out std_logic_vector(c_NUM_THREADS -1 downto 0)
  );
end entity top_hps;

architecture beh of top_hps is

  signal ctrl_r             : HPS_CTRL_t;
  signal mon_r              : HPS_MON_t;
  constant  c_CTRL_LEN      : integer := len(ctrl_r);
  constant c_MON_LEN        : integer := len(mon_r);
  signal ctrl_v             : std_logic_vector(c_CTRL_LEN -1 downto 0);
  signal mon_v              : std_logic_vector(c_MON_LEN -1 downto 0);

  signal i_uCM2hps_av        : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal i_mdt_tar_av        : tar2hps_avt(g_HPS_NUM_MDT_CH -1 downto 0);
  signal o_sf2pt_av          : sf2pt_bus_avt(c_NUM_THREADS -1 downto 0);

begin

  ctrl : entity shared_lib.vhdl_utils_deserializer generic map (c_CTRL_LEN) port map(clk,rst,ctrl_b,ctrl_v);
  mon_b <= xor_reduce(mon_v);
  --------------------------------------------------------------
  for0: for i_th in c_NUM_THREADS -1 downto 0 generate
    des0 : entity shared_lib.vhdl_utils_deserializer 
      generic map (g_DATA_WIDTH => i_uCM2hps_av(i_th)'length)
      port map(clk => clk,rst  => rst,i_data => i_uCM2hps_ab(i_th),o_data => i_uCM2hps_av(i_th));
  end generate;
  for1: for i_h in c_HPS_MAX_ARRAY(FLAVOUR) -1 downto 0 generate
    des1 : entity shared_lib.vhdl_utils_deserializer 
      generic map (g_DATA_WIDTH => i_mdt_tar_av(i_h)'length)
      port map(clk => clk,rst  => rst,i_data => i_mdt_tar_ab(i_h),o_data => i_mdt_tar_av(i_h));
  end generate;
  --------------------------------------------------------------
  for3: for i_th in c_NUM_THREADS -1 downto 0 generate
    o_sf2pt_ab(i_th) <= xor_reduce(o_sf2pt_av(i_th));
  end generate;
  
  --------------------------------------------------------------

  HPS : entity hps_lib.hps
    generic map(
      g_STATION_RADIUS    => FLAVOUR,
      g_HPS_NUM_MDT_CH    => c_HPS_MAX_ARRAY(FLAVOUR)
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,

      ctrl_v => ctrl_v,
      mon_v => mon_v,

      -- configuration & control
      -- i_uCM_pam           => i_uCM_pam,
      -- SLc
      i_uCM2hps_av        => i_uCM2hps_av,
      -- MDT hit
      i_mdt_tar_av        => i_mdt_tar_av,
      -- to pt calc
      o_sf2pt_av          => o_sf2pt_av
    );


end beh;

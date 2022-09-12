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
    g_HPS_MAX_HP : integer := 6;
    -- g_ST_ACT : integer := 0;
    g_ST_ENABLE : std_logic_vector(3 downto 0) := (others => '0')
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena             : in std_logic := '1';
    -- control
    i_ctrl_inn_b        : in  std_logic;
    o_mon_inn_b         : out std_logic;
    -- control
    -- SLc
    i_uCM2hps_inn_ab    : in std_logic_vector(c_NUM_THREADS -1 downto 0);
    -- MDT hit
    i_mdt_tar_inn_ab    : in std_logic_vector(g_HPS_MAX_HP -1 downto 0);
    -- to pt calc
    o_sf2pt_inn_ab      : out std_logic_vector(c_NUM_THREADS -1 downto 0)
  );
end entity top_hps;

architecture beh of top_hps is

  signal ctrl_inn_r         : HPS_CTRL_t;
  signal mon_inn_r          : HPS_MON_t;
  constant  c_CTRL_LEN      : integer := HPS_CTRL_t'w;--len(ctrl_r);
  constant c_MON_LEN        : integer := HPS_MON_t'w;--len(mon_r);
  signal ctrl_inn_v         : std_logic_vector(c_CTRL_LEN -1 downto 0);
  signal mon_inn_v          : std_logic_vector(c_MON_LEN -1 downto 0);

  signal uCM2hps_inn_av        : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal mdt_tar_inn_av        : tar2hps_avt(g_HPS_MAX_HP -1 downto 0);
  signal sf2pt_inn_av          : sf2ptcalc_avt(c_NUM_THREADS -1 downto 0);

begin

  INN: if g_ST_ENABLE(0)='1' generate
    ctrl : entity shared_lib.vhdl_utils_deserializer 
      generic map (g_DATA_WIDTH => c_CTRL_LEN) 
      port map(clk => clk,rst  => rst,i_data => i_ctrl_inn_b,o_data => ctrl_inn_v);
    o_mon_inn_b <= xor_reduce(mon_inn_v);
    --------------------------------------------------------------
    for0: for i_th in c_NUM_THREADS -1 downto 0 generate
      des0 : entity shared_lib.vhdl_utils_deserializer 
        generic map (g_DATA_WIDTH => uCM2hps_inn_av(i_th)'length)
        port map(clk => clk,rst  => rst,i_data => i_uCM2hps_inn_ab(i_th),o_data => uCM2hps_inn_av(i_th));
    end generate;
    for1: for i_h in c_HP_NUM_SECTOR_STATION(0) -1 downto 0 generate
      des1 : entity shared_lib.vhdl_utils_deserializer 
        generic map (g_DATA_WIDTH => mdt_tar_inn_av(i_h)'length)
        port map(clk => clk,rst  => rst,i_data => i_mdt_tar_inn_ab(i_h),o_data => mdt_tar_inn_av(i_h));
    end generate;
    --------------------------------------------------------------
    for3: for i_th in c_NUM_THREADS -1 downto 0 generate
      o_sf2pt_inn_ab(i_th) <= xor_reduce(sf2pt_inn_av(i_th));
    end generate;
    --------------------------------------------------------------
    HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 0,
        g_HPS_NUM_MDT_CH     => c_HP_NUM_SECTOR_STATION(0)
      )
      port map(
        clk                 => clk,
        rst                 => rst,
        glob_en             => ena,
        -- configuration & control
        ctrl_v              => ctrl_inn_v,
        mon_v               => mon_inn_v,
        -- SLc
        i_uCM2hps_av        => uCM2hps_inn_av,
        -- MDT hit
        i_mdt_tar_av        => mdt_tar_inn_av,
        -- to pt calc
        o_sf2pt_av          => sf2pt_inn_av
    );
  end generate;
  -- HPS_MID_GEN: if ST_ENABLE(1)='1' generate
  -- end generate;
  -- HPS_OUT_GEN: if ST_ENABLE(2)='1' generate
  -- end generate;
  -- HPS_EXT_GEN: if ST_ENABLE(3)='1' generate
  -- end generate;

  ----------------------------------------------------
  -- OLD
  ----------------------------------------------------

  -- ctrl : entity shared_lib.vhdl_utils_deserializer 
  --   generic map (g_DATA_WIDTH => c_CTRL_LEN) 
  --   port map(clk => clk,rst  => rst,i_data => ctrl_b,o_data => ctrl_v);
  -- mon_b <= xor_reduce(mon_v);
  -- --------------------------------------------------------------
  -- for0: for i_th in c_NUM_THREADS -1 downto 0 generate
  --   des0 : entity shared_lib.vhdl_utils_deserializer 
  --     generic map (g_DATA_WIDTH => i_uCM2hps_av(i_th)'length)
  --     port map(clk => clk,rst  => rst,i_data => i_uCM2hps_ab(i_th),o_data => i_uCM2hps_av(i_th));
  -- end generate;
  -- for1: for i_h in c_HPS_MAX_ARRAY(g_ST_ACT) -1 downto 0 generate
  --   des1 : entity shared_lib.vhdl_utils_deserializer 
  --     generic map (g_DATA_WIDTH => i_mdt_tar_av(i_h)'length)
  --     port map(clk => clk,rst  => rst,i_data => i_mdt_tar_ab(i_h),o_data => i_mdt_tar_av(i_h));
  -- end generate;
  -- --------------------------------------------------------------
  -- for3: for i_th in c_NUM_THREADS -1 downto 0 generate
  --   o_sf2pt_ab(i_th) <= xor_reduce(o_sf2pt_av(i_th));
  -- end generate;
  
  -- --------------------------------------------------------------

  -- HPS : entity hps_lib.hps
  --   generic map(
  --     g_STATION_RADIUS    => g_ST_ACT,
  --     g_HPS_NUM_MDT_CH    => c_HPS_MAX_ARRAY(g_ST_ACT)
  --   )
  --   port map(
  --     clk                 => clk,
  --     rst                 => rst,
  --     glob_en             => glob_en,

  --     ctrl_v => ctrl_v,
  --     mon_v => mon_v,

  --     -- configuration & control
  --     -- i_uCM_pam           => i_uCM_pam,
  --     -- SLc
  --     i_uCM2hps_av        => i_uCM2hps_av,
  --     -- MDT hit
  --     i_mdt_tar_av        => i_mdt_tar_av,
  --     -- to pt calc
  --     o_sf2pt_av          => o_sf2pt_av
  --   );




end beh;

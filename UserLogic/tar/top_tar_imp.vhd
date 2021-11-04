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

library tar_lib;
use tar_lib.tar_pkg.all;

library ctrl_lib;
use ctrl_lib.tar_CTRL.all;


entity top_tar is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    ctrl_b            : in  std_logic; --  : in  TAR_CTRL_t;
    mon_b             : out std_logic;--  : out TAR_MON_t;
    -- TDC Hits from Polmux
    i_inn_tdc_hits_ab    : in  std_logic_vector (c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tdc_hits_ab    : in  std_logic_vector (c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tdc_hits_ab    : in  std_logic_vector (c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tdc_hits_ab    : in  std_logic_vector (c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC Hits from Tar
    -- i_inn_tar_hits_av    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0);
    -- i_mid_tar_hits_av    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0);
    -- i_out_tar_hits_av    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0);
    -- i_ext_tar_hits_av    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC polmux from Tar
    o_inn_tdc_hits_ab    : out std_logic_vector(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tdc_hits_ab    : out std_logic_vector(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tdc_hits_ab    : out std_logic_vector(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tdc_hits_ab    : out std_logic_vector(c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_inn_tar_hits_ab    : out std_logic_vector(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tar_hits_ab    : out std_logic_vector(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tar_hits_ab    : out std_logic_vector(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tar_hits_ab    : out std_logic_vector(c_HPS_MAX_HP_EXT -1 downto 0)
  );
end entity top_tar;

architecture beh of top_tar is

  constant  c_CTRL_LEN :  integer := 1711;
  constant c_MON_LEN : integer := 1042;
  signal ctrl_r            : tar_CTRL_t;
  signal mon_r             : tar_MON_t;
  signal ctrl_v            : std_logic_vector(c_CTRL_LEN -1 downto 0);
  signal mon_v             : std_logic_vector(c_MON_LEN -1 downto 0);

  signal i_inn_tdc_hits_av    : mdt_polmux_bus_avt (c_HPS_MAX_HP_INN -1 downto 0);
  signal i_mid_tdc_hits_av    : mdt_polmux_bus_avt (c_HPS_MAX_HP_MID -1 downto 0);
  signal i_out_tdc_hits_av    : mdt_polmux_bus_avt (c_HPS_MAX_HP_OUT -1 downto 0);
  signal i_ext_tdc_hits_av    : mdt_polmux_bus_avt (c_HPS_MAX_HP_EXT -1 downto 0);
  -- TDC Hits from Tar
  -- signal i_inn_tar_hits_av    : tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0);
  -- signal i_mid_tar_hits_av    : tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0);
  -- signal i_out_tar_hits_av    : tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0);
  -- signal i_ext_tar_hits_av    : tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0);
  -- TDC polmux from Tar
  signal o_inn_tdc_hits_av    : mdt_polmux_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal o_mid_tdc_hits_av    : mdt_polmux_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal o_out_tdc_hits_av    : mdt_polmux_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal o_ext_tdc_hits_av    : mdt_polmux_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);
  -- TDC Hits from Tar
  signal o_inn_tar_hits_av    : tar2hps_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal o_mid_tar_hits_av    : tar2hps_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal o_out_tar_hits_av    : tar2hps_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal o_ext_tar_hits_av    : tar2hps_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);

begin

  ctrl : entity shared_lib.vhdl_utils_deserializer generic map (c_CTRL_LEN) port map(clk,rst,ctrl_b,ctrl_v);
  mon_b <= xor_reduce(mon_v);
  --------------------------------------------------------------
  tdc_inn: for i_h in c_HPS_MAX_HP_INN - 1 downto 0 generate
    des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2TAR_LEN)port map(clk => clk,rst  => rst,i_data => i_inn_tdc_hits_ab(i_h),o_data => i_inn_tdc_hits_av(i_h));
    o_inn_tdc_hits_ab(i_h) <= xor_reduce(o_inn_tdc_hits_av(i_h));
    o_inn_tar_hits_ab(i_h) <= xor_reduce(o_inn_tar_hits_av(i_h));
  end generate;
  tdc_mid: for i_h in c_HPS_MAX_HP_MiD - 1 downto 0 generate
    des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2TAR_LEN)port map(clk => clk,rst  => rst,i_data => i_mid_tdc_hits_ab(i_h),o_data => i_mid_tdc_hits_av(i_h));
    o_mid_tdc_hits_ab(i_h) <= xor_reduce(o_mid_tdc_hits_av(i_h));
    o_mid_tar_hits_ab(i_h) <= xor_reduce(o_mid_tar_hits_av(i_h));
  end generate;
  tdc_out: for i_h in c_HPS_MAX_HP_OUT - 1 downto 0 generate
    des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2TAR_LEN)port map(clk => clk,rst  => rst,i_data => i_out_tdc_hits_ab(i_h),o_data => i_out_tdc_hits_av(i_h));
    o_out_tdc_hits_ab(i_h) <= xor_reduce(o_out_tdc_hits_av(i_h));
    o_out_tar_hits_ab(i_h) <= xor_reduce(o_out_tar_hits_av(i_h));
  end generate;
  tdc_ext: for i_h in c_HPS_MAX_HP_EXT - 1 downto 0 generate
    des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2TAR_LEN)port map(clk => clk,rst  => rst,i_data => i_ext_tdc_hits_ab(i_h),o_data => i_ext_tdc_hits_av(i_h));
    o_ext_tdc_hits_ab(i_h) <= xor_reduce(o_ext_tdc_hits_av(i_h));
    o_ext_tar_hits_ab(i_h) <= xor_reduce(o_ext_tar_hits_av(i_h));
  end generate;
  --------------------------------------------------------------

  TAR : entity tar_lib.tar
  port map (
    -- clock, control, and monitoring
    clk             => clk,
    rst             => rst,
    glob_en         => glob_en,
    --
    ctrl_v            => ctrl_v,
    mon_v             => mon_v,
    -- TDC Hits from Polmux
    i_inn_tdc_hits_av  => i_inn_tdc_hits_av,
    i_mid_tdc_hits_av  => i_mid_tdc_hits_av,
    i_out_tdc_hits_av  => i_out_tdc_hits_av,
    i_ext_tdc_hits_av  => i_ext_tdc_hits_av,
    -- candidates in from hal
    -- i_inn_tar_hits_av  => i_inn_tar_hits,
    -- i_mid_tar_hits_av  => i_mid_tar_hits,
    -- i_out_tar_hits_av  => i_out_tar_hits,
    -- i_ext_tar_hits_av  => i_ext_tar_hits,
    -- to daq
    o_inn_tdc_hits_av  => o_inn_tdc_hits_av,
    o_mid_tdc_hits_av  => o_mid_tdc_hits_av,
    o_out_tdc_hits_av  => o_out_tdc_hits_av,
    o_ext_tdc_hits_av  => o_ext_tdc_hits_av,
    -- outputs to h2s
    o_inn_tar_hits_av  => o_inn_tar_hits_av,
    o_mid_tar_hits_av  => o_mid_tar_hits_av,
    o_out_tar_hits_av  => o_out_tar_hits_av,
    o_ext_tar_hits_av  => o_ext_tar_hits_av

  );






end beh;

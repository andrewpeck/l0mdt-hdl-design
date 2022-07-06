--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: top_tar_imp.vhd
-- File PATH: /UserLogic/tar/top_tar_imp.vhd
-- Project PATH: /home/guille/ATLAS/l0mdt-fpga-design
-- -----
-- File Created: Tuesday, 23rd November 2021 2:24:35 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 15th December 2021 5:47:24 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2021-12-15	GLdL	Moving from all stations to only 1 station
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
  generic(
    g_HPS_MAX_HP : integer := 6;
    g_STATION :   integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    ctrl_b            : in  std_logic; --  : in  TAR_CTRL_t;
    mon_b             : out std_logic;--  : out TAR_MON_t;
    -- TDC Hits from Polmux
    i_tdc_hits_ab    : in  std_logic_vector (g_HPS_MAX_HP -1 downto 0);
    -- TDC polmux from Tar
    o_tdc_hits_ab    : out std_logic_vector(g_HPS_MAX_HP -1 downto 0);
    -- TDC Hits from Tar
    o_tar_hits_ab    : out std_logic_vector(g_HPS_MAX_HP -1 downto 0)

  );
end entity top_tar;

architecture beh of top_tar is

  signal ctrl_r             : tar_CTRL_t;
  signal mon_r              : tar_MON_t;
  constant  c_CTRL_LEN      : integer := tar_CTRL_t'w;
  constant c_MON_LEN        : integer := tar_MON_t'w;
  signal ctrl_v             : std_logic_vector(c_CTRL_LEN -1 downto 0);
  signal mon_v              : std_logic_vector(c_MON_LEN -1 downto 0);

  signal i_tdc_hits_av    : tdcpolmux2tar_avt (g_HPS_MAX_HP -1 downto 0);
  -- TDC polmux from Tar
  signal o_tdc_hits_av    : tdcpolmux2tar_avt(g_HPS_MAX_HP -1 downto 0);

  -- TDC Hits from Tar
  signal o_tar_hits_av    : tar2hps_avt(g_HPS_MAX_HP -1 downto 0);


begin

  ctrl : entity shared_lib.vhdl_utils_deserializer generic map (c_CTRL_LEN) port map(clk,rst,ctrl_b,ctrl_v);
  mon_b <= xor_reduce(mon_v);
  --------------------------------------------------------------
  tdc_inn: for i_h in g_HPS_MAX_HP - 1 downto 0 generate
    des : entity shared_lib.vhdl_utils_deserializer 
      generic map (
        g_DATA_WIDTH => i_tdc_hits_av(i_h)'length
      )
      port map(
        clk => clk,
        rst  => rst,
        i_data => i_tdc_hits_ab(i_h),
        o_data => i_tdc_hits_av(i_h)
      );
    o_tdc_hits_ab(i_h) <= xor_reduce(o_tdc_hits_av(i_h));
    o_tar_hits_ab(i_h) <= xor_reduce(o_tar_hits_av(i_h));
  end generate;
  --------------------------------------------------------------

  TAR : entity tar_lib.tar
  generic map(
    g_HPS_MAX_HP => g_HPS_MAX_HP,
    g_STATION => g_STATION
  )
  port map (
    -- clock, control, and monitoring
    clk             => clk,
    rst             => rst,
    glob_en         => glob_en,
    --
    ctrl_v            => ctrl_v,
    mon_v             => mon_v,
    -- TDC Hits from Polmux
    i_tdc_hits_av  => i_tdc_hits_av,
    -- to daq
    o_tdc_hits_av  => o_tdc_hits_av,

    -- outputs to h2s
    o_tar_hits_av  => o_tar_hits_av
  );






end beh;

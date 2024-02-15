--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ult_mpl.vhd
-- Module: <<moduleName>>
-- File PATH: /ult_mpl.vhd
-- -----
-- File Created: Thursday, 15th February 2024 9:45:20 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 15th February 2024 1:43:52 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library mpl_lib;
use mpl_lib.mpl_pkg.all;

library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;

library ult_lib;
  use ult_lib.ult_pkg.all;

entity pipeline is
  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    i_ull_slow_v : in ull_slow_vt;
    -- ttc_commands      : in  l0mdt_ttc_rt;
    --
    ctrl_v            : in std_logic_vector; -- : in  MPL_CTRL_t;
    mon_v             : out std_logic_vector;-- : out MPL_MON_t;
    -- Sector Logic Candidates from uCM
    i_ucm2pl_av       : in ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
    -- Sector Logic Candidates to Track fitting
    o_pl2pt_av        : out pl2ptcalc_avt(c_NUM_THREADS -1 downto 0);
    -- Sector Logic Candidates to mTC
    o_pl2mtc_av       : out pl2mtc_avt(c_MAX_NUM_SL -1 downto 0)
    );
end entity pipeline;

architecture beh of pipeline is
  signal i_ull_slow_r : ull_slow_rt;
  signal glob_en : std_logic;
  signal glob_rst : std_logic;
  signal glob_freezer : std_logic;

begin

  i_ull_slow_r <= convert(i_ull_slow_v,i_ull_slow_r);
  glob_en <= i_ull_slow_r.global_ena;
  glob_rst <= clock_and_control.rst or i_ull_slow_r.global_rst;
  glob_freezer <= i_ull_slow_r.global_freeze;
  
  MPL_EN : if c_MPL_ENABLED = '1' generate
    MPL : entity mpl_lib.mpl
    port map(
      clk             => clock_and_control.clk,
      rst             => clock_and_control.rst,
      glob_en         => glob_en,
      --
      ctrl_v          => ctrl_v,
      mon_v           => mon_v,
      --
      i_uCM2pl_av     => i_uCM2pl_av,
      o_pl2ptcalc_av  => o_pl2pt_av,
      o_pl2mtc_av     => o_pl2mtc_av
    );
  end generate;

  -- FM_CTRL_GEN : if c_FM_ENABLED generate

  -- else generate
    
  -- end generate;
  
  
  
end architecture beh;

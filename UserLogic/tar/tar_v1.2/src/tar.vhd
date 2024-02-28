--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: tar.vhd
-- File PATH: /UserLogictar/tar/tar_v1.0/src/tar.vhd
-- -----
-- File Created: Tuesday, 23rd November 2021 2:24:35 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 15th December 2021 1:32:07 pm
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

-- use shared_lib.detector_param_pkg.all;

library vamc_lib;

library tar_lib;
use tar_lib.tar_pkg.all;

library ctrl_lib;
use ctrl_lib.TAR_CTRL.all;

entity tar is
  generic(
    g_HPS_MAX_HP : integer := 6;
    g_STATION :   integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    ctrl_v            : in std_logic_vector; --  : in  TAR_CTRL_t;
    mon_v             : out std_logic_vector;--  : out TAR_MON_t;
    -- TDC Hits from Polmux
    i_tdc_hits_av    : in  tdcpolmux2tar_avt (g_HPS_MAX_HP -1 downto 0);
    -- TDC polmux from Tar
    o_tdc_hits_av    : out tdcpolmux2tar_avt(g_HPS_MAX_HP -1 downto 0);
    -- TDC Hits from Tar
    o_tar_hits_av    : out tar2hps_avt(g_HPS_MAX_HP -1 downto 0)

  );
end entity tar;

architecture beh of tar is
  --
  signal ctrl_r            : TAR_CTRL_t;
  signal mon_r             : TAR_MON_t;

  -- constant PL_ST_CTRL_LEN : integer := width(ctrl_r.PL_ST);--426;
  -- constant PL_ST_MON_LEN : integer := width(mon_r.PL_ST);--258;

  signal ctrl_pl_v : std_logic_vector(TAR_PL_ST_CTRL_t'w - 1 downto 0);--(len(ctrl_r.PL_ST.PL_ST(0))-1  downto 0);

  signal mon_pl_v : std_logic_vector(TAR_PL_ST_MON_t'w - 1 downto 0);--(len(mon_r.PL_ST.PL_ST(0))-1  downto 0);

  -- TDC polmux from Tar
  signal i_tdc_hits_ar : tdcpolmux2tar_art(g_HPS_MAX_HP -1 downto 0);

  signal local_en : std_logic;
  signal local_rst : std_logic;
  signal int_freeze : std_logic;

begin

  ctrl_r <= convert(ctrl_v,ctrl_r);
  mon_v <= convert(mon_r,mon_v);

  ctrl_pl_v <= convert(ctrl_r.PL_ST,ctrl_pl_v);

  mon_r.PL_ST <= convert(mon_pl_v,mon_r.PL_ST);

  SUPERVISOR : entity tar_lib.tar_supervisor
  port map(
    clk               => clk,
    rst               => rst,
    glob_en           => glob_en,      
    -- AXI to SoC
    i_actions           => ctrl_r.actions,
    i_configs           => ctrl_r.configs,
    o_status            => mon_r.status ,
    --
    o_freeze            => int_freeze,
    -- 
    o_local_en          => local_en,
    o_local_rst         => local_rst
  );
  
  -- TDC_INPUTS_GEN : if c_TAR_INSEL = '1' generate
  
  tdc_loop: for b_i in g_HPS_MAX_HP -1 downto 0 generate
    i_tdc_hits_ar(b_i) <= convert(i_tdc_hits_av(b_i),i_tdc_hits_ar(b_i));
  end generate tdc_loop;
  -- i_tdc_hits_ar <= convert(i_tdc_hits_av,i_tdc_hits_ar);

  TAR_PL : entity tar_lib.tar_station
    generic map(
      g_ARRAY_LEN => g_HPS_MAX_HP,
      g_STATION => g_STATION
    )
    port map (
      -- clock, control, and monitoring
      clk             => clk,
      rst             => local_rst,
      glob_en         => local_en,
      -- ctrl/mon
      ctrl_v          => ctrl_pl_v,
      mon_v           => mon_pl_v,
      -- supervisor
      i_freeze        => int_freeze,
      -- data
      i_tdc_hits_av   => i_tdc_hits_av,
      o_tdc_hits_av   => o_tdc_hits_av,
      o_tar_hits_av   =>  o_tar_hits_av
  );
   
end architecture beh;
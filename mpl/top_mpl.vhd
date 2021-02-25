--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Main pipe line
--  Description: pipelines between UCM - TF - MTC
--
--------------------------------------------------------------------------------
--  Revisions:
--      
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


entity top_mpl is

  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- AXI to SoC
    ctrl                : in  MPL_CTRL_t;
    mon                 : out MPL_MON_t;
    -- configuration, control & Monitoring
    -- SLc pipeline
    i_uCM2pl_av         : in ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0);
    o_pl2tf_av          : out pl2pt_bus_avt(c_NUM_THREADS -1 downto 0);
    o_pl2mtc_av         : out pl2mtc_bus_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity top_mpl;

architecture beh of top_mpl is
  
begin

  MPL : entity mpl_lib.mpl
  port map(
    clk             => clock_and_control.clk,
    rst             => clock_and_control.rst,
    glob_en         => glob_en,
    --
    ctrl              => ctrl,
    mon               => mon,
    --
    i_uCM2pl_av     => i_uCM2pl_av,
    o_pl2tf_av      => o_pl2pt_av,
    o_pl2mtc_av     => o_pl2mtc_av
  );
  
  
  
end architecture beh;

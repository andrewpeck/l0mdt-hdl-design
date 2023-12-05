--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: MDT tdc data addres remap
--  Description:
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

entity pipeline is
  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    --
    ctrl_v            : in std_logic_vector(MPL_CTRL_t'w -1 downto 0); -- : in  MPL_CTRL_t;
    mon_v             : out std_logic_vector(MPL_MON_t'w -1 downto 0);-- : out MPL_MON_t;
    -- Sector Logic Candidates from uCM
    i_ucm2pl_av       : in ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
    -- Sector Logic Candidates to Track fitting
    o_pl2pt_av        : out pl2ptcalc_avt(c_NUM_THREADS -1 downto 0);
    -- Sector Logic Candidates to mTC
    o_pl2mtc_av       : out pl2mtc_avt(c_MAX_NUM_SL -1 downto 0)
    );
end entity pipeline;

architecture beh of pipeline is
  signal glob_en : std_logic := '1' ;
begin

  glob_en <= '1';
  
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
  
  
  
end architecture beh;

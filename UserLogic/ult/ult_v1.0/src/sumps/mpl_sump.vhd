--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager Sump
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_misc.all;
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

entity mpl_sump is
  port (
    -- clock and control
    -- clock_and_control : in  l0mdt_control_rt;
    -- ttc_commands      : in  l0mdt_ttc_rt;
    -- ctrl              : in  H2S_CTRL_t;
    -- mon               : out H2S_MON_t;

    -- Sector Logic Candidates from uCM
    i_ucm2pl_av       : in ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
    -- Sector Logic Candidates to Track fitting
    o_pl2pt_av        : out pl2ptcalc_avt(c_NUM_THREADS -1 downto 0);
    -- Sector Logic Candidates to mTC
    o_pl2mtc_av       : out pl2mtc_avt(c_MAX_NUM_SL -1 downto 0);

    o_sump : out std_logic
  );
  
end entity mpl_sump;

architecture beh of mpl_sump is

  signal ucm2pl_av       : std_logic_vector(c_MAX_NUM_SL -1 downto 0);

begin

  o_pl2pt_av <= (others => (others => '0'));
  o_pl2mtc_av <= (others => (others => '0'));

    MDT_INN_SUMP: for I in 0 to c_MAX_NUM_SL -1 generate
      ucm2pl_av(I) <= xor_reduce(i_ucm2pl_av(I));
    end generate;

    o_sump <=   xor_reduce(ucm2pl_av);
  
end architecture beh;


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
 
library mtc_lib;
-- use mtc_lib.all;

entity mtc_sump is
  port (
    -- clock and control
    -- clock_and_control : in  l0mdt_control_rt;
    -- ttc_commands      : in  l0mdt_ttc_rt;
    -- ctrl              : in  H2S_CTRL_t;
    -- mon               : out H2S_MON_t;

    i_ptcalc          : in  ptcalc2mtc_avt(c_NUM_THREADS -1 downto 0);
    i_pl2mtc          : in  pl2mtc_avt(c_MAX_NUM_SL -1 downto 0);
    o_mtc             : out mtc_out_avt(c_NUM_MTC -1 downto 0);
    o_nsp             : out mtc2nsp_avt(c_NUM_NSP -1 downto 0);

    o_sump : out std_logic
  );
  
end entity mtc_sump;

architecture beh of mtc_sump is

  signal ptcalc     : std_logic_vector(c_NUM_THREADS - 1 downto 0);
  signal pl2mtc     : std_logic_vector(c_MAX_NUM_SL -1 downto 0);
  signal slc_data_neighborA_v  : std_logic;
  signal slc_data_neighborB_v  : std_logic;

begin

  o_mtc <= (others => (others => '0'));
  o_nsp <= (others => (others => '0'));

    TH_LOOP: for I in 0 to c_NUM_THREADS -1 generate
      ptcalc(I) <= xor_reduce(i_ptcalc(I));
    end generate;
    SL_LOOP: for I in 0 to c_MAX_NUM_SL -1 generate
      pl2mtc(I) <= xor_reduce(i_pl2mtc(I));
    end generate;
   
    o_sump <=   xor_reduce(ptcalc)
              xor xor_reduce(pl2mtc);
  
end architecture beh;


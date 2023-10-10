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
 
library ptc_lib;
library upt_lib;

entity ptc_sump is
  port (
    -- clock and control
    -- clock_and_control : in  l0mdt_control_rt;
    -- ttc_commands      : in  l0mdt_ttc_rt;
    -- ctrl              : in  H2S_CTRL_t;
    -- mon               : out H2S_MON_t;

    i_inn_segments            : in  sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
    i_mid_segments            : in  sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
    i_out_segments            : in  sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
    i_ext_segments            : in  sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
    i_minus_neighbor_segments : in  sf2ptcalc_vt;
    i_plus_neighbor_segments  : in  sf2ptcalc_vt;
    i_pl2pt_av                : in  pl2ptcalc_avt(c_NUM_THREADS-1 downto 0);

    o_pt2mtc                  : out ptcalc2mtc_avt(c_NUM_THREADS -1 downto 0);

    o_sump : out std_logic
  );
  
end entity ptc_sump;

architecture beh of ptc_sump is

  signal inn_segments            :std_logic_vector(c_NUM_THREADS-1 downto 0);
  signal mid_segments            :std_logic_vector(c_NUM_THREADS-1 downto 0);
  signal out_segments            :std_logic_vector(c_NUM_THREADS-1 downto 0);
  signal ext_segments            :std_logic_vector(c_NUM_THREADS-1 downto 0);
  signal minus_neighbor_segments :std_logic_vector(c_NUM_SF_INPUTS - 1 downto 0);
  signal plus_neighbor_segments  :std_logic_vector(c_NUM_SF_INPUTS - 1 downto 0);
  signal pl2pt_av                :std_logic_vector(c_NUM_THREADS-1 downto 0);

begin

  o_pt2mtc <= (others => (others => '0'));

    THREAD_LOOP: for I in 0 to c_NUM_THREADS -1 generate
      inn_segments(I) <= xor_reduce(i_inn_segments(I));
      mid_segments(I) <= xor_reduce(i_mid_segments(I));
      out_segments(I) <= xor_reduce(i_out_segments(I));
      ext_segments(I) <= xor_reduce(i_ext_segments(I));
      pl2pt_av(I) <= xor_reduce(i_pl2pt_av(I));
    end generate;
--    SF_LOOP: for I in 0 to c_NUM_SF_INPUTS -1 generate
--      minus_neighbor_segments(I) <= xor_reduce(i_minus_neighbor_segments(I));
--      plus_neighbor_segments(I) <= xor_reduce(i_plus_neighbor_segments(I));
--    end generate;
    -- MDT_INN_SUMP: for I in 0 to 2 generate
    --   pl2pt_av(I) <= xor_reduce(i_pl2pt_av(I));
    -- end generate;
   
    o_sump <=   xor_reduce(inn_segments           )
            xor xor_reduce(mid_segments           )
            xor xor_reduce(out_segments           )
            xor xor_reduce(ext_segments           )
            xor xor_reduce(minus_neighbor_segments)
            xor xor_reduce(plus_neighbor_segments )
            xor xor_reduce(pl2pt_av               );

  
end architecture beh;


--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit 2 segment
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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

entity h2s_sump is
  port (
    -- clock and control
    -- clock_and_control : in  l0mdt_control_rt;
    -- ttc_commands      : in  l0mdt_ttc_rt;
    -- ctrl              : in  H2S_CTRL_t;
    -- mon               : out H2S_MON_t;

    -- TDC Hits from Polmux
    i_inn_tar_hits_av  : in tar2hps_bus_avt (c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tar_hits_av  : in tar2hps_bus_avt (c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tar_hits_av  : in tar2hps_bus_avt (c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tar_hits_av  : in tar2hps_bus_avt (c_HPS_MAX_HP_EXT -1 downto 0);
    -- Sector Logic Candidates from uCM
    i_inn_slc_av       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    i_mid_slc_av       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    i_out_slc_av       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    i_ext_slc_av       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    -- Segments Out
    o_inn_segments_av  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    o_mid_segments_av  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    o_out_segments_av  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    o_ext_segments_av  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    -- Segments Out to Neighbor
    o_plus_neighbor_segments_av  : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    o_minus_neighbor_segments_av : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    
    o_sump : out std_logic
  );
  


end entity h2s_sump;

architecture beh of h2s_sump is

  signal inn_tar_hits_sump            : std_logic_vector (c_HPS_MAX_HP_INN-1 downto 0);
  signal mid_tar_hits_sump            : std_logic_vector (c_HPS_MAX_HP_MID-1 downto 0);
  signal out_tar_hits_sump            : std_logic_vector (c_HPS_MAX_HP_OUT-1 downto 0);
  signal ext_tar_hits_sump            : std_logic_vector (c_HPS_MAX_HP_EXT-1 downto 0);
  signal inn_slc_sump            : std_logic_vector (c_NUM_THREADS-1 downto 0);
  signal mid_slc_sump            : std_logic_vector (c_NUM_THREADS-1 downto 0);
  signal out_slc_sump            : std_logic_vector (c_NUM_THREADS-1 downto 0);
  signal ext_slc_sump            : std_logic_vector (c_NUM_THREADS-1 downto 0);
begin

    o_inn_segments_av <= (others => (others => '0'));
    o_mid_segments_av <= (others => (others => '0'));
    o_out_segments_av <= (others => (others => '0'));
    o_ext_segments_av <= (others => (others => '0'));
    o_plus_neighbor_segments_av <= (others => (others => '0'));
    o_minus_neighbor_segments_av <= (others => (others => '0'));

    MDT_INN_SUMP: for I in 0 to c_HPS_MAX_HP_INN-1 generate
      inn_tar_hits_sump(I) <= xor_reduce(i_inn_tar_hits_av(I));
    end generate;
    MDT_MID_SUMP: for I in 0 to c_HPS_MAX_HP_MID-1 generate
      mid_tar_hits_sump(I) <= xor_reduce(i_mid_tar_hits_av(I));
    end generate;
    MDT_OUT_SUMP: for I in 0 to c_HPS_MAX_HP_OUT-1 generate
      out_tar_hits_sump(I) <= xor_reduce(i_out_tar_hits_av(I));
    end generate;
    MDT_EXT_SUMP: for I in 0 to c_HPS_MAX_HP_EXT-1 generate
      ext_tar_hits_sump(I) <= xor_reduce(i_ext_tar_hits_av(I));
    end generate;

    SLC_SUMP: for I in 0 to c_NUM_THREADS-1 generate
      inn_slc_sump(I) <= xor_reduce(i_inn_slc_av(I));
      mid_slc_sump(I) <= xor_reduce(i_mid_slc_av(I));
      out_slc_sump(I) <= xor_reduce(i_out_slc_av(I));
      ext_slc_sump(I) <= xor_reduce(i_ext_slc_av(I));
    end generate;
   
    o_sump <=   xor_reduce(inn_tar_hits_sump)
              xor xor_reduce(mid_tar_hits_sump)
              xor xor_reduce(out_tar_hits_sump)
              xor xor_reduce(ext_tar_hits_sump)
              xor xor_reduce(inn_slc_sump     )
              xor xor_reduce(mid_slc_sump     )
              xor xor_reduce(out_slc_sump     )
              xor xor_reduce(ext_slc_sump     );
  
end architecture beh;


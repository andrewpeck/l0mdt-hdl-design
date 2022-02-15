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
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_sump is
  port (
    -- clock and control
    -- clock_and_control : in  l0mdt_control_rt;
    -- ttc_commands      : in  l0mdt_ttc_rt;
    -- ctrl              : in  H2S_CTRL_t;
    -- mon               : out H2S_MON_t;

    -- Sector Logic Candidates
    i_slc_data_mainA_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_mainB_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_neighborA_v : in slc_rx_rvt;
    i_slc_data_neighborB_v : in slc_rx_rvt;

    -- Sector Logic Candidates Out of X-point Switch
    o_uCM2hps_inn_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_mid_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_out_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_ext_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    -- pipeline
    o_uCM2pl_av             : out ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);

    o_sump : out std_logic
  );
  
end entity ucm_sump;

architecture beh of ucm_sump is

  signal slc_data_mainA_av     : std_logic_vector(2 downto 0);
  signal slc_data_mainB_av     : std_logic_vector(2 downto 0);
  signal slc_data_neighborA_v  : std_logic;
  signal slc_data_neighborB_v  : std_logic;

begin

    o_uCM2hps_inn_av <= (others => (others => '0'));
    o_uCM2hps_mid_av <= (others => (others => '0'));
    o_uCM2hps_out_av <= (others => (others => '0'));
    o_uCM2hps_ext_av <= (others => (others => '0'));
    o_uCM2pl_av <= (others => (others => '0'));
    -- o_minus_neighbor_segments <= (others => (others => '0'));

    MDT_INN_SUMP: for I in 0 to 2 generate
      slc_data_mainA_av(I) <= xor_reduce(i_slc_data_mainA_av(I));
      slc_data_mainB_av(I) <= xor_reduce(i_slc_data_mainB_av(I));
    end generate;
      slc_data_neighborA_v <= xor_reduce(i_slc_data_neighborA_v);
      slc_data_neighborB_v <= xor_reduce(i_slc_data_neighborB_v);

   
    o_sump <=   xor_reduce(slc_data_mainA_av)
              xor xor_reduce(slc_data_mainB_av)
              xor slc_data_neighborA_v 
              xor slc_data_neighborB_v;
  
end architecture beh;


--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--
--  Project: ATLAS L0MDT Trigger
--  Module: Detector parameters
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.common_constants_pkg.all;
-- use shared_lib.config_pkg.all;

package detector_time_param_pkg is

  -- constant MAX_ NUM_CHAMBER_POS : integer := 8;

  -------------------------------------------------------------------------
  -- Time & cycles constants
  -------------------------------------------------------------------------

  constant TIME_SLC_MDT_DELAY   : integer := 1242; --967; -- ns => 309.44 cycles

  -- UCM 2 HPS LATENCY
  constant UCM_2HPS_LATENCY     : integer := 52; -- cycles

  -- HPS 
  constant HPS_PC_LATENCY       : integer := 3;
  constant HEG_CTRL2HP_LATENCY  : integer := 4;
  constant HEG_CTRL2SF_LATENCY  : integer := 4;
  --

  -- TAR PIPELINE
  -- constant TAR_PL_A_LATENCY     : integer := 397 + UCM_2HPS_LATENCY;  --397 --310; -- cycles => 968.75 ns
  constant TDC_PL_A_LATENCY     : integer := 395 - 30 + UCM_2HPS_LATENCY - HPS_PC_LATENCY + HEG_CTRL2HP_LATENCY;  --310; -- cycles => 968.75 ns
  --
  constant UCM_LATENCY_HPS_CH   : integer := 575;--- 38 + UCM_2HPS_LATENCY - HPS_PC_LATENCY + HEG_CTRL2HP_LATENCY;--+ UCM_2HPS_LATENCY; -- cycles => 1.796 us
  --
 
  constant HEG_CSF_START_DELAY  : integer := 5;
  constant HEG_CSF_END_DELAY    : integer := 57;

  constant HEG_LSF_START_DELAY  : integer := 18;
  constant HEG_LSF_END_DELAY    : integer := 10;

  constant HEG_BUSY_CLOCKS      : integer := UCM_LATENCY_HPS_CH;
  --
  constant CSF_POST_PROCESSING  : integer := 57;
  constant LSF_POST_PROCESSING  : integer := 50;

  --
  constant HP_LATENCY           : integer := 3;
  constant BM_MIN_LATENCY       : integer := 3;
  --
  constant HP_BCID_OFFSET_TIME  : real := 575.0; -- cycles
  constant HP_BCID_OFFSET_TIME_078res  : integer := integer(HP_BCID_OFFSET_TIME / 0.78125); -- cycles

  function get_sf_time ( SF_t : std_logic ; t_CSF , t_LSF : integer) return integer;
  function get_pt_time ( PT_t : std_logic ; t_MPI , t_UCI : integer) return integer;

  function get_heg_load_time(start_delay : integer) return integer;
  function get_heg_busy_time(start_delay : integer) return integer;
  function get_heg_unload_time(start_delay, end_delay : integer) return integer;

end package detector_time_param_pkg;

package body detector_time_param_pkg is

  -------------------------------------------------------------------------
  -- Time & cycles constants
  -------------------------------------------------------------------------
  function get_sf_time ( SF_t : std_logic ; t_CSF , t_LSF : integer) return integer is
    variable t_o : integer;
  begin
    if SF_t = '0' then
      t_o := t_CSF;
    else
      t_o := t_LSF;
    end if;
    return t_o;
  end function;

  function get_pt_time ( PT_t : std_logic ; t_MPI , t_UCI : integer) return integer is
    variable t_o : integer;
  begin
    if PT_t = '0' then
      t_o := t_MPI;
    else
      t_o := t_UCI;
    end if;
    return t_o;
  end function;

  function get_heg_load_time(start_delay : integer) return integer is
    variable time_out : integer;
  begin
    if start_delay < HP_LATENCY + BM_MIN_LATENCY then
      time_out    := 0;
    else
      time_out    := start_delay - (HP_LATENCY + BM_MIN_LATENCY);
    end if;
    return time_out;
  end function;

  function get_heg_busy_time(start_delay : integer) return integer is
    variable time_out : integer;
  begin
    if start_delay < HP_LATENCY + BM_MIN_LATENCY then
      time_out    := HEG_BUSY_CLOCKS;
    else
      time_out    := start_delay - (HP_LATENCY + BM_MIN_LATENCY) + HEG_BUSY_CLOCKS;
    end if;
    return time_out;
  end function;

  function get_heg_unload_time(start_delay, end_delay : integer) return integer is
    variable time_out : integer;
  begin
    if start_delay < HP_LATENCY + BM_MIN_LATENCY then
      time_out    := HEG_BUSY_CLOCKS + end_delay;
    else
      time_out    := start_delay - (HP_LATENCY + BM_MIN_LATENCY) + HEG_BUSY_CLOCKS + end_delay;
    end if;
    return time_out;
  end function;

end package body detector_time_param_pkg;

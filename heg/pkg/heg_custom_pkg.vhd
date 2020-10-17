--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module:
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
use shared_lib.detector_param_pkg.all;

package heg_custom_pkg is
  
  type heg_roi_center_at is array(integer range <>) of unsigned(MDT_TUBE_LEN-1 downto 0);

  type heg_times_rt is record
    load    : integer;
    unload  : integer;
    busy    : integer;
  end record;

  function get_heg_times(dummy : integer) return heg_times_rt;
  
end package heg_custom_pkg;

package body heg_custom_pkg is
  
  function get_heg_times(dummy : integer) return heg_times_rt is
    variable times : heg_times_rt;
  begin
    if c_SF_TYPE = '0' then
      if HEG_CSF_START_DELAY < HP_LATENCY + BM_MIN_LATENCY then
        times.load    := 0;
        times.busy    := HEG_BUSY_CLOCKS;
        times.unload  := HEG_BUSY_CLOCKS +HEG_CSF_END_DELAY;
      else
        times.load    := HEG_CSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY);
        times.busy    := HEG_CSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY) + HEG_BUSY_CLOCKS;
        times.unload  := HEG_CSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY) + HEG_BUSY_CLOCKS + HEG_CSF_END_DELAY;
      end if;

    else
      if HEG_LSF_START_DELAY < HP_LATENCY + BM_MIN_LATENCY then
        times.load    := 0;
        times.busy    := HEG_BUSY_CLOCKS;
        times.unload  := HEG_BUSY_CLOCKS + HEG_LSF_END_DELAY;
      else
        times.load    := HEG_LSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY);
        times.busy    := HEG_LSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY) + HEG_BUSY_CLOCKS;
        times.unload  := HEG_LSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY) + HEG_BUSY_CLOCKS + HEG_LSF_END_DELAY;
      end if;
  
    end if;
    return times;
  end function;
  
  
end package body heg_custom_pkg;
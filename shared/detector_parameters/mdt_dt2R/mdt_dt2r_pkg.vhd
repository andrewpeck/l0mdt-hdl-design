--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch 
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: drift_time to radius calculation for mdt tubes 
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

use shared_lib.mdt_dt2r_large.all;
use shared_lib.mdt_dt2r_small.all;

package mdt_dt2r_pkg is
  
  function mdt_dt2r_get_addr_len(sector, station ,chamber : integer) return integer;
  -- function mdt_dt2r_get_addr_len(sector, station ,chamber : integer) return integer;
  function mdt_dt2r_get_mem_size(sector, station ,chamber : integer) return integer;
  
end package mdt_dt2r_pkg;

package body mdt_dt2r_pkg is
  
  function mdt_dt2r_get_addr_len(sector, station ,chamber : integer) return integer is
    variable y ; integer;
  begin
    if sector = 3 then
      y := DT2R_LARGE_ADDR_LEN;
    else
      y := DT2R_SMALL_ADDR_LEN;
    end if;
    return y;
  end  function;

  function mdt_dt2r_get_mem_size(sector, station ,chamber : integer) return integer is
    variable y ; integer;
  begin
    if sector = 3 then
      y := DT2R_LARGE_MEM_SIZE;
    else
      y := DT2R_SMALL_MEM_SIZE;
    end if;
    return y;
  end  function;
  
  
end package body mdt_dt2r_pkg;


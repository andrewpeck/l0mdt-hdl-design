--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--
--  Project: ATLAS L0MDT Trigger
--  Module: Detector parameters
--  Description: Z from IP to the origin of the chamber
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
use shared_lib.detector_param_pkg.all;

package barrel_chamb_z2origin_pkg is

  -- subtype b_chamber_z_origin_ut is unsigned( 16 -1 downto 0); --old length : SLC_Z_RPC_LEN
  type b_chamber_z_origin_aut is array (0 to MAX_NUM_CHAMBER_POS -1 ) of unsigned(16 - 1 downto 0);
  subtype b_chamber_z_origin_avt is std_logic_vector(16 * MAX_NUM_CHAMBER_POS -1 downto 0);
  type b_chamber_z_origin_station_aut is array (0 to 3) of b_chamber_z_origin_aut;
  type b_chamber_z_origin_station_avt is array (0 to 3) of b_chamber_z_origin_avt;

  type b_chamber_z_origin_ait is array (0 to MAX_NUM_CHAMBER_POS -1 ) of integer;
  type b_chamber_z_origin_at is array (0 to MAX_NUM_CHAMBER_POS -1 ) of real;
  type b_chamber_z_origin_station_at is array (0 to 3) of b_chamber_z_origin_at;
  type b_chamber_z_origin_detector_at is array ( 0 to 15) of b_chamber_z_origin_station_at;
  constant b_chamber_z_origin_detector : b_chamber_z_origin_detector_at :=(
    --     INN MID OUT EXT
     0 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S1
     1 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S2
     2 => ( (330.0 , 1250.0 , 2350.0 , 3450.0 , 4550.0 , 5470.0 , 6566.2 , 0.0),
            (150.0 , 1850.0 , 3550.0 , 5250.0 , 6470.0 , 7690.0 , 9660.0 , 0.0),
            (150.0 , 2330.0 , 4510.0 , 6210.0 , 8390.0 , 10570.0, 12270.0, 0.0),
            (0.0   , 0.0    , 0.0    , 0.0    , 0.0    , 0.0    , 0.0 , 0.0)), -- S3
     3 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S4
     4 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S5
     5 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S6
     6 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S7
     7 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S8
     8 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S9
     9 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S10
    10 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S11
    11 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S12
    12 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S13
    13 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S14
    14 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S15
    15 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)) -- S16
  );

  function get_b_chamber_origin_z_u( sector, station : integer; mult : real; out_width : integer := 16) return b_chamber_z_origin_aut;
  function get_b_chamber_origin_z_i( sector, station : integer; mult : real) return b_chamber_z_origin_ait;

  function vectorify(x: b_chamber_z_origin_aut) return b_chamber_z_origin_avt;
  function structify(x: b_chamber_z_origin_avt) return b_chamber_z_origin_aut;
  
  
end package barrel_chamb_z2origin_pkg;

package body barrel_chamb_z2origin_pkg is
  
  function get_b_chamber_origin_z_u( sector, station: integer; mult : real; out_width : integer := 16) return b_chamber_z_origin_aut is
    variable y : b_chamber_z_origin_aut;
  begin
    for ch_i in  0 to MAX_NUM_CHAMBER_POS -1 loop
      y(ch_i) := to_unsigned(integer(b_chamber_z_origin_detector(sector - 1)(station)(ch_i) * mult) , out_width);
    end loop;
    return y;
  end function;
  function get_b_chamber_origin_z_i( sector, station : integer; mult : real) return b_chamber_z_origin_ait is
    variable y : b_chamber_z_origin_ait;
  begin
    for ch_i in  0 to MAX_NUM_CHAMBER_POS -1 loop
      y(ch_i) := integer(b_chamber_z_origin_detector(sector - 1)(station)(ch_i) * mult);
    end loop;
    return y;
  end function;
  function vectorify(x: b_chamber_z_origin_aut) return b_chamber_z_origin_avt is
    variable msb : integer := x'length*16-1;
    variable y : b_chamber_z_origin_avt;
  begin
    l : for i in x'range loop
      y(msb downto msb-16+1) := std_logic_vector(x(i));
      msb := msb - 16;
    end loop;
    return y;
  end function;
  function structify(x: b_chamber_z_origin_avt) return b_chamber_z_origin_aut is
    variable y :  b_chamber_z_origin_aut;
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := unsigned(x(msb downto msb-16+1));
      msb := msb - 16;
    end loop l;
    return y;
  end function;  
  
end package body barrel_chamb_z2origin_pkg;
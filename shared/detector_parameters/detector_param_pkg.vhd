--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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

package detector_param_pkg is

  -------------------------------------------------------------------------
  -- Some constants
  -------------------------------------------------------------------------
  constant TIME_SLC_MDT_DELAY : integer := 967; -- ns
  -------------------------------------------------------------------------
  -- Radius to RPC hit
  -------------------------------------------------------------------------
  type barrel_stations_radius is array (0 to 3) of real;
  type ys_barrel is array ( 0 to 1) of barrel_stations_radius;
  constant barrel_radius : ys_barrel :=(
  -- rpc0 - rpc1 - rpc2 - rpc3
    (5000.0,7000.0,7500.0,10000.0), -- odd sectors
    (4200.0,7800.0,8200.0,10000.0)  -- even sectors
  );

  function get_barrel_radius ( sector, r_i: integer) return signed;

  -------------------------------------------------------------------------
  -- Radius to the origin of the chamber
  -------------------------------------------------------------------------
  type b_chamber_origin_tube_radius is array (0 to 7) of real;
  type b_chamber_origin_station is array (0 to 3) of b_chamber_origin_tube_radius;
  type b_chamber_origin_chamber is array ( 0 to 15) of b_chamber_origin_station;
  constant b_chamber_origin_radius : b_chamber_origin_chamber :=(
    --     INN MID OUT EXT
     0 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S1
     1 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S2
     2 => ( (4755.93,4755.93,4755.93,4755.93,4755.93,4755.93,0.0,0.0),
            (6898.46,6898.46,6898.46,6898.46,6898.46,6898.46,0.0,0.0),
            (9259.46,9259.46,9259.46,9259.46,9259.46,9259.46,0.0,0.0),
            (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S3
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

  function get_b_chamber_origin( sector, station, chamber : integer) return unsigned;

  -------------------------------------------------------------------------
  -- Chamber type from 
  -------------------------------------------------------------------------
  function get_b_chamber_type( sector, station, chamber_ieta  : integer) return integer;
  -------------------------------------------------------------------------
  -- Distance from layer 0 to layer n
  -------------------------------------------------------------------------
  type b_layer_dist_tubes is array (0 to 7) of integer;
  type b_layer_dist_types is array (0 to 12) of b_layer_dist_tubes;
  constant rom_b_layer_height : b_layer_dist_types :=(
    (0 , 832 , 1664 , 2496  , 8896  , 9728  , 10560 , 11392), -- BIL MDT
    (0 , 416 , 832  , 1248  , 2707  , 3123  , 3539  , 3936 ), -- BIS sMDT
    (0 , 832 , 1664 , 12768 , 13600 , 14432 , 0     , 0    ), -- BML
    (0 , 0   , 0    , 0     , 0     , 0     , 0     , 0    ), -- BMS
    (0 , 832 , 1664 , 12768 , 13600 , 14432 , 0     , 0    ), -- BOL
    (0 , 0   , 0    , 0     , 0    , 0      , 0     , 0    ), -- BOS
    (0 , 0   , 0    , 0     , 0    , 0      , 0     , 0    ), -- BEE
    (0 , 0   , 0    , 0     , 0    , 0      , 0     , 0    ), -- BIR
    (0 , 0   , 0    , 0     , 0    , 0      , 0     , 0    ), -- BMF
    (0 , 0   , 0    , 0     , 0    , 0      , 0     , 0    ), -- BOF
    (0 , 0   , 0    , 0     , 0    , 0      , 0     , 0    ), -- BOG
    (0 , 0   , 0    , 0     , 0    , 0      , 0     , 0    ), -- BOH
    (0 , 0   , 0    , 0     , 0    , 0      , 0     , 0    )  -- BIM
  );
  /*
  constant rom_b_layer_height : b_layer_dist_types :=(
    (0.0 , 26.0 , 52.0 , 78.0  , 278.0 , 304.0 , 330.0 , 356.0), -- BIL MDT
    (0.0 , 13.0 , 26.0 , 39.0  , 84.6  , 97.6  , 110.6 , 123.0), -- BIS sMDT
    (0.0 , 26.0 , 52.0 , 399.0 , 425.0 , 451.0 , 0.0   , 0.0  ), -- BML
    (0.0 , 0.0  , 0.0  , 0.0   , 0.0   , 0.0   , 0.0   , 0.0  ), -- BMS
    (0.0 , 26.0 , 52.0 , 399.0 , 425.0 , 451.0 , 0.0   , 0.0  ), -- BOL
    (0.0 , 0.0  , 0.0  , 0.0   , 0.0   , 0.0   , 0.0   , 0.0  ), -- BOS
    (0.0 , 0.0  , 0.0  , 0.0   , 0.0   , 0.0   , 0.0   , 0.0  ), -- BEE
    (0.0 , 0.0  , 0.0  , 0.0   , 0.0   , 0.0   , 0.0   , 0.0  ), -- BIR
    (0.0 , 0.0  , 0.0  , 0.0   , 0.0   , 0.0   , 0.0   , 0.0  ), -- BMF
    (0.0 , 0.0  , 0.0  , 0.0   , 0.0   , 0.0   , 0.0   , 0.0  ), -- BOF
    (0.0 , 0.0  , 0.0  , 0.0   , 0.0   , 0.0   , 0.0   , 0.0  ), -- BOG
    (0.0 , 0.0  , 0.0  , 0.0   , 0.0   , 0.0   , 0.0   , 0.0  ), -- BOH
    (0.0 , 0.0  , 0.0  , 0.0   , 0.0   , 0.0   , 0.0   , 0.0  )  -- BIM
  );*/

  function get_b_layer_height ( chamber_id , layer : integer) return unsigned;

  
end package detector_param_pkg;

package body detector_param_pkg is
  -------------------------------------------------------------------------
  -- Radius to RPC hit
  -------------------------------------------------------------------------
  function get_barrel_radius ( sector , r_i : integer) return signed is
    variable y : signed(SLC_Z_RPC_LEN-1 downto 0);
    variable r: real;
    variable r_c: integer;
  begin
    if (sector mod 2) = 0 then
      r:= barrel_radius(0)(r_i);
      -- y:= to_signed((barrel_radius(0)(r_i) / SLC_Z_RPC_MULT),SLC_Z_RPC_LEN);
    else
      r:= barrel_radius(1)(r_i);
      -- y:= to_signed((barrel_radius(1)(r_i) / SLC_Z_RPC_MULT),SLC_Z_RPC_LEN);
    end if;
    r_c := integer(r / SLC_Z_RPC_MULT);
    y := to_signed(r_c,SLC_Z_RPC_LEN);
    return y;
  end function get_barrel_radius;
  -------------------------------------------------------------------------
  -- Radius to the origin of the chamber
  -------------------------------------------------------------------------
  function get_b_chamber_origin( sector, station, chamber  : integer) return unsigned is
    variable y : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  begin
    y := to_unsigned(integer(b_chamber_origin_radius(sector)(station)(chamber) * MDT_GLOBAL_AXI_MULT) , MDT_GLOBAL_AXI_LEN);
    return y;
  end function get_b_chamber_origin;
  -------------------------------------------------------------------------
  -- Chamber type from 
  -------------------------------------------------------------------------
  function get_b_chamber_type( sector, station, chamber_ieta : integer) return integer is
    variable y : integer;
  begin

    return y;
  end function get_b_chamber_type;
  -------------------------------------------------------------------------
  -- Distance from layer 0 to layer n
  -------------------------------------------------------------------------
  function get_b_layer_height ( chamber_id , layer : integer) return unsigned is
    variable y : unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
    variable h : integer;
  begin
    h := rom_b_layer_height(chamber_id)(layer);
    y := to_unsigned(h, MDT_LOCAL_Y_LEN );

    return y;

  end function get_b_layer_height;
  
end package body detector_param_pkg;
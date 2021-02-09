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

  constant MAX_NUM_CHAMBER_POS : integer := 8;

  -------------------------------------------------------------------------
  -- Time & cycles constants
  -------------------------------------------------------------------------
  constant TIME_SLC_MDT_DELAY   : integer := 1242; --967; -- ns => 309.44 cycles

  -- TAR PIPELINE
  constant TAR_PL_A_LATENCY     : integer := 397;  --310; -- cycles => 968.75 ns
  constant TDC_PL_A_LATENCY     : integer := 395;  --310; -- cycles => 968.75 ns
  --
  constant UCM_LATENCY_HPS_CH   : integer := 575; -- cycles => 1.796 us
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
  -------------------------------------------------------------------------
  -- Radius to RPC hit
  -------------------------------------------------------------------------
  type barrel_stations_radius is array (0 to 3) of real;
  type ys_barrel is array ( 0 to 1) of barrel_stations_radius;
  constant barrel_radius : ys_barrel :=(
  -- rpc0 - rpc1 - rpc2 - rpc3
    (5157.0,6727.0,7626.0,9755.0), -- odd sectors / impar
    -- (5000.0,7000.0,7500.0,10000.0), -- odd sectors
    (5300.0,7600.0,8500.0,10000.0)  -- even sectors / par
    -- (5300.0,7600.0,8500.0,10000.0)  -- even sectors
  );

  function get_barrel_radius ( sector, r_i: integer) return signed;

  -------------------------------------------------------------------------
  -- Phi center of sector
  -------------------------------------------------------------------------
  --UCM2PL_PHIMOD_MULT
  subtype sector_phi_center_t is unsigned(SLC_COMMON_POSPHI_LEN - 1 downto 0);
  type sector_phi_center_default_t is array ( 0 to 15) of real;
  constant sector_phi_center_default : sector_phi_center_default_t :=(
    -- -pi to pi ; signed
    -- 0.       ,0.392699 ,0.785398 ,1.178097 , 1.570796 ,1.963495 ,2.356194 ,2.748894 ,
    -- 3.141593 ,-2.748894,-2.356194,-1.963495, -1.570796,-1.178097,-0.785398,-0.392699
    -- 0 to 2pi ; unsigned
    0.0,0.392699082,0.785398163,1.178097245,1.570796327,1.963495408,2.35619449,2.748893572,
    3.141592654,3.534291735,3.926990817,4.319689899,4.71238898,5.105088062,5.497787144,5.890486225

  );
  function get_sector_phi_center( sector : integer) return sector_phi_center_t;

  -------------------------------------------------------------------------
  -- Radius to the center of the chamber
  -------------------------------------------------------------------------

  type b_chamber_center_radius_unsigned_au is array (0 to MAX_NUM_CHAMBER_POS -1 ) of unsigned (SLC_Z_RPC_LEN -1 downto 0);
  type b_chamber_center_radius_integer_ar is array (0 to MAX_NUM_CHAMBER_POS -1 ) of real;
  type b_chamber_center_station is array (0 to 3) of b_chamber_center_radius_integer_ar;
  type b_chamber_center_chamber is array ( 0 to 15) of b_chamber_center_station;
  constant b_chamber_center_radius : b_chamber_center_chamber :=(
    --     INN MID OUT EXT
     0 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S1
     1 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S2
     2 => ( (4949.0,4949.0,4949.0,4949.0,4949.0,4949.0,0.0,0.0),
            (7139.0,7139.0,7139.0,7139.0,7139.0,7139.0,0.0,0.0),
            (9500.0,9500.0,9500.0,9500.0,9500.0,9500.0,0.0,0.0),
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

  function get_b_chamber_center_radius( sector, station : integer) return b_chamber_center_radius_unsigned_au;
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

  function get_b_chamber_origin_x( sector, station, chamber : integer) return unsigned;
  -------------------------------------------------------------------------
  -- Z from IP to the origin of the chamber
  -------------------------------------------------------------------------
  subtype b_chamber_z_origin_ut is unsigned (SLC_Z_RPC_LEN -1 downto 0); --old length : SLC_Z_RPC_LEN
  type b_chamber_z_origin_aut is array (0 to MAX_NUM_CHAMBER_POS -1 ) of b_chamber_z_origin_ut;
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

  function get_b_chamber_origin_z_u( sector, station : integer; mult : real; out_width : integer := SLC_Z_RPC_LEN) return b_chamber_z_origin_aut;
  function get_b_chamber_origin_z_i( sector, station : integer; mult : real) return b_chamber_z_origin_ait;
  -------------------------------------------------------------------------
  -- Chamber type from
  -------------------------------------------------------------------------
  type b_chamber_type_station_ait is array (0 to MAX_NUM_CHAMBER_POS -1 ) of integer;
  type b_chamber_type_sector_at is array (0 to 3) of b_chamber_type_station_ait;
  type b_chamber_type_detector_at is array (0 to 15) of b_chamber_type_sector_at;
  constant b_chamber_type_detector : b_chamber_type_detector_at :=(
    0 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S1
    1 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S2
    2 => ((1,1,1,1,1,1,0,0),
          (3,3,3,3,3,3,0,0),
          (5,5,5,5,5,5,0,0),
          (0,0,0,0,0,0,0,0)), -- S3
    3 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S4
    4 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S5
    5 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S6
    6 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S7
    7 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S8
    8 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S9
    9 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S10
   10 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S11
   11 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S12
   12 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S13
   13 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S14
   14 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)), -- S15
   15 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)) -- S16
 );
 function get_b_chamber_type_sector( sector : integer) return b_chamber_type_sector_at;
 function get_b_chamber_type( sector,station,ieta : integer) return integer;

  -------------------------------------------------------------------------
  -- Distance from layer 0 to layer n
  -------------------------------------------------------------------------
  type b_layer_dist_tubes_unsigned_au is array (0 to MAX_NUM_CHAMBER_POS -1 ) of unsigned (SLC_Z_RPC_LEN -1 downto 0);
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
  -- Phi center of sector
  -------------------------------------------------------------------------
  function get_sector_phi_center( sector : integer) return sector_phi_center_t is
    variable mem_out : sector_phi_center_t;
    variable a , b : real;
  begin
    a := sector_phi_center_default(sector);
    b := SLC_COMMON_POSPHI_MULT;
    mem_out := to_unsigned( integer((1000.0 * a) * b),SLC_COMMON_POSPHI_LEN);
    return mem_out;
  end function;

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



  -- function get_heg_times(dummy : integer) return heg_times_rt is
  --   variable times : heg_times_rt;
  -- begin
  --   if c_SF_TYPE = '0' then
  --     if HEG_CSF_START_DELAY < HP_LATENCY + BM_MIN_LATENCY then
  --       times.load    := 0;
  --       times.busy    := HEG_BUSY_CLOCKS;
  --       times.unload  := HEG_BUSY_CLOCKS +HEG_CSF_END_DELAY;
  --     else
  --       times.load    := HEG_CSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY);
  --       times.busy    := HEG_CSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY) + HEG_BUSY_CLOCKS;
  --       times.unload  := HEG_CSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY) + HEG_BUSY_CLOCKS + HEG_CSF_END_DELAY;
  --     end if;

  --   else
  --     if HEG_LSF_START_DELAY < HP_LATENCY + BM_MIN_LATENCY then
  --       times.load    := 0;
  --       times.busy    := HEG_BUSY_CLOCKS;
  --       times.unload  := HEG_BUSY_CLOCKS + HEG_LSF_END_DELAY;
  --     else
  --       times.load    := HEG_LSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY);
  --       times.busy    := HEG_LSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY) + HEG_BUSY_CLOCKS;
  --       times.unload  := HEG_LSF_START_DELAY - (HP_LATENCY + BM_MIN_LATENCY) + HEG_BUSY_CLOCKS + HEG_LSF_END_DELAY;
  --     end if;

  --   end if;
  --   return times;
  -- end function;
  -------------------------------------------------------------------------
  -- Radius to RPC hit
  -------------------------------------------------------------------------
  function get_barrel_radius ( sector , r_i : integer) return signed is
    variable y : signed(SLC_Z_RPC_LEN-1 downto 0);
    variable r: real;
    variable r_c: integer;
  begin
    if (sector mod 2) = 0 then --even -- par
      r:= barrel_radius(1)(r_i);
      -- y:= to_signed((barrel_radius(0)(r_i) / SLC_Z_RPC_MULT),SLC_Z_RPC_LEN);
    else
      r:= barrel_radius(0)(r_i); --odd impar
      -- y:= to_signed((barrel_radius(1)(r_i) / SLC_Z_RPC_MULT),SLC_Z_RPC_LEN);
    end if;
    r_c := integer(r * SLC_Z_RPC_MULT);
    y := to_signed(r_c,SLC_Z_RPC_LEN);
    return y;
  end function get_barrel_radius;
  -------------------------------------------------------------------------
  -- Radius to the center of the chamber
  -------------------------------------------------------------------------
  function get_b_chamber_center_radius( sector, station  : integer) return b_chamber_center_radius_unsigned_au is
    variable y : b_chamber_center_radius_unsigned_au;
  begin
    for ch_i in  0 to MAX_NUM_CHAMBER_POS -1 loop
      y(ch_i) := to_unsigned(integer(b_chamber_center_radius(sector - 1)(station)(ch_i) * SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN);
    end loop;
    return y;
  end function get_b_chamber_center_radius;

  -------------------------------------------------------------------------
  -- Radius to the origin of the chamber
  -------------------------------------------------------------------------
  function get_b_chamber_origin_x( sector, station, chamber  : integer) return unsigned is
    variable y : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  begin
    y := to_unsigned(integer(b_chamber_origin_radius(sector - 1)(station)(chamber) * MDT_GLOBAL_AXI_MULT) , MDT_GLOBAL_AXI_LEN);
    return y;
  end function get_b_chamber_origin_x;
  -------------------------------------------------------------------------
  -- Z from IP to the origin of the chamber
  -------------------------------------------------------------------------
  function get_b_chamber_origin_z_u( sector, station: integer; mult : real; out_width : integer := SLC_Z_RPC_LEN) return b_chamber_z_origin_aut is
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
  -------------------------------------------------------------------------
  -- Chamber type from
  -------------------------------------------------------------------------
  function get_b_chamber_type_sector( sector : integer) return b_chamber_type_sector_at is
    variable y : b_chamber_type_sector_at;
  begin
    y := b_chamber_type_detector(sector - 1 );

    return y;
  end function;

  function get_b_chamber_type( sector,station,ieta : integer) return integer is
    variable y : integer;
  begin
    y := b_chamber_type_detector(sector - 1)(station)(ieta);
    return y;
  end function;

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

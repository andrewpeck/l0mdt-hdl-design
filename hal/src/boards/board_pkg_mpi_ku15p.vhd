library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.board_pkg_common.all;

package board_pkg is

  constant c_STATION : station_t := BARREL;

  constant c_NUM_MGTS                 : integer := 44 + 32;

  -- choose the nth felix RX link which should be used as the clock recovery source and connected to the LPGBT
  constant c_FELIX_RECCLK_SRC : integer := 0;

  constant c_MGT_MAP : mgt_inst_array_t (c_NUM_MGTS-1 downto 0) := (

-- mgt#    => (mgt_type          , refclk , gt_type , x , y)
    0      => (MGT_NIL           ,  0     , GTY     , 0 , 0)  , -- BANK 127 C2C ZUP/KUP0
    1      => (MGT_NIL           ,  0     , GTY     , 0 , 1)  , -- BANK 127 C2C ZUP/KUP1
    2      => (MGT_NIL           ,  0     , GTY     , 0 , 2)  , -- BANK 127 C2C ZUP/KUP2
    3      => (MGT_NIL           ,  0     , GTY     , 0 , 3)  , -- BANK 127 C2C ZUP/KUP3
    4      => (MGT_NIL           ,  1     , GTY     , 0 , 4)  , -- BANK 128 CM2CM 0
    5      => (MGT_NIL           ,  1     , GTY     , 0 , 5)  , -- BANK 128 CM2CM 1
    6      => (MGT_NIL           ,  1     , GTY     , 0 , 6)  , -- BANK 128 CM2CM 2
    7      => (MGT_NIL           ,  1     , GTY     , 0 , 7)  , -- BANK 128 CM2CM 3
    8      => (MGT_SL            ,  2     , GTY     , 0 , 8)  , -- BANK 129 Sector Logic 0
    9      => (MGT_SL            ,  2     , GTY     , 0 , 9)  , -- BANK 129 Sector Logic 1
    10     => (MGT_SL            ,  2     , GTY     , 0 , 10) , -- BANK 129 Sector Logic 2
    11     => (MGT_SL            ,  2     , GTY     , 0 , 11) , -- BANK 129 Sector Logic 3
    12     => (MGT_SL            ,  3     , GTY     , 0 , 12) , -- BANK 130 Sector Logic 4
    13     => (MGT_SL            ,  3     , GTY     , 0 , 13) , -- BANK 130 Sector Logic 5
    14     => (MGT_SL            ,  3     , GTY     , 0 , 14) , -- BANK 130 Sector Logic 6
    15     => (MGT_SL            ,  3     , GTY     , 0 , 15) , -- BANK 130 Sector Logic 7
    16     => (MGT_SL            ,  4     , GTY     , 0 , 16) , -- BANK 131 Sector Logic 8
    17     => (MGT_SL            ,  4     , GTY     , 0 , 17) , -- BANK 131 Sector Logic 9
    18     => (MGT_SL            ,  4     , GTY     , 0 , 18) , -- BANK 131 Sector Logic 10
    19     => (MGT_SL            ,  4     , GTY     , 0 , 19) , -- BANK 131 Sector Logic 11
    20     => (MGT_FELIX_TXRX    ,  5     , GTY     , 0 , 20) , -- BANK 132 FELIX 0
    21     => (MGT_FELIX         ,  5     , GTY     , 0 , 21) , -- BANK 132 FELIX 1
    22     => (MGT_FELIX         ,  5     , GTY     , 0 , 22) , -- BANK 132 FELIX 2
    23     => (MGT_FELIX         ,  5     , GTY     , 0 , 23) , -- BANK 132 FELIX 3
    24     => (MGT_FELIX         ,  6     , GTY     , 0 , 24) , -- BANK 133 FELIX 4
    25     => (MGT_FELIX         ,  6     , GTY     , 0 , 25) , -- BANK 133 FELIX 5
    26     => (MGT_FELIX         ,  6     , GTY     , 0 , 26) , -- BANK 133 FELIX 6
    27     => (MGT_FELIX         ,  6     , GTY     , 0 , 27) , -- BANK 133 FELIX 7
    28     => (MGT_FELIX         ,  7     , GTY     , 0 , 28) , -- BANK 134 FELIX 8
    29     => (MGT_FELIX         ,  7     , GTY     , 0 , 29) , -- BANK 134 FELIX 9
    30     => (MGT_FELIX         ,  7     , GTY     , 0 , 30) , -- BANK 134 FELIX 10
    31     => (MGT_FELIX         ,  7     , GTY     , 0 , 31) , -- BANK 134 FELIX 11
-- mgt#    => (mgt_type          , refclk , gt_type , x , y)
    32     => (MGT_NIL           , 12     , GTH     , 0 , 0)  , -- BANK 224 SM/CM B2B0
    33     => (MGT_NIL           , 12     , GTH     , 0 , 1)  , -- BANK 224 SM/CM B2B1
    34     => (MGT_NIL           , 12     , GTH     , 0 , 2)  , -- BANK 224 C2C ZUP/KUP4
    35     => (MGT_NIL           , 12     , GTH     , 0 , 3)  , -- BANK 224 C2C ZUP/KUP5
    36     => (MGT_NIL           , 13     , GTH     , 0 , 4)  , -- BANK 225 C2C ZUP/KUP6
    37     => (MGT_NIL           , 13     , GTH     , 0 , 5)  , -- BANK 225 LEGACY TTX RX/TX
    38     => (MGT_NIL           , 13     , GTH     , 0 , 6)  , -- BANK 225 TX/RX Spare 0 to SMA
    39     => (MGT_NIL           , 13     , GTH     , 0 , 7)  , -- BANK 225 TX/RX Spare 1 to SMA
    40     => (MGT_LPGBT         , 14     , GTH     , 0 , 8)  , -- BANK 226 CSM
    41     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 9)  , -- BANK 226 CSM
    42     => (MGT_LPGBT         , 14     , GTH     , 0 , 10) , -- BANK 226 CSM
    43     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 11) , -- BANK 226 CSM
    44     => (MGT_LPGBT         , 14     , GTH     , 0 , 12) , -- BANK 227 CSM
    45     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 13) , -- BANK 227 CSM
    46     => (MGT_LPGBT         , 14     , GTH     , 0 , 14) , -- BANK 227 CSM
    47     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 15) , -- BANK 227 CSM
    48     => (MGT_LPGBT         , 14     , GTH     , 0 , 16) , -- BANK 228 CSM
    49     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 17) , -- BANK 228 CSM
    50     => (MGT_LPGBT         , 14     , GTH     , 0 , 18) , -- BANK 228 CSM
    51     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 19) , -- BANK 228 CSM
    52     => (MGT_LPGBT         , 16     , GTH     , 0 , 20) , -- BANK 229 CSM
    53     => (MGT_LPGBT_SIMPLEX , 16     , GTH     , 0 , 21) , -- BANK 229 CSM
    54     => (MGT_LPGBT         , 16     , GTH     , 0 , 22) , -- BANK 229 CSM
    55     => (MGT_LPGBT_SIMPLEX , 16     , GTH     , 0 , 23) , -- BANK 229 CSM
    56     => (MGT_LPGBT         , 16     , GTH     , 0 , 24) , -- BANK 230 CSM
    57     => (MGT_LPGBT_SIMPLEX , 16     , GTH     , 0 , 25) , -- BANK 230 CSM
    58     => (MGT_LPGBT         , 16     , GTH     , 0 , 26) , -- BANK 230 CSM
    59     => (MGT_LPGBT_SIMPLEX , 16     , GTH     , 0 , 27) , -- BANK 230 CSM
    60     => (MGT_LPGBT         , 18     , GTH     , 0 , 28) , -- BANK 231 CSM
    61     => (MGT_LPGBT_SIMPLEX , 18     , GTH     , 0 , 29) , -- BANK 231 CSM
    62     => (MGT_LPGBT         , 18     , GTH     , 0 , 30) , -- BANK 231 CSM
    63     => (MGT_LPGBT_SIMPLEX , 18     , GTH     , 0 , 31) , -- BANK 231 CSM
    64     => (MGT_LPGBT         , 19     , GTH     , 0 , 32) , -- BANK 232 CSM
    65     => (MGT_LPGBT_SIMPLEX , 19     , GTH     , 0 , 33) , -- BANK 232 CSM
    66     => (MGT_LPGBT         , 19     , GTH     , 0 , 34) , -- BANK 232 CSM
    67     => (MGT_LPGBT_SIMPLEX , 19     , GTH     , 0 , 35) , -- BANK 232 CSM
    68     => (MGT_LPGBT         , 20     , GTH     , 0 , 36) , -- BANK 233 CSM
    69     => (MGT_LPGBT_SIMPLEX , 20     , GTH     , 0 , 37) , -- BANK 233 CSM
    70     => (MGT_LPGBT         , 20     , GTH     , 0 , 38) , -- BANK 233 CSM
    71     => (MGT_LPGBT_SIMPLEX , 20     , GTH     , 0 , 39) , -- BANK 233 CSM
    72     => (MGT_LPGBT         , 21     , GTH     , 0 , 40) , -- BANK 234 CSM
    73     => (MGT_LPGBT_SIMPLEX , 21     , GTH     , 0 , 41) , -- BANK 234 CSM
    74     => (MGT_LPGBT         , 21     , GTH     , 0 , 42) , -- BANK 234 CSM
    75     => (MGT_LPGBT_SIMPLEX , 21     , GTH     , 0 , 43) , -- BANK 234 CSM
    others => MGT_NIL_MAP
    );

  constant c_NUM_REFCLKS : integer := 22;
  constant C2C_REFCLK_SRC : integer := 9;

  constant c_REFCLK_MAP : refclk_types_array_t (c_NUM_REFCLKS-1 downto 0) := (
    -- B2B = AXI c2c
    -- C2C = sf c2c
    -- CM2CM = goes to firely
    0  => (REFCLKNUM => 0 , FREQ => REF_SF_C2C  , QUAD => 127 , GT_TYPE => GTY , X_LOC => 0 , Y_MIN => 0  , Y_MAX => 3)  , -- C2C_REF0
    1  => (REFCLKNUM => 0 , FREQ => REF_NIL     , QUAD => 128 , GT_TYPE => GTY , X_LOC => 0 , Y_MIN => 4  , Y_MAX => 7)  , -- CM2CM_REF0
    2  => (REFCLKNUM => 0 , FREQ => REF_SYNC240 , QUAD => 129 , GT_TYPE => GTY , X_LOC => 0 , Y_MIN => 8  , Y_MAX => 11) , -- SL_REF0
    3  => (REFCLKNUM => 0 , FREQ => REF_SYNC240 , QUAD => 130 , GT_TYPE => GTY , X_LOC => 0 , Y_MIN => 12 , Y_MAX => 15) , -- SL_REF1
    4  => (REFCLKNUM => 0 , FREQ => REF_SYNC240 , QUAD => 131 , GT_TYPE => GTY , X_LOC => 0 , Y_MIN => 16 , Y_MAX => 19) , -- SL_REF2
    5  => (REFCLKNUM => 0 , FREQ => REF_FELIX   , QUAD => 132 , GT_TYPE => GTY , X_LOC => 0 , Y_MIN => 20 , Y_MAX => 23) , -- FELIX_REF0
    6  => (REFCLKNUM => 0 , FREQ => REF_FELIX   , QUAD => 133 , GT_TYPE => GTY , X_LOC => 0 , Y_MIN => 24 , Y_MAX => 27) , -- FELIX_REF1
    7  => (REFCLKNUM => 0 , FREQ => REF_FELIX   , QUAD => 134 , GT_TYPE => GTY , X_LOC => 0 , Y_MIN => 28 , Y_MAX => 31) , -- FELIX_REF2
    8  => (REFCLKNUM => 0 , FREQ => REF_NIL     , QUAD => 224 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 0  , Y_MAX => 3)  , -- AD_CLK2_KUP , muxed as C2c or Spare
    9  => (REFCLKNUM => 1 , FREQ => REF_NIL     , QUAD => 224 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 0  , Y_MAX => 3)  , -- B2B_REF0 to SM
    10 => (REFCLKNUM => 0 , FREQ => REF_NIL     , QUAD => 225 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 4  , Y_MAX => 7)  , -- AD_CLK3_KUP , muxed as sma or spare
    11 => (REFCLKNUM => 1 , FREQ => REF_NIL     , QUAD => 225 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 4  , Y_MAX => 7)  , -- B2B_REF2 to SM
    12 => (REFCLKNUM => 0 , FREQ => REF_SYNC320 , QUAD => 226 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 8  , Y_MAX => 11) , -- FE_REF0
    13 => (REFCLKNUM => 0 , FREQ => REF_SYNC320 , QUAD => 227 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 12 , Y_MAX => 15) , -- FE_REF1
    14 => (REFCLKNUM => 0 , FREQ => REF_SYNC320 , QUAD => 228 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 16 , Y_MAX => 19) , -- FE_REF2
    15 => (REFCLKNUM => 0 , FREQ => REF_NIL     , QUAD => 229 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 20 , Y_MAX => 23) , -- SPARE_REF1
    16 => (REFCLKNUM => 0 , FREQ => REF_SYNC320 , QUAD => 230 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 24 , Y_MAX => 27) , -- FE_REF3
    17 => (REFCLKNUM => 1 , FREQ => REF_NIL     , QUAD => 230 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 24 , Y_MAX => 27) , -- SPARE_REF2
    18 => (REFCLKNUM => 0 , FREQ => REF_SYNC320 , QUAD => 231 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 28 , Y_MAX => 31) , -- FE_REF4
    19 => (REFCLKNUM => 0 , FREQ => REF_SYNC320 , QUAD => 232 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 32 , Y_MAX => 35) , -- FE_REF5
    20 => (REFCLKNUM => 0 , FREQ => REF_SYNC320 , QUAD => 233 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 36 , Y_MAX => 39) , -- FE_REF6
    21 => (REFCLKNUM => 0 , FREQ => REF_SYNC320 , QUAD => 234 , GT_TYPE => GTH , X_LOC => 0 , Y_MIN => 40 , Y_MAX => 43) , -- FE_REF7
    others => REFCLK_NIL_MAP
    );

  constant c_MDT_CONFIG : mdt_config_t (17 downto 0) := (
    0  => (station_id => INNER,  csm_id => 0,  polmux_id => 0,  en => "111111111111111111", legacy => "000000000000000000"),
    1  => (station_id => INNER,  csm_id => 1,  polmux_id => 1,  en => "111111111111111111", legacy => "000000000000000000"),
    2  => (station_id => INNER,  csm_id => 2,  polmux_id => 2,  en => "111111111111111111", legacy => "000000000000000000"),
    3  => (station_id => INNER,  csm_id => 3,  polmux_id => 3,  en => "111111111111111111", legacy => "000000000000000000"),
    4  => (station_id => INNER,  csm_id => 4,  polmux_id => 4,  en => "111111111111111111", legacy => "000000000000000000"),
    5  => (station_id => INNER,  csm_id => 5,  polmux_id => 5,  en => "111111111111111111", legacy => "000000000000000000"),
    6  => (station_id => MIDDLE, csm_id => 0,  polmux_id => 6,  en => "111111111111111111", legacy => "000000000000000000"),
    7  => (station_id => MIDDLE, csm_id => 1,  polmux_id => 7,  en => "111111111111111111", legacy => "000000000000000000"),
    8  => (station_id => MIDDLE, csm_id => 2,  polmux_id => 8,  en => "111111111111111111", legacy => "000000000000000000"),
    9  => (station_id => MIDDLE, csm_id => 3,  polmux_id => 9,  en => "111111111111111111", legacy => "000000000000000000"),
    10 => (station_id => MIDDLE, csm_id => 4,  polmux_id => 10, en => "111111111111111111", legacy => "000000000000000000"),
    11 => (station_id => MIDDLE, csm_id => 5,  polmux_id => 11, en => "111111111111111111", legacy => "000000000000000000"),
    12 => (station_id => OUTER,  csm_id => 0,  polmux_id => 12, en => "111111111111111111", legacy => "000000000000000000"),
    13 => (station_id => OUTER,  csm_id => 1,  polmux_id => 13, en => "111111111111111111", legacy => "000000000000000000"),
    14 => (station_id => OUTER,  csm_id => 2,  polmux_id => 14, en => "111111111111111111", legacy => "000000000000000000"),
    15 => (station_id => OUTER,  csm_id => 3,  polmux_id => 15, en => "111111111111111111", legacy => "000000000000000000"),
    16 => (station_id => OUTER,  csm_id => 4,  polmux_id => 16, en => "111111111111111111", legacy => "000000000000000000"),
    17 => (station_id => OUTER,  csm_id => 5,  polmux_id => 17, en => "111111111111111111", legacy => "000000000000000000")
    );

  --constant c_MDT_CONFIG : mdt_config_t (17 downto 0) := (
  --  0  => (station_id => INNER,  polmux_id => 0,  en => "000000000111111111", legacy => "000000000000000000"),
  --  1  => (station_id => INNER,  polmux_id => 1,  en => "111111111000000000", legacy => "000000000000000000"),
  --  2  => (station_id => INNER,  polmux_id => 2,  en => "000000000111111111", legacy => "000000000000000000"),
  --  3  => (station_id => INNER,  polmux_id => 3,  en => "111111111000000000", legacy => "000000000000000000"),
  --  4  => (station_id => MIDDLE, polmux_id => 4,  en => "000000000111111111", legacy => "000000000000000000"),
  --  5  => (station_id => MIDDLE, polmux_id => 5,  en => "111111111000000000", legacy => "000000000000000000"),
  --  6  => (station_id => MIDDLE, polmux_id => 6,  en => "000000000111111111", legacy => "000000000000000000"),
  --  7  => (station_id => MIDDLE, polmux_id => 6,  en => "111111111000000000", legacy => "000000000000000000"),
  --  8  => (station_id => OUTER,  polmux_id => 7,  en => "000000000111111111", legacy => "000000000000000000"),
  --  9  => (station_id => OUTER,  polmux_id => 7,  en => "111111111000000000", legacy => "000000000000000000"),
  --  10 => (station_id => OUTER,  polmux_id => 8,  en => "000000000111111111", legacy => "000000000000000000"),
  --  11 => (station_id => OUTER,  polmux_id => 8,  en => "111111111000000000", legacy => "000000000000000000"),
  --  12 => (station_id => EXTRA,  polmux_id => 9,  en => "000000000111111111", legacy => "000000000000000000"),
  --  13 => (station_id => EXTRA,  polmux_id => 9,  en => "111111111000000000", legacy => "000000000000000000"),
  --  14 => (station_id => EXTRA,  polmux_id => 10,  en => "000000000111111111", legacy => "000000000000000000"),
  --  15 => (station_id => EXTRA,  polmux_id => 10,  en => "111111111000000000", legacy => "000000000000000000"),
  --  16 => (station_id => EXTRA,  polmux_id => 11,  en => "000000000111111111", legacy => "000000000000000000"),
  --  17 => (station_id => EXTRA,  polmux_id => 11,  en => "111111111000000000", legacy => "000000000000000000")
  --  );

end package board_pkg;

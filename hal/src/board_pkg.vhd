library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.board_pkg_common.all;

package board_pkg is

  constant c_NUM_MGTS                 : integer := 44 + 32;

  -- choose the nth felix RX link which should be used as the clock recovery source and connected to the LPGBT
  constant c_FELIX_RECCLK_SRC : integer := 0;

  constant c_MGT_MAP : mgt_inst_array_t (c_NUM_MGTS-1 downto 0) := (

-- mgt#    => (mgt_type          , refclk , gt_type , x , y)
    0      => (MGT_NIL           ,  0     , GTY     , 0 , 0)  , -- C2C
    1      => (MGT_NIL           ,  0     , GTY     , 0 , 1)  , -- C2C
    2      => (MGT_NIL           ,  0     , GTY     , 0 , 2)  , -- C2C
    3      => (MGT_NIL           ,  0     , GTY     , 0 , 3)  , -- C2C
    4      => (MGT_NIL           ,  1     , GTY     , 0 , 4)  , -- CM2CM
    5      => (MGT_NIL           ,  1     , GTY     , 0 , 5)  , -- CM2CM
    6      => (MGT_NIL           ,  1     , GTY     , 0 , 6)  , -- CM2CM
    7      => (MGT_NIL           ,  1     , GTY     , 0 , 7)  , -- CM2CM
    8      => (MGT_SL            ,  2     , GTY     , 0 , 8)  , -- Sector Logic 0
    9      => (MGT_SL            ,  2     , GTY     , 0 , 9)  , -- Sector Logic 1
    10     => (MGT_SL            ,  2     , GTY     , 0 , 10) , -- Sector Logic 2
    11     => (MGT_SL            ,  2     , GTY     , 0 , 11) , -- Sector Logic 3
    12     => (MGT_SL            ,  3     , GTY     , 0 , 12) , -- Sector Logic 4
    13     => (MGT_SL            ,  3     , GTY     , 0 , 13) , -- Sector Logic 5
    14     => (MGT_SL            ,  3     , GTY     , 0 , 14) , -- Sector Logic 6
    15     => (MGT_SL            ,  3     , GTY     , 0 , 15) , -- Sector Logic 7
    16     => (MGT_SL            ,  4     , GTY     , 0 , 16) , -- Sector Logic 8
    17     => (MGT_SL            ,  4     , GTY     , 0 , 17) , -- Sector Logic 9
    18     => (MGT_SL            ,  4     , GTY     , 0 , 18) , -- Sector Logic 10
    19     => (MGT_SL            ,  4     , GTY     , 0 , 19) , -- Sector Logic 11
    20     => (MGT_FELIX         ,  5     , GTY     , 0 , 20) , -- FELIX 0
    21     => (MGT_FELIX         ,  5     , GTY     , 0 , 21) , -- FELIX 1
    22     => (MGT_FELIX         ,  5     , GTY     , 0 , 22) , -- FELIX 2
    23     => (MGT_FELIX         ,  5     , GTY     , 0 , 23) , -- FELIX 3
    24     => (MGT_FELIX         ,  6     , GTY     , 0 , 24) , -- FELIX 4
    25     => (MGT_FELIX         ,  6     , GTY     , 0 , 25) , -- FELIX 5
    26     => (MGT_FELIX         ,  6     , GTY     , 0 , 26) , -- FELIX 6
    27     => (MGT_FELIX         ,  6     , GTY     , 0 , 27) , -- FELIX 7
    28     => (MGT_FELIX         ,  7     , GTY     , 0 , 28) , -- FELIX 8
    29     => (MGT_FELIX         ,  7     , GTY     , 0 , 29) , -- FELIX 9
    30     => (MGT_FELIX         ,  7     , GTY     , 0 , 30) , -- FELIX 10
    31     => (MGT_FELIX         ,  7     , GTY     , 0 , 31) , -- FELIX 11
-- mgt#    => (mgt_type          , refclk , gt_type , x , y)
    32     => (MGT_NIL           , 12     , GTH     , 0 , 0)  ,
    33     => (MGT_NIL           , 12     , GTH     , 0 , 1)  ,
    34     => (MGT_NIL           , 12     , GTH     , 0 , 2)  ,
    35     => (MGT_NIL           , 12     , GTH     , 0 , 3)  ,
    36     => (MGT_NIL           , 13     , GTH     , 0 , 4)  ,
    37     => (MGT_NIL           , 13     , GTH     , 0 , 5)  ,
    38     => (MGT_NIL           , 13     , GTH     , 0 , 6)  ,
    39     => (MGT_NIL           , 13     , GTH     , 0 , 7)  ,
    40     => (MGT_LPGBT         , 14     , GTH     , 0 , 8)  ,
    41     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 9)  ,
    42     => (MGT_LPGBT         , 14     , GTH     , 0 , 10) ,
    43     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 11) ,
    44     => (MGT_LPGBT         , 14     , GTH     , 0 , 12) ,
    45     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 13) ,
    46     => (MGT_LPGBT         , 14     , GTH     , 0 , 14) ,
    47     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 15) ,
    48     => (MGT_LPGBT         , 14     , GTH     , 0 , 16) ,
    49     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 17) ,
    50     => (MGT_LPGBT         , 14     , GTH     , 0 , 18) ,
    51     => (MGT_LPGBT_SIMPLEX , 14     , GTH     , 0 , 19) ,
    52     => (MGT_LPGBT         , 16     , GTH     , 0 , 20) ,
    53     => (MGT_LPGBT_SIMPLEX , 16     , GTH     , 0 , 21) ,
    54     => (MGT_LPGBT         , 16     , GTH     , 0 , 22) ,
    55     => (MGT_LPGBT_SIMPLEX , 16     , GTH     , 0 , 23) ,
    56     => (MGT_LPGBT         , 16     , GTH     , 0 , 24) ,
    57     => (MGT_LPGBT_SIMPLEX , 16     , GTH     , 0 , 25) ,
    58     => (MGT_LPGBT         , 16     , GTH     , 0 , 26) ,
    59     => (MGT_LPGBT_SIMPLEX , 16     , GTH     , 0 , 27) ,
    60     => (MGT_LPGBT         , 18     , GTH     , 0 , 28) ,
    61     => (MGT_LPGBT_SIMPLEX , 18     , GTH     , 0 , 29) ,
    62     => (MGT_LPGBT         , 18     , GTH     , 0 , 30) ,
    63     => (MGT_LPGBT_SIMPLEX , 18     , GTH     , 0 , 31) ,
    64     => (MGT_LPGBT         , 19     , GTH     , 0 , 32) ,
    65     => (MGT_LPGBT_SIMPLEX , 19     , GTH     , 0 , 33) ,
    66     => (MGT_LPGBT         , 19     , GTH     , 0 , 34) ,
    67     => (MGT_LPGBT_SIMPLEX , 19     , GTH     , 0 , 35) ,
    68     => (MGT_LPGBT         , 20     , GTH     , 0 , 36) ,
    69     => (MGT_LPGBT_SIMPLEX , 20     , GTH     , 0 , 37) ,
    70     => (MGT_LPGBT         , 20     , GTH     , 0 , 38) ,
    71     => (MGT_LPGBT_SIMPLEX , 20     , GTH     , 0 , 39) ,
    72     => (MGT_LPGBT         , 21     , GTH     , 0 , 40) ,
    73     => (MGT_LPGBT_SIMPLEX , 21     , GTH     , 0 , 41) ,
    74     => (MGT_LPGBT         , 21     , GTH     , 0 , 42) ,
    75     => (MGT_LPGBT_SIMPLEX , 21     , GTH     , 0 , 43) ,
    others => MGT_NIL_MAP
    );

  constant c_NUM_REFCLKS : integer := 22;

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

  -- FIXME: the max of this loop should be based on the CSM max # of fibers...
  -- can I count it? need to sum # of slave tdcs + number of masters
  constant c_TDC_LINK_MAP : tdc_link_map_array_t (c_NUM_MGTS*14-1 downto 0) := (
    -- this is assigned by the global MGT link ID (e.g. 0 to 75 on a ku15p)
    -- mgt link id           , even elink # , odd elink #         , station

    0 => (link_id => 41 , ch => 0  , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    1 => (link_id => 41 , ch => 1  , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    2 => (link_id => 41 , ch => 2  , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    3 => (link_id => 41 , ch => 3  , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    4 => (link_id => 41 , ch => 4  , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    5 => (link_id => 41 , ch => 5  , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    6 => (link_id => 41 , ch => 6  , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    7 => (link_id => 41 , ch => 7  , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    8 => (link_id => 42 , ch => 8  , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    9 => (link_id => 42 , ch => 9  , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    10 => (link_id => 42 , ch => 10 , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    11 => (link_id => 42 , ch => 11 , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    12 => (link_id => 42 , ch => 12 , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    13 => (link_id => 42 , ch => 13 , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    14 => (link_id => 42 , ch => 14 , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    15 => (link_id => 42 , ch => 15 , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    16 => (link_id => 43 , ch => 16 , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    17 => (link_id => 43 , ch => 17 , station_id   => INNER , polmux_id => 0  , legacy => false) ,
    18 => (link_id => 43 , ch => 0    , station_id => INNER , polmux_id => 1  , legacy => false) ,
    19 => (link_id => 43 , ch => 1    , station_id => INNER , polmux_id => 1  , legacy => false) ,
    20 => (link_id => 43 , ch => 2    , station_id => INNER , polmux_id => 1  , legacy => false) ,
    21 => (link_id => 43 , ch => 3    , station_id => INNER , polmux_id => 1  , legacy => false) ,
    22 => (link_id => 44 , ch => 4    , station_id => INNER , polmux_id => 1  , legacy => false) ,
    23 => (link_id => 44 , ch => 5    , station_id => INNER , polmux_id => 1  , legacy => false) ,
    24 => (link_id => 44 , ch => 6    , station_id => INNER , polmux_id => 1  , legacy => false) ,
    25 => (link_id => 44 , ch => 7    , station_id => INNER , polmux_id => 1  , legacy => false) ,
    26 => (link_id => 44 , ch => 8    , station_id => INNER , polmux_id => 1  , legacy => false) ,
    27 => (link_id => 44 , ch => 9    , station_id => INNER , polmux_id => 1  , legacy => false) ,
    28 => (link_id => 44 , ch => 10   , station_id => INNER , polmux_id => 1  , legacy => false) ,
    29 => (link_id => 44 , ch => 11   , station_id => INNER , polmux_id => 1  , legacy => false) ,
    30 => (link_id => 45 , ch => 12   , station_id => INNER , polmux_id => 1  , legacy => false) ,
    31 => (link_id => 45 , ch => 13   , station_id => INNER , polmux_id => 1  , legacy => false) ,
    32 => (link_id => 45 , ch => 14   , station_id => INNER , polmux_id => 1  , legacy => false) ,
    33 => (link_id => 45 , ch => 15   , station_id => INNER , polmux_id => 1  , legacy => false) ,
    34 => (link_id => 45 , ch => 16   , station_id => INNER , polmux_id => 1  , legacy => false) ,
    35 => (link_id => 45 , ch => 17   , station_id => INNER , polmux_id => 1  , legacy => false) ,
    36 => (link_id => 46 , ch => 0   , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    37 => (link_id => 46 , ch => 1   , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    38 => (link_id => 46 , ch => 2   , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    39 => (link_id => 46 , ch => 3   , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    40 => (link_id => 46 , ch => 4   , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    41 => (link_id => 46 , ch => 5   , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    42 => (link_id => 46 , ch => 6   , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    43 => (link_id => 46 , ch => 7   , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    44 => (link_id => 47 , ch => 8   , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    45 => (link_id => 47 , ch => 9   , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    46 => (link_id => 47 , ch => 10  , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    47 => (link_id => 47 , ch => 11  , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    48 => (link_id => 47 , ch => 12  , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    49 => (link_id => 47 , ch => 13  , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    50 => (link_id => 47 , ch => 14  , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    51 => (link_id => 47 , ch => 15  , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    52 => (link_id => 48 , ch => 16  , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    53 => (link_id => 48 , ch => 17  , station_id  => INNER , polmux_id => 2  , legacy => false) ,
    54 => (link_id => 48 , ch => 0   , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    55 => (link_id => 48 , ch => 1   , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    56 => (link_id => 48 , ch => 2   , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    57 => (link_id => 48 , ch => 3   , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    58 => (link_id => 49 , ch => 4   , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    59 => (link_id => 49 , ch => 5   , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    60 => (link_id => 49 , ch => 6   , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    61 => (link_id => 49 , ch => 7   , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    62 => (link_id => 49 , ch => 8   , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    63 => (link_id => 49 , ch => 9   , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    64 => (link_id => 49 , ch => 10  , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    65 => (link_id => 49 , ch => 11  , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    66 => (link_id => 50 , ch => 12  , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    67 => (link_id => 50 , ch => 13  , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    68 => (link_id => 50 , ch => 14  , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    69 => (link_id => 50 , ch => 15  , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    70 => (link_id => 50 , ch => 16  , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    71 => (link_id => 50 , ch => 17  , station_id  => INNER , polmux_id => 3  , legacy => false) ,
    72 => (link_id => 51 , ch => 0   , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    73 => (link_id => 51 , ch => 1   , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    74 => (link_id => 51 , ch => 2   , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    75 => (link_id => 51 , ch => 3   , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    76 => (link_id => 51 , ch => 4   , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    77 => (link_id => 51 , ch => 5   , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    78 => (link_id => 51 , ch => 6   , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    79 => (link_id => 51 , ch => 7   , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    80 => (link_id => 52 , ch => 8   , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    81 => (link_id => 52 , ch => 9   , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    82 => (link_id => 52 , ch => 10  , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    83 => (link_id => 52 , ch => 11  , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    84 => (link_id => 52 , ch => 12  , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    85 => (link_id => 52 , ch => 13  , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    86 => (link_id => 52 , ch => 14  , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    87 => (link_id => 52 , ch => 15  , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    88 => (link_id => 53 , ch => 16  , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    89 => (link_id => 53 , ch => 17  , station_id  => INNER , polmux_id => 4  , legacy => false) ,
    90 => (link_id => 53 , ch => 0   , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    91 => (link_id => 53 , ch => 1   , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    92 => (link_id => 53 , ch => 2   , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    93 => (link_id => 53 , ch => 3   , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    94 => (link_id => 54 , ch => 4   , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    95 => (link_id => 54 , ch => 5   , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    96 => (link_id => 54 , ch => 6   , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    97 => (link_id => 54 , ch => 7   , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    98 => (link_id => 54 , ch => 8   , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    99 => (link_id => 54 , ch => 9   , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    100 => (link_id => 54 , ch => 10  , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    101 => (link_id => 54 , ch => 11  , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    102 => (link_id => 55 , ch => 12  , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    103 => (link_id => 55 , ch => 13  , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    104 => (link_id => 55 , ch => 14  , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    105 => (link_id => 55 , ch => 15  , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    106 => (link_id => 55 , ch => 16  , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    107 => (link_id => 55 , ch => 17  , station_id  => INNER , polmux_id => 5  , legacy => false) ,
    108 => (link_id => 56 , ch => 0   , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    109 => (link_id => 56 , ch => 1   , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    110 => (link_id => 56 , ch => 2   , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    111 => (link_id => 56 , ch => 3   , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    112 => (link_id => 56 , ch => 4   , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    113 => (link_id => 56 , ch => 5   , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    114 => (link_id => 56 , ch => 6   , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    115 => (link_id => 56 , ch => 7   , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    116 => (link_id => 57 , ch => 8   , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    117 => (link_id => 57 , ch => 9   , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    118 => (link_id => 57 , ch => 10  , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    119 => (link_id => 57 , ch => 11  , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    120 => (link_id => 57 , ch => 12  , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    121 => (link_id => 57 , ch => 13  , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    122 => (link_id => 57 , ch => 14  , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    123 => (link_id => 57 , ch => 15  , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    124 => (link_id => 58 , ch => 16  , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    125 => (link_id => 58 , ch => 17  , station_id  => MIDDLE , polmux_id => 6  , legacy => false) ,
    126 => (link_id => 58 , ch => 0   , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    127 => (link_id => 58 , ch => 1   , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    128 => (link_id => 58 , ch => 2   , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    129 => (link_id => 58 , ch => 3   , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    130 => (link_id => 59 , ch => 4   , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    131 => (link_id => 59 , ch => 5   , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    132 => (link_id => 59 , ch => 6   , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    133 => (link_id => 59 , ch => 7   , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    134 => (link_id => 59 , ch => 8   , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    135 => (link_id => 59 , ch => 9   , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    136 => (link_id => 59 , ch => 10  , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    137 => (link_id => 59 , ch => 11  , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    138 => (link_id => 60 , ch => 12  , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    139 => (link_id => 60 , ch => 13  , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    140 => (link_id => 60 , ch => 14  , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    141 => (link_id => 60 , ch => 15  , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    142 => (link_id => 60 , ch => 16  , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    143 => (link_id => 60 , ch => 17  , station_id  => MIDDLE , polmux_id => 7  , legacy => false) ,
    144 => (link_id => 61 , ch => 0   , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    145 => (link_id => 61 , ch => 1   , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    146 => (link_id => 61 , ch => 2   , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    147 => (link_id => 61 , ch => 3   , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    148 => (link_id => 61 , ch => 4   , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    149 => (link_id => 61 , ch => 5   , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    150 => (link_id => 61 , ch => 6   , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    151 => (link_id => 61 , ch => 7   , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    152 => (link_id => 62 , ch => 8   , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    153 => (link_id => 62 , ch => 9   , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    154 => (link_id => 62 , ch => 10  , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    155 => (link_id => 62 , ch => 11  , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    156 => (link_id => 62 , ch => 12  , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    157 => (link_id => 62 , ch => 13  , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    158 => (link_id => 62 , ch => 14  , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    159 => (link_id => 62 , ch => 15  , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    160 => (link_id => 63 , ch => 16  , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    161 => (link_id => 63 , ch => 17  , station_id  => MIDDLE , polmux_id => 8  , legacy => false) ,
    162 => (link_id => 63 , ch => 0   , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    163 => (link_id => 63 , ch => 1   , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    164 => (link_id => 63 , ch => 2   , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    165 => (link_id => 63 , ch => 3   , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    166 => (link_id => 64 , ch => 4   , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    167 => (link_id => 64 , ch => 5   , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    168 => (link_id => 64 , ch => 6   , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    169 => (link_id => 64 , ch => 7   , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    170 => (link_id => 64 , ch => 8   , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    171 => (link_id => 64 , ch => 9   , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    172 => (link_id => 64 , ch => 10  , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    173 => (link_id => 64 , ch => 11  , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    174 => (link_id => 65 , ch => 12  , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    175 => (link_id => 65 , ch => 13  , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    176 => (link_id => 65 , ch => 14  , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    177 => (link_id => 65 , ch => 15  , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    178 => (link_id => 65 , ch => 16  , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    179 => (link_id => 65 , ch => 17  , station_id  => MIDDLE , polmux_id => 9  , legacy => false) ,
    180 => (link_id => 66 , ch => 0   , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    181 => (link_id => 66 , ch => 1   , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    182 => (link_id => 66 , ch => 2   , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    183 => (link_id => 66 , ch => 3   , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    184 => (link_id => 66 , ch => 4   , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    185 => (link_id => 66 , ch => 5   , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    186 => (link_id => 66 , ch => 6   , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    187 => (link_id => 66 , ch => 7   , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    188 => (link_id => 67 , ch => 8   , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    189 => (link_id => 67 , ch => 9   , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    190 => (link_id => 67 , ch => 10  , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    191 => (link_id => 67 , ch => 11  , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    192 => (link_id => 67 , ch => 12  , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    193 => (link_id => 67 , ch => 13  , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    194 => (link_id => 67 , ch => 14  , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    195 => (link_id => 67 , ch => 15  , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    196 => (link_id => 68 , ch => 16  , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    197 => (link_id => 68 , ch => 17  , station_id  => MIDDLE , polmux_id => 10 , legacy => false) ,
    198 => (link_id => 68 , ch => 0   , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    199 => (link_id => 68 , ch => 1   , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    200 => (link_id => 68 , ch => 2   , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    201 => (link_id => 68 , ch => 3   , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    202 => (link_id => 69 , ch => 4   , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    203 => (link_id => 69 , ch => 5   , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    204 => (link_id => 69 , ch => 6   , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    205 => (link_id => 69 , ch => 7   , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    206 => (link_id => 69 , ch => 8   , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    207 => (link_id => 69 , ch => 9   , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    208 => (link_id => 69 , ch => 10  , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    209 => (link_id => 69 , ch => 11  , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    210 => (link_id => 70 , ch => 12  , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    211 => (link_id => 70 , ch => 13  , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    212 => (link_id => 70 , ch => 14  , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    213 => (link_id => 70 , ch => 15  , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    214 => (link_id => 70 , ch => 16  , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,
    215 => (link_id => 70 , ch => 17  , station_id  => OUTER  , polmux_id => 11 , legacy => false) ,

    -- Others
    others => (link_id => -1 , ch => -1  , station_id => NIL, polmux_id => -1 , legacy => false)
    );

end package board_pkg;

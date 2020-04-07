library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.board_pkg_common.all;

package board_pkg is

  constant c_NUM_MGTS                 : integer := 44 + 32;
  constant c_NUM_REFCLKS              : integer := (c_NUM_MGTS/4);

  constant c_MGT_MAP : mgt_inst_array_t (c_NUM_MGTS-1 downto 0) := (

-- mgt#    => (mgt_type          , refclk , gt_type , x , y)
    0      => (MGT_LPGBT         , 0      , GTH     , 0 , 0)  ,
    1      => (MGT_LPGBT_SIMPLEX , 0      , GTH     , 0 , 1)  ,
    2      => (MGT_LPGBT         , 0      , GTH     , 0 , 2)  ,
    3      => (MGT_LPGBT_SIMPLEX , 0      , GTH     , 0 , 3)  ,
    4      => (MGT_LPGBT         , 1      , GTH     , 0 , 4)  ,
    5      => (MGT_LPGBT_SIMPLEX , 1      , GTH     , 0 , 5)  ,
    6      => (MGT_LPGBT         , 1      , GTH     , 0 , 6)  ,
    7      => (MGT_LPGBT_SIMPLEX , 1      , GTH     , 0 , 7)  ,
    8      => (MGT_LPGBT         , 2      , GTH     , 0 , 8)  ,
    9      => (MGT_LPGBT_SIMPLEX , 2      , GTH     , 0 , 9)  ,
    10     => (MGT_LPGBT         , 2      , GTH     , 0 , 10) ,
    11     => (MGT_LPGBT_SIMPLEX , 2      , GTH     , 0 , 11) ,
    12     => (MGT_LPGBT         , 3      , GTH     , 0 , 12) ,
    13     => (MGT_LPGBT_SIMPLEX , 3      , GTH     , 0 , 13) ,
    14     => (MGT_LPGBT         , 3      , GTH     , 0 , 14) ,
    15     => (MGT_LPGBT_SIMPLEX , 3      , GTH     , 0 , 15) ,
    16     => (MGT_LPGBT         , 4      , GTH     , 0 , 16) ,
    17     => (MGT_LPGBT_SIMPLEX , 4      , GTH     , 0 , 17) ,
    18     => (MGT_LPGBT         , 4      , GTH     , 0 , 18) ,
    19     => (MGT_LPGBT_SIMPLEX , 4      , GTH     , 0 , 19) ,
    20     => (MGT_LPGBT         , 5      , GTH     , 0 , 20) ,
    21     => (MGT_LPGBT_SIMPLEX , 5      , GTH     , 0 , 21) ,
    22     => (MGT_LPGBT         , 5      , GTH     , 0 , 22) ,
    23     => (MGT_LPGBT_SIMPLEX , 5      , GTH     , 0 , 23) ,
    24     => (MGT_LPGBT         , 6      , GTH     , 0 , 24) ,
    25     => (MGT_LPGBT_SIMPLEX , 6      , GTH     , 0 , 25) ,
    26     => (MGT_LPGBT         , 6      , GTH     , 0 , 26) ,
    27     => (MGT_LPGBT_SIMPLEX , 6      , GTH     , 0 , 27) ,
    28     => (MGT_LPGBT         , 7      , GTH     , 0 , 28) ,
    29     => (MGT_LPGBT_SIMPLEX , 7      , GTH     , 0 , 29) ,
    30     => (MGT_LPGBT         , 7      , GTH     , 0 , 30) ,
    31     => (MGT_LPGBT_SIMPLEX , 7      , GTH     , 0 , 31) ,
    32     => (MGT_SL            , 8      , GTH     , 0 , 32) ,
    33     => (MGT_SL            , 8      , GTH     , 0 , 33) ,
    34     => (MGT_SL            , 8      , GTH     , 0 , 34) ,
    35     => (MGT_SL            , 8      , GTH     , 0 , 35) ,
    36     => (MGT_SL            , 9      , GTH     , 0 , 36) ,
    37     => (MGT_SL            , 9      , GTH     , 0 , 37) ,
    38     => (MGT_SL            , 9      , GTH     , 0 , 38) ,
    39     => (MGT_SL            , 9      , GTH     , 0 , 39) ,
    40     => (MGT_SL            , 10     , GTH     , 0 , 40) ,
    41     => (MGT_SL            , 10     , GTH     , 0 , 41) ,
    42     => (MGT_SL            , 10     , GTH     , 0 , 42) ,
    43     => (MGT_SL            , 10     , GTH     , 0 , 43) ,
-- mgt#    => (mgt_type          , refclk , gt_type , x , y)
    44     => (MGT_LPGBT_SIMPLEX , 11     , GTY     , 0 , 0)  ,
    45     => (MGT_LPGBT         , 11     , GTY     , 0 , 1)  ,
    46     => (MGT_LPGBT_SIMPLEX , 11     , GTY     , 0 , 2)  ,
    47     => (MGT_LPGBT         , 11     , GTY     , 0 , 3)  ,
    48     => (MGT_LPGBT_SIMPLEX , 12     , GTY     , 0 , 4)  ,
    49     => (MGT_LPGBT         , 12     , GTY     , 0 , 5)  ,
    50     => (MGT_LPGBT_SIMPLEX , 12     , GTY     , 0 , 6)  ,
    51     => (MGT_LPGBT         , 12     , GTY     , 0 , 7)  ,
    52     => (MGT_LPGBT_SIMPLEX , 13     , GTY     , 0 , 8)  ,
    53     => (MGT_LPGBT         , 13     , GTY     , 0 , 9)  ,
    54     => (MGT_LPGBT_SIMPLEX , 13     , GTY     , 0 , 10) ,
    55     => (MGT_LPGBT         , 13     , GTY     , 0 , 11) ,
    56     => (MGT_LPGBT_SIMPLEX , 14     , GTY     , 0 , 12) ,
    57     => (MGT_LPGBT         , 14     , GTY     , 0 , 13) ,
    58     => (MGT_LPGBT_SIMPLEX , 14     , GTY     , 0 , 14) ,
    59     => (MGT_LPGBT         , 14     , GTY     , 0 , 15) ,
    60     => (MGT_LPGBT_EMUL    , 15     , GTY     , 0 , 16) ,
    61     => (MGT_LPGBT_EMUL    , 15     , GTY     , 0 , 17) ,
    62     => (MGT_LPGBT_EMUL    , 15     , GTY     , 0 , 18) ,
    63     => (MGT_LPGBT_EMUL    , 15     , GTY     , 0 , 19) ,
    64     => c_mgt_nil ,
    65     => c_mgt_nil ,
    66     => c_mgt_nil ,
    67     => c_mgt_nil ,
    68     => c_mgt_nil ,
    69     => c_mgt_nil ,
    70     => c_mgt_nil ,
    71     => c_mgt_nil ,
    72     => c_mgt_nil ,
    73     => c_mgt_nil ,
    74     => c_mgt_nil ,
    75     => c_mgt_nil      ,
    others => c_mgt_nil
    );

  constant c_REFCLK_TYPES : refclk_types_array_t (c_NUM_REFCLKS-1 downto 0) := (
    0      => REFCLK_SYNC320 ,
    1      => REFCLK_SYNC320 ,
    2      => REFCLK_SYNC320 ,
    3      => REFCLK_SYNC320 ,
    4      => REFCLK_SYNC320 ,
    others => REFCLK_NIL
    );

  -- FIXME: the max of this loop should be based on the CSM max # of fibers...
  -- can I count it? need to sum # of slave tdcs + number of masters
  constant c_TDC_LINK_MAP : tdc_link_map_array_t (c_NUM_MGTS*14-1 downto 0) := (
    -- this is assigned by the global MGT link ID (e.g. 0 to 75 on a ku15p)
    -- mgt link id           , even elink #, odd elink #, station
    0   => (link_id => 0   , elink  => 0,  station_id => 0, polmux_id => 0,  legacy => false),
    1   => (link_id => 0   , elink  => 2,  station_id => 0, polmux_id => 0,  legacy => false),
    2   => (link_id => 0   , elink  => 4,  station_id => 0, polmux_id => 0,  legacy => false),
    3   => (link_id => 0   , elink  => 6,  station_id => 0, polmux_id => 0,  legacy => false),
    4   => (link_id => 0   , elink  => 8,  station_id => 0, polmux_id => 0,  legacy => false),
    5   => (link_id => 0   , elink  => 10, station_id => 0, polmux_id => 0,  legacy => false),
    6   => (link_id => 0   , elink  => 12, station_id => 0, polmux_id => 0,  legacy => false),
    7   => (link_id => 0   , elink  => 14, station_id => 0, polmux_id => 0,  legacy => false),
    8   => (link_id => 0   , elink  => 16, station_id => 0, polmux_id => 0,  legacy => false),
    9   => (link_id => 0   , elink  => 18, station_id => 0, polmux_id => 0,  legacy => false),
    10  => (link_id => 0   , elink  => 20, station_id => 0, polmux_id => 0,  legacy => false),
    11  => (link_id => 0   , elink  => 22, station_id => 0, polmux_id => 0,  legacy => false),
    12  => (link_id => 0   , elink  => 24, station_id => 0, polmux_id => 0,  legacy => false),
    13  => (link_id => 0   , elink  => 26, station_id => 0, polmux_id => 0,  legacy => false),
    14  => (link_id => 1   , elink  => 0,  station_id => 0, polmux_id => 0,  legacy => false),
    15  => (link_id => 1   , elink  => 2,  station_id => 0, polmux_id => 0,  legacy => false),
    16  => (link_id => 1   , elink  => 4,  station_id => 0, polmux_id => 0,  legacy => false),
    17  => (link_id => 1   , elink  => 6,  station_id => 0, polmux_id => 0,  legacy => false),
    18  => (link_id => 1   , elink  => 8,  station_id => 0, polmux_id => 0,  legacy => false),
    19  => (link_id => 1   , elink  => 10, station_id => 0, polmux_id => 0,  legacy => false),
    20  => (link_id => 1   , elink  => 12, station_id => 0, polmux_id => 1,  legacy => false),
    21  => (link_id => 1   , elink  => 14, station_id => 0, polmux_id => 1,  legacy => false),
    22  => (link_id => 1   , elink  => 16, station_id => 0, polmux_id => 1,  legacy => false),
    23  => (link_id => 1   , elink  => 18, station_id => 0, polmux_id => 1,  legacy => false),
    24  => (link_id => 1   , elink  => 20, station_id => 0, polmux_id => 1,  legacy => false),
    25  => (link_id => 1   , elink  => 22, station_id => 0, polmux_id => 1,  legacy => false),
    26  => (link_id => 1   , elink  => 24, station_id => 0, polmux_id => 1,  legacy => false),
    27  => (link_id => 1   , elink  => 26, station_id => 0, polmux_id => 1,  legacy => false),
    28  => (link_id => 2   , elink  => 0,  station_id => 0, polmux_id => 1,  legacy => false),
    29  => (link_id => 2   , elink  => 2,  station_id => 0, polmux_id => 1,  legacy => false),
    30  => (link_id => 2   , elink  => 4,  station_id => 0, polmux_id => 1,  legacy => false),
    31  => (link_id => 2   , elink  => 6,  station_id => 0, polmux_id => 1,  legacy => false),
    32  => (link_id => 2   , elink  => 8,  station_id => 0, polmux_id => 1,  legacy => false),
    33  => (link_id => 2   , elink  => 10, station_id => 0, polmux_id => 1,  legacy => false),
    34  => (link_id => 2   , elink  => 12, station_id => 0, polmux_id => 1,  legacy => false),
    35  => (link_id => 2   , elink  => 14, station_id => 0, polmux_id => 1,  legacy => false),
    36  => (link_id => 2   , elink  => 16, station_id => 0, polmux_id => 1,  legacy => false),
    37  => (link_id => 2   , elink  => 18, station_id => 0, polmux_id => 1,  legacy => false),
    38  => (link_id => 2   , elink  => 20, station_id => 0, polmux_id => 1,  legacy => false),
    39  => (link_id => 2   , elink  => 22, station_id => 0, polmux_id => 1,  legacy => false),
    40  => (link_id => 2   , elink  => 24, station_id => 0, polmux_id => 2,  legacy => false),
    41  => (link_id => 2   , elink  => 26, station_id => 0, polmux_id => 2,  legacy => false),
    42  => (link_id => 3   , elink  => 0,  station_id => 0, polmux_id => 2,  legacy => false),
    43  => (link_id => 3   , elink  => 2,  station_id => 0, polmux_id => 2,  legacy => false),
    44  => (link_id => 3   , elink  => 4,  station_id => 0, polmux_id => 2,  legacy => false),
    45  => (link_id => 3   , elink  => 6,  station_id => 0, polmux_id => 2,  legacy => false),
    46  => (link_id => 3   , elink  => 8,  station_id => 0, polmux_id => 2,  legacy => false),
    47  => (link_id => 3   , elink  => 10, station_id => 0, polmux_id => 2,  legacy => false),
    48  => (link_id => 3   , elink  => 12, station_id => 0, polmux_id => 2,  legacy => false),
    49  => (link_id => 3   , elink  => 14, station_id => 0, polmux_id => 2,  legacy => false),
    50  => (link_id => 3   , elink  => 16, station_id => 0, polmux_id => 2,  legacy => false),
    51  => (link_id => 3   , elink  => 18, station_id => 0, polmux_id => 2,  legacy => false),
    52  => (link_id => 3   , elink  => 20, station_id => 0, polmux_id => 2,  legacy => false),
    53  => (link_id => 3   , elink  => 22, station_id => 0, polmux_id => 2,  legacy => false),
    54  => (link_id => 3   , elink  => 24, station_id => 0, polmux_id => 2,  legacy => false),
    55  => (link_id => 3   , elink  => 26, station_id => 0, polmux_id => 2,  legacy => false),
    56  => (link_id => 4   , elink  => 0,  station_id => 0, polmux_id => 2,  legacy => false),
    57  => (link_id => 4   , elink  => 2,  station_id => 0, polmux_id => 2,  legacy => false),
    58  => (link_id => 4   , elink  => 4,  station_id => 0, polmux_id => 2,  legacy => false),
    59  => (link_id => 4   , elink  => 6,  station_id => 0, polmux_id => 2,  legacy => false),
    60  => (link_id => 4   , elink  => 8,  station_id => 0, polmux_id => 3,  legacy => false),
    61  => (link_id => 4   , elink  => 10, station_id => 0, polmux_id => 3,  legacy => false),
    62  => (link_id => 4   , elink  => 12, station_id => 0, polmux_id => 3,  legacy => false),
    63  => (link_id => 4   , elink  => 14, station_id => 0, polmux_id => 3,  legacy => false),
    64  => (link_id => 4   , elink  => 16, station_id => 0, polmux_id => 3,  legacy => false),
    65  => (link_id => 4   , elink  => 18, station_id => 0, polmux_id => 3,  legacy => false),
    66  => (link_id => 4   , elink  => 20, station_id => 0, polmux_id => 3,  legacy => false),
    67  => (link_id => 4   , elink  => 22, station_id => 0, polmux_id => 3,  legacy => false),
    68  => (link_id => 4   , elink  => 24, station_id => 0, polmux_id => 3,  legacy => false),
    69  => (link_id => 4   , elink  => 26, station_id => 0, polmux_id => 3,  legacy => false),
    70  => (link_id => 5   , elink  => 0,  station_id => 0, polmux_id => 3,  legacy => false),
    71  => (link_id => 5   , elink  => 2,  station_id => 0, polmux_id => 3,  legacy => false),
    72  => (link_id => 5   , elink  => 4,  station_id => 0, polmux_id => 3,  legacy => false),
    73  => (link_id => 5   , elink  => 6,  station_id => 0, polmux_id => 3,  legacy => false),
    74  => (link_id => 5   , elink  => 8,  station_id => 0, polmux_id => 3,  legacy => false),
    75  => (link_id => 5   , elink  => 10, station_id => 0, polmux_id => 3,  legacy => false),
    76  => (link_id => 5   , elink  => 12, station_id => 0, polmux_id => 3,  legacy => false),
    77  => (link_id => 5   , elink  => 14, station_id => 0, polmux_id => 3,  legacy => false),
    78  => (link_id => 5   , elink  => 16, station_id => 0, polmux_id => 3,  legacy => false),
    79  => (link_id => 5   , elink  => 18, station_id => 0, polmux_id => 3,  legacy => false),
    80  => (link_id => 5   , elink  => 20, station_id => 0, polmux_id => 4,  legacy => false),
    81  => (link_id => 5   , elink  => 22, station_id => 0, polmux_id => 4,  legacy => false),
    82  => (link_id => 5   , elink  => 24, station_id => 0, polmux_id => 4,  legacy => false),
    83  => (link_id => 5   , elink  => 26, station_id => 0, polmux_id => 4,  legacy => false),
    84  => (link_id => 6   , elink  => 0,  station_id => 0, polmux_id => 4,  legacy => false),
    85  => (link_id => 6   , elink  => 2,  station_id => 0, polmux_id => 4,  legacy => false),
    86  => (link_id => 6   , elink  => 4,  station_id => 0, polmux_id => 4,  legacy => false),
    87  => (link_id => 6   , elink  => 6,  station_id => 0, polmux_id => 4,  legacy => false),
    88  => (link_id => 6   , elink  => 8,  station_id => 0, polmux_id => 4,  legacy => false),
    89  => (link_id => 6   , elink  => 10, station_id => 0, polmux_id => 4,  legacy => false),
    90  => (link_id => 6   , elink  => 12, station_id => 0, polmux_id => 4,  legacy => false),
    91  => (link_id => 6   , elink  => 14, station_id => 0, polmux_id => 4,  legacy => false),
    92  => (link_id => 6   , elink  => 16, station_id => 0, polmux_id => 4,  legacy => false),
    93  => (link_id => 6   , elink  => 18, station_id => 0, polmux_id => 4,  legacy => false),
    94  => (link_id => 6   , elink  => 20, station_id => 0, polmux_id => 4,  legacy => false),
    95  => (link_id => 6   , elink  => 22, station_id => 0, polmux_id => 4,  legacy => false),
    96  => (link_id => 6   , elink  => 24, station_id => 0, polmux_id => 4,  legacy => false),
    97  => (link_id => 6   , elink  => 26, station_id => 0, polmux_id => 4,  legacy => false),
    98  => (link_id => 7   , elink  => 0,  station_id => 0, polmux_id => 4,  legacy => false),
    99  => (link_id => 7   , elink  => 2,  station_id => 0, polmux_id => 4,  legacy => false),
    100 => (link_id => 7   , elink  => 4,  station_id => 0, polmux_id => 5,  legacy => false),
    101 => (link_id => 7   , elink  => 6,  station_id => 0, polmux_id => 5,  legacy => false),
    102 => (link_id => 7   , elink  => 8,  station_id => 0, polmux_id => 5,  legacy => false),
    103 => (link_id => 7   , elink  => 10, station_id => 0, polmux_id => 5,  legacy => false),
    104 => (link_id => 7   , elink  => 12, station_id => 0, polmux_id => 5,  legacy => false),
    105 => (link_id => 7   , elink  => 14, station_id => 0, polmux_id => 5,  legacy => false),
    106 => (link_id => 7   , elink  => 16, station_id => 0, polmux_id => 5,  legacy => false),
    107 => (link_id => 7   , elink  => 18, station_id => 0, polmux_id => 5,  legacy => false),
    108 => (link_id => 7   , elink  => 20, station_id => 0, polmux_id => 5,  legacy => false),
    109 => (link_id => 7   , elink  => 22, station_id => 0, polmux_id => 5,  legacy => false),
    110 => (link_id => 7   , elink  => 24, station_id => 0, polmux_id => 5,  legacy => false),
    111 => (link_id => 7   , elink  => 26, station_id => 0, polmux_id => 5,  legacy => false),
    112 => (link_id => 8   , elink  => 0,  station_id => 0, polmux_id => 5,  legacy => false),
    113 => (link_id => 8   , elink  => 2,  station_id => 0, polmux_id => 5,  legacy => false),
    114 => (link_id => 8   , elink  => 4,  station_id => 0, polmux_id => 5,  legacy => false),
    115 => (link_id => 8   , elink  => 6,  station_id => 0, polmux_id => 5,  legacy => false),
    116 => (link_id => 8   , elink  => 8,  station_id => 0, polmux_id => 5,  legacy => false),
    117 => (link_id => 8   , elink  => 10, station_id => 0, polmux_id => 5,  legacy => false),
    118 => (link_id => 8   , elink  => 12, station_id => 0, polmux_id => 5,  legacy => false),
    119 => (link_id => 8   , elink  => 14, station_id => 0, polmux_id => 5,  legacy => false),
    120 => (link_id => 8   , elink  => 16, station_id => 0, polmux_id => 6,  legacy => false),
    121 => (link_id => 8   , elink  => 18, station_id => 0, polmux_id => 6,  legacy => false),
    122 => (link_id => 8   , elink  => 20, station_id => 0, polmux_id => 6,  legacy => false),
    123 => (link_id => 8   , elink  => 22, station_id => 0, polmux_id => 6,  legacy => false),
    124 => (link_id => 8   , elink  => 24, station_id => 0, polmux_id => 6,  legacy => false),
    125 => (link_id => 8   , elink  => 26, station_id => 0, polmux_id => 6,  legacy => false),
    126 => (link_id => 9   , elink  => 0,  station_id => 0, polmux_id => 6,  legacy => false),
    127 => (link_id => 9   , elink  => 2,  station_id => 0, polmux_id => 6,  legacy => false),
    128 => (link_id => 9   , elink  => 4,  station_id => 0, polmux_id => 6,  legacy => false),
    129 => (link_id => 9   , elink  => 6,  station_id => 0, polmux_id => 6,  legacy => false),
    130 => (link_id => 9   , elink  => 8,  station_id => 0, polmux_id => 6,  legacy => false),
    131 => (link_id => 9   , elink  => 10, station_id => 0, polmux_id => 6,  legacy => false),
    132 => (link_id => 9   , elink  => 12, station_id => 0, polmux_id => 6,  legacy => false),
    133 => (link_id => 9   , elink  => 14, station_id => 0, polmux_id => 6,  legacy => false),
    134 => (link_id => 9   , elink  => 16, station_id => 0, polmux_id => 6,  legacy => false),
    135 => (link_id => 9   , elink  => 18, station_id => 0, polmux_id => 6,  legacy => false),
    136 => (link_id => 9   , elink  => 20, station_id => 0, polmux_id => 6,  legacy => false),
    137 => (link_id => 9   , elink  => 22, station_id => 0, polmux_id => 6,  legacy => false),
    138 => (link_id => 9   , elink  => 24, station_id => 0, polmux_id => 6,  legacy => false),
    139 => (link_id => 9   , elink  => 26, station_id => 0, polmux_id => 6,  legacy => false),
    140 => (link_id => 10   , elink => 0,  station_id => 0, polmux_id => 7,  legacy => false),
    141 => (link_id => 10   , elink => 2,  station_id => 0, polmux_id => 7,  legacy => false),
    142 => (link_id => 10   , elink => 4,  station_id => 0, polmux_id => 7,  legacy => false),
    143 => (link_id => 10   , elink => 6,  station_id => 0, polmux_id => 7,  legacy => false),
    144 => (link_id => 10   , elink => 8,  station_id => 0, polmux_id => 7,  legacy => false),
    145 => (link_id => 10   , elink => 10, station_id => 0, polmux_id => 7,  legacy => false),
    146 => (link_id => 10   , elink => 12, station_id => 0, polmux_id => 7,  legacy => false),
    147 => (link_id => 10   , elink => 14, station_id => 0, polmux_id => 7,  legacy => false),
    148 => (link_id => 10   , elink => 16, station_id => 0, polmux_id => 7,  legacy => false),
    149 => (link_id => 10   , elink => 18, station_id => 0, polmux_id => 7,  legacy => false),
    150 => (link_id => 10   , elink => 20, station_id => 0, polmux_id => 7,  legacy => false),
    151 => (link_id => 10   , elink => 22, station_id => 0, polmux_id => 7,  legacy => false),
    152 => (link_id => 10   , elink => 24, station_id => 0, polmux_id => 7,  legacy => false),
    153 => (link_id => 10   , elink => 26, station_id => 0, polmux_id => 7,  legacy => false),
    154 => (link_id => 11   , elink => 0,  station_id => 0, polmux_id => 7,  legacy => false),
    155 => (link_id => 11   , elink => 2,  station_id => 0, polmux_id => 7,  legacy => false),
    156 => (link_id => 11   , elink => 4,  station_id => 0, polmux_id => 7,  legacy => false),
    157 => (link_id => 11   , elink => 6,  station_id => 0, polmux_id => 7,  legacy => false),
    158 => (link_id => 11   , elink => 8,  station_id => 0, polmux_id => 7,  legacy => false),
    159 => (link_id => 11   , elink => 10, station_id => 0, polmux_id => 7,  legacy => false),
    160 => (link_id => 11   , elink => 12, station_id => 0, polmux_id => 8,  legacy => false),
    161 => (link_id => 11   , elink => 14, station_id => 0, polmux_id => 8,  legacy => false),
    162 => (link_id => 11   , elink => 16, station_id => 0, polmux_id => 8,  legacy => false),
    163 => (link_id => 11   , elink => 18, station_id => 0, polmux_id => 8,  legacy => false),
    164 => (link_id => 11   , elink => 20, station_id => 0, polmux_id => 8,  legacy => false),
    165 => (link_id => 11   , elink => 22, station_id => 0, polmux_id => 8,  legacy => false),
    166 => (link_id => 11   , elink => 24, station_id => 0, polmux_id => 8,  legacy => false),
    167 => (link_id => 11   , elink => 26, station_id => 0, polmux_id => 8,  legacy => false),
    168 => (link_id => 12   , elink => 0,  station_id => 0, polmux_id => 8,  legacy => false),
    169 => (link_id => 12   , elink => 2,  station_id => 0, polmux_id => 8,  legacy => false),
    170 => (link_id => 12   , elink => 4,  station_id => 0, polmux_id => 8,  legacy => false),
    171 => (link_id => 12   , elink => 6,  station_id => 0, polmux_id => 8,  legacy => false),
    172 => (link_id => 12   , elink => 8,  station_id => 0, polmux_id => 8,  legacy => false),
    173 => (link_id => 12   , elink => 10, station_id => 0, polmux_id => 8,  legacy => false),
    174 => (link_id => 12   , elink => 12, station_id => 0, polmux_id => 8,  legacy => false),
    175 => (link_id => 12   , elink => 14, station_id => 0, polmux_id => 8,  legacy => false),
    176 => (link_id => 12   , elink => 16, station_id => 0, polmux_id => 8,  legacy => false),
    177 => (link_id => 12   , elink => 18, station_id => 0, polmux_id => 8,  legacy => false),
    178 => (link_id => 12   , elink => 20, station_id => 0, polmux_id => 8,  legacy => false),
    179 => (link_id => 12   , elink => 22, station_id => 0, polmux_id => 8,  legacy => false),
    180 => (link_id => 12   , elink => 24, station_id => 0, polmux_id => 9,  legacy => false),
    181 => (link_id => 12   , elink => 26, station_id => 0, polmux_id => 9,  legacy => false),
    182 => (link_id => 13   , elink => 0,  station_id => 0, polmux_id => 9,  legacy => false),
    183 => (link_id => 13   , elink => 2,  station_id => 0, polmux_id => 9,  legacy => false),
    184 => (link_id => 13   , elink => 4,  station_id => 0, polmux_id => 9,  legacy => false),
    185 => (link_id => 13   , elink => 6,  station_id => 0, polmux_id => 9,  legacy => false),
    186 => (link_id => 13   , elink => 8,  station_id => 0, polmux_id => 9,  legacy => false),
    187 => (link_id => 13   , elink => 10, station_id => 0, polmux_id => 9,  legacy => false),
    188 => (link_id => 13   , elink => 12, station_id => 0, polmux_id => 9,  legacy => false),
    189 => (link_id => 13   , elink => 14, station_id => 0, polmux_id => 9,  legacy => false),
    190 => (link_id => 13   , elink => 16, station_id => 0, polmux_id => 9,  legacy => false),
    191 => (link_id => 13   , elink => 18, station_id => 0, polmux_id => 9,  legacy => false),
    192 => (link_id => 13   , elink => 20, station_id => 0, polmux_id => 9,  legacy => false),
    193 => (link_id => 13   , elink => 22, station_id => 0, polmux_id => 9,  legacy => false),
    194 => (link_id => 13   , elink => 24, station_id => 0, polmux_id => 9,  legacy => false),
    195 => (link_id => 13   , elink => 26, station_id => 0, polmux_id => 9,  legacy => false),
    196 => (link_id => 14   , elink => 0,  station_id => 0, polmux_id => 9,  legacy => false),
    197 => (link_id => 14   , elink => 2,  station_id => 0, polmux_id => 9,  legacy => false),
    198 => (link_id => 14   , elink => 4,  station_id => 0, polmux_id => 9,  legacy => false),
    199 => (link_id => 14   , elink => 6,  station_id => 0, polmux_id => 9,  legacy => false),
    200 => (link_id => 14   , elink => 8,  station_id => 0, polmux_id => 10, legacy => false),
    201 => (link_id => 14   , elink => 10, station_id => 0, polmux_id => 10, legacy => false),
    202 => (link_id => 14   , elink => 12, station_id => 0, polmux_id => 10, legacy => false),
    203 => (link_id => 14   , elink => 14, station_id => 0, polmux_id => 10, legacy => false),
    204 => (link_id => 14   , elink => 16, station_id => 0, polmux_id => 10, legacy => false),
    205 => (link_id => 14   , elink => 18, station_id => 0, polmux_id => 10, legacy => false),
    206 => (link_id => 14   , elink => 20, station_id => 0, polmux_id => 10, legacy => false),
    207 => (link_id => 14   , elink => 22, station_id => 0, polmux_id => 10, legacy => false),
    208 => (link_id => 14   , elink => 24, station_id => 0, polmux_id => 10, legacy => false),
    209 => (link_id => 14   , elink => 26, station_id => 0, polmux_id => 10, legacy => false),
    210 => (link_id => 15   , elink => 0,  station_id => 0, polmux_id => 10, legacy => false),
    211 => (link_id => 15   , elink => 2,  station_id => 0, polmux_id => 10, legacy => false),
    212 => (link_id => 15   , elink => 4,  station_id => 0, polmux_id => 10, legacy => false),
    213 => (link_id => 15   , elink => 6,  station_id => 0, polmux_id => 10, legacy => false),
    214 => (link_id => 15   , elink => 8,  station_id => 0, polmux_id => 10, legacy => false),
    215 => (link_id => 15   , elink => 10, station_id => 0, polmux_id => 10, legacy => false),
    216 => (link_id => 15   , elink => 12, station_id => 0, polmux_id => 10, legacy => false),
    217 => (link_id => 15   , elink => 14, station_id => 0, polmux_id => 10, legacy => false),
    218 => (link_id => 15   , elink => 16, station_id => 0, polmux_id => 10, legacy => false),
    219 => (link_id => 15   , elink => 18, station_id => 0, polmux_id => 10, legacy => false),
    220 => (link_id => 15   , elink => 20, station_id => 0, polmux_id => 11, legacy => false),
    221 => (link_id => 15   , elink => 22, station_id => 0, polmux_id => 11, legacy => false),
    222 => (link_id => 15   , elink => 24, station_id => 0, polmux_id => 11, legacy => false),
    223 => (link_id => 15   , elink => 26, station_id => 0, polmux_id => 11, legacy => false),
    224 => (link_id => 16   , elink => 0,  station_id => 0, polmux_id => 11, legacy => false),
    225 => (link_id => 16   , elink => 2,  station_id => 0, polmux_id => 11, legacy => false),
    226 => (link_id => 16   , elink => 4,  station_id => 0, polmux_id => 11, legacy => false),
    227 => (link_id => 16   , elink => 6,  station_id => 0, polmux_id => 11, legacy => false),
    228 => (link_id => 16   , elink => 8,  station_id => 0, polmux_id => 11, legacy => false),
    229 => (link_id => 16   , elink => 10, station_id => 0, polmux_id => 11, legacy => false),
    230 => (link_id => 16   , elink => 12, station_id => 0, polmux_id => 11, legacy => false),
    231 => (link_id => 16   , elink => 14, station_id => 0, polmux_id => 11, legacy => false),
    232 => (link_id => 16   , elink => 16, station_id => 0, polmux_id => 11, legacy => false),
    233 => (link_id => 16   , elink => 18, station_id => 0, polmux_id => 11, legacy => false),
    234 => (link_id => 16   , elink => 20, station_id => 0, polmux_id => 11, legacy => false),
    235 => (link_id => 16   , elink => 22, station_id => 0, polmux_id => 11, legacy => false),
    236 => (link_id => 16   , elink => 24, station_id => 0, polmux_id => 11, legacy => false),
    237 => (link_id => 16   , elink => 26, station_id => 0, polmux_id => 11, legacy => false),
    238 => (link_id => 17   , elink => 0,  station_id => 0, polmux_id => 11, legacy => false),
    239 => (link_id => 17   , elink => 2,  station_id => 0, polmux_id => 11, legacy => false),
    240 => (link_id => 17   , elink => 4,  station_id => 0, polmux_id => 12, legacy => false),
    241 => (link_id => 17   , elink => 6,  station_id => 0, polmux_id => 12, legacy => false),
    242 => (link_id => 17   , elink => 8,  station_id => 0, polmux_id => 12, legacy => false),
    243 => (link_id => 17   , elink => 10, station_id => 0, polmux_id => 12, legacy => false),
    244 => (link_id => 17   , elink => 12, station_id => 0, polmux_id => 12, legacy => false),
    245 => (link_id => 17   , elink => 14, station_id => 0, polmux_id => 12, legacy => false),
    246 => (link_id => 17   , elink => 16, station_id => 0, polmux_id => 12, legacy => false),
    247 => (link_id => 17   , elink => 18, station_id => 0, polmux_id => 12, legacy => false),
    248 => (link_id => 17   , elink => 20, station_id => 0, polmux_id => 12, legacy => false),
    249 => (link_id => 17   , elink => 22, station_id => 0, polmux_id => 12, legacy => false),
    250 => (link_id => 17   , elink => 24, station_id => 0, polmux_id => 12, legacy => false),
    251 => (link_id => 17   , elink => 26, station_id => 0, polmux_id => 12, legacy => false),
    252 => (link_id => 18   , elink => 0,  station_id => 0, polmux_id => 12, legacy => false),
    253 => (link_id => 18   , elink => 2,  station_id => 0, polmux_id => 12, legacy => false),
    254 => (link_id => 18   , elink => 4,  station_id => 0, polmux_id => 12, legacy => false),
    255 => (link_id => 18   , elink => 6,  station_id => 0, polmux_id => 12, legacy => false),
    256 => (link_id => 18   , elink => 8,  station_id => 0, polmux_id => 12, legacy => false),
    257 => (link_id => 18   , elink => 10, station_id => 0, polmux_id => 12, legacy => false),
    258 => (link_id => 18   , elink => 12, station_id => 0, polmux_id => 12, legacy => false),
    259 => (link_id => 18   , elink => 14, station_id => 0, polmux_id => 12, legacy => false),
    260 => (link_id => 18   , elink => 16, station_id => 0, polmux_id => 13, legacy => false),
    261 => (link_id => 18   , elink => 18, station_id => 0, polmux_id => 13, legacy => false),
    262 => (link_id => 18   , elink => 20, station_id => 0, polmux_id => 13, legacy => false),
    263 => (link_id => 18   , elink => 22, station_id => 0, polmux_id => 13, legacy => false),
    264 => (link_id => 18   , elink => 24, station_id => 0, polmux_id => 13, legacy => false),
    265 => (link_id => 18   , elink => 26, station_id => 0, polmux_id => 13, legacy => false),
    266 => (link_id => 19   , elink => 0,  station_id => 0, polmux_id => 13, legacy => false),
    267 => (link_id => 19   , elink => 2,  station_id => 0, polmux_id => 13, legacy => false),
    268 => (link_id => 19   , elink => 4,  station_id => 0, polmux_id => 13, legacy => false),
    269 => (link_id => 19   , elink => 6,  station_id => 0, polmux_id => 13, legacy => false),
    270 => (link_id => 19   , elink => 8,  station_id => 0, polmux_id => 13, legacy => false),
    271 => (link_id => 19   , elink => 10, station_id => 0, polmux_id => 13, legacy => false),
    272 => (link_id => 19   , elink => 12, station_id => 0, polmux_id => 13, legacy => false),
    273 => (link_id => 19   , elink => 14, station_id => 0, polmux_id => 13, legacy => false),
    274 => (link_id => 19   , elink => 16, station_id => 0, polmux_id => 13, legacy => false),
    275 => (link_id => 19   , elink => 18, station_id => 0, polmux_id => 13, legacy => false),
    276 => (link_id => 19   , elink => 20, station_id => 0, polmux_id => 13, legacy => false),
    277 => (link_id => 19   , elink => 22, station_id => 0, polmux_id => 13, legacy => false),
    278 => (link_id => 19   , elink => 24, station_id => 0, polmux_id => 13, legacy => false),
    279 => (link_id => 19   , elink => 26, station_id => 0, polmux_id => 13, legacy => false),
    280 => (link_id => 20   , elink => 0,  station_id => 0, polmux_id => 14, legacy => false),
    281 => (link_id => 20   , elink => 2,  station_id => 0, polmux_id => 14, legacy => false),
    282 => (link_id => 20   , elink => 4,  station_id => 0, polmux_id => 14, legacy => false),
    283 => (link_id => 20   , elink => 6,  station_id => 0, polmux_id => 14, legacy => false),
    284 => (link_id => 20   , elink => 8,  station_id => 0, polmux_id => 14, legacy => false),
    285 => (link_id => 20   , elink => 10, station_id => 0, polmux_id => 14, legacy => false),
    286 => (link_id => 20   , elink => 12, station_id => 0, polmux_id => 14, legacy => false),
    287 => (link_id => 20   , elink => 14, station_id => 0, polmux_id => 14, legacy => false),
    288 => (link_id => 20   , elink => 16, station_id => 0, polmux_id => 14, legacy => false),
    289 => (link_id => 20   , elink => 18, station_id => 0, polmux_id => 14, legacy => false),
    290 => (link_id => 20   , elink => 20, station_id => 0, polmux_id => 14, legacy => false),
    291 => (link_id => 20   , elink => 22, station_id => 0, polmux_id => 14, legacy => false),
    292 => (link_id => 20   , elink => 24, station_id => 0, polmux_id => 14, legacy => false),
    293 => (link_id => 20   , elink => 26, station_id => 0, polmux_id => 14, legacy => false),
    294 => (link_id => 21   , elink => 0,  station_id => 0, polmux_id => 14, legacy => false),
    295 => (link_id => 21   , elink => 2,  station_id => 0, polmux_id => 14, legacy => false),
    296 => (link_id => 21   , elink => 4,  station_id => 0, polmux_id => 14, legacy => false),
    297 => (link_id => 21   , elink => 6,  station_id => 0, polmux_id => 14, legacy => false),
    298 => (link_id => 21   , elink => 8,  station_id => 0, polmux_id => 14, legacy => false),
    299 => (link_id => 21   , elink => 10, station_id => 0, polmux_id => 14, legacy => false),
    300 => (link_id => 21   , elink => 12, station_id => 0, polmux_id => 15, legacy => false),
    301 => (link_id => 21   , elink => 14, station_id => 0, polmux_id => 15, legacy => false),
    302 => (link_id => 21   , elink => 16, station_id => 0, polmux_id => 15, legacy => false),
    303 => (link_id => 21   , elink => 18, station_id => 0, polmux_id => 15, legacy => false),
    304 => (link_id => 21   , elink => 20, station_id => 0, polmux_id => 15, legacy => false),
    305 => (link_id => 21   , elink => 22, station_id => 0, polmux_id => 15, legacy => false),
    306 => (link_id => 21   , elink => 24, station_id => 0, polmux_id => 15, legacy => false),
    307 => (link_id => 21   , elink => 26, station_id => 0, polmux_id => 15, legacy => false),
    308 => (link_id => 22   , elink => 0,  station_id => 0, polmux_id => 15, legacy => false),
    309 => (link_id => 22   , elink => 2,  station_id => 0, polmux_id => 15, legacy => false),
    310 => (link_id => 22   , elink => 4,  station_id => 0, polmux_id => 15, legacy => false),
    311 => (link_id => 22   , elink => 6,  station_id => 0, polmux_id => 15, legacy => false),
    312 => (link_id => 22   , elink => 8,  station_id => 0, polmux_id => 15, legacy => false),
    313 => (link_id => 22   , elink => 10, station_id => 0, polmux_id => 15, legacy => false),
    314 => (link_id => 22   , elink => 12, station_id => 0, polmux_id => 15, legacy => false),
    315 => (link_id => 22   , elink => 14, station_id => 0, polmux_id => 15, legacy => false),
    316 => (link_id => 22   , elink => 16, station_id => 0, polmux_id => 15, legacy => false),
    317 => (link_id => 22   , elink => 18, station_id => 0, polmux_id => 15, legacy => false),
    318 => (link_id => 22   , elink => 20, station_id => 0, polmux_id => 15, legacy => false),
    319 => (link_id => 22   , elink => 22, station_id => 0, polmux_id => 15, legacy => false),
    320 => (link_id => 22   , elink => 24, station_id => 0, polmux_id => 16, legacy => false),
    321 => (link_id => 22   , elink => 26, station_id => 0, polmux_id => 16, legacy => false),
    322 => (link_id => 23   , elink => 0,  station_id => 0, polmux_id => 16, legacy => false),
    323 => (link_id => 23   , elink => 2,  station_id => 0, polmux_id => 16, legacy => false),
    324 => (link_id => 23   , elink => 4,  station_id => 0, polmux_id => 16, legacy => false),
    325 => (link_id => 23   , elink => 6,  station_id => 0, polmux_id => 16, legacy => false),
    326 => (link_id => 23   , elink => 8,  station_id => 0, polmux_id => 16, legacy => false),
    327 => (link_id => 23   , elink => 10, station_id => 0, polmux_id => 16, legacy => false),
    328 => (link_id => 23   , elink => 12, station_id => 0, polmux_id => 16, legacy => false),
    329 => (link_id => 23   , elink => 14, station_id => 0, polmux_id => 16, legacy => false),
    330 => (link_id => 23   , elink => 16, station_id => 0, polmux_id => 16, legacy => false),
    331 => (link_id => 23   , elink => 18, station_id => 0, polmux_id => 16, legacy => false),
    332 => (link_id => 23   , elink => 20, station_id => 0, polmux_id => 16, legacy => false),
    333 => (link_id => 23   , elink => 22, station_id => 0, polmux_id => 16, legacy => false),
    334 => (link_id => 23   , elink => 24, station_id => 0, polmux_id => 16, legacy => false),
    335 => (link_id => 23   , elink => 26, station_id => 0, polmux_id => 16, legacy => false),
    336 => (link_id => 24   , elink => 0,  station_id => 0, polmux_id => 16, legacy => false),
    337 => (link_id => 24   , elink => 2,  station_id => 0, polmux_id => 16, legacy => false),
    338 => (link_id => 24   , elink => 4,  station_id => 0, polmux_id => 16, legacy => false),
    339 => (link_id => 24   , elink => 6,  station_id => 0, polmux_id => 16, legacy => false),
    340 => (link_id => 24   , elink => 8,  station_id => 0, polmux_id => 17, legacy => false),
    341 => (link_id => 24   , elink => 10, station_id => 0, polmux_id => 17, legacy => false),
    342 => (link_id => 24   , elink => 12, station_id => 0, polmux_id => 17, legacy => false),
    343 => (link_id => 24   , elink => 14, station_id => 0, polmux_id => 17, legacy => false),
    344 => (link_id => 24   , elink => 16, station_id => 0, polmux_id => 17, legacy => false),
    345 => (link_id => 24   , elink => 18, station_id => 0, polmux_id => 17, legacy => false),
    346 => (link_id => 24   , elink => 20, station_id => 0, polmux_id => 17, legacy => false),
    347 => (link_id => 24   , elink => 22, station_id => 0, polmux_id => 17, legacy => false),
    348 => (link_id => 24   , elink => 24, station_id => 0, polmux_id => 17, legacy => false),
    349 => (link_id => 24   , elink => 26, station_id => 0, polmux_id => 17, legacy => false),
    350 => (link_id => 25   , elink => 0,  station_id => 0, polmux_id => 17, legacy => false),
    351 => (link_id => 25   , elink => 2,  station_id => 0, polmux_id => 17, legacy => false),
    352 => (link_id => 25   , elink => 4,  station_id => 0, polmux_id => 17, legacy => false),
    353 => (link_id => 25   , elink => 6,  station_id => 0, polmux_id => 17, legacy => false),
    354 => (link_id => 25   , elink => 8,  station_id => 0, polmux_id => 17, legacy => false),
    355 => (link_id => 25   , elink => 10, station_id => 0, polmux_id => 17, legacy => false),
    356 => (link_id => 25   , elink => 12, station_id => 0, polmux_id => 17, legacy => false),
    357 => (link_id => 25   , elink => 14, station_id => 0, polmux_id => 17, legacy => false),
    358 => (link_id => 25   , elink => 16, station_id => 0, polmux_id => 17, legacy => false),
    359 => (link_id => 25   , elink => 18, station_id => 0, polmux_id => 17, legacy => false),
    others => (-1, -1, -1, -1, false)
    );

end package board_pkg;

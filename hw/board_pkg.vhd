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
    60     => (MGT_LPGBT_SIMPLEX , 15     , GTY     , 0 , 16) ,
    61     => (MGT_LPGBT         , 15     , GTY     , 0 , 17) ,
    62     => (MGT_LPGBT_SIMPLEX , 15     , GTY     , 0 , 18) ,
    63     => (MGT_LPGBT         , 15     , GTY     , 0 , 19) ,
    64     => (MGT_LPGBT_SIMPLEX , 16     , GTY     , 0 , 20) ,
    65     => (MGT_LPGBT         , 16     , GTY     , 0 , 21) ,
    66     => (MGT_LPGBT_SIMPLEX , 16     , GTY     , 0 , 22) ,
    67     => (MGT_LPGBT         , 16     , GTY     , 0 , 23) ,
    68     => (MGT_LPGBT_SIMPLEX , 17     , GTY     , 0 , 24) ,
    69     => (MGT_LPGBT         , 17     , GTY     , 0 , 25) ,
    70     => (MGT_LPGBT_SIMPLEX , 17     , GTY     , 0 , 26) ,
    71     => (MGT_LPGBT         , 17     , GTY     , 0 , 27) ,
    72     => (MGT_LPGBT_SIMPLEX , 18     , GTY     , 0 , 28) ,
    73     => (MGT_LPGBT         , 18     , GTY     , 0 , 29) ,
    74     => (MGT_LPGBT_SIMPLEX , 18     , GTY     , 0 , 30) ,
    75     => (MGT_LPGBT         , 18     , GTY     , 0 , 31) ,
    others => c_mgt_nil
    );

  constant c_REFCLK_TYPES : refclk_types_array_t (c_NUM_REFCLKS-1 downto 0) := (
    0      => REFCLK_SYNC320,
    1      => REFCLK_SYNC320,
    2      => REFCLK_SYNC320,
    3      => REFCLK_SYNC320,
    4      => REFCLK_SYNC320,
    others => REFCLK_NIL
    );

  -- FIXME: derive this constant in some sane way
  constant c_TDC_LINK_MAP : tdc_link_map_array_t (c_NUM_MGTS*14-1 downto 0) := (
    -- mgt link id, even elink #, odd elink #, station
    -- this is assigned by the global MGT link ID (e.g. 0 to 75 on a ku15p)
    0      => (lpgbt_link => 0, even_elink => 0, odd_elink => 1, station_id => 0),
    1      => (lpgbt_link => 0, even_elink => 2, odd_elink => 3, station_id => 0),
    2      => (lpgbt_link => 0, even_elink => 4, odd_elink => 5, station_id => 0),
    3      => (lpgbt_link => 0, even_elink => 6, odd_elink => 7, station_id => 0),
    4      => (lpgbt_link => 0, even_elink => 8, odd_elink => 9, station_id => 0),
    5      => (lpgbt_link => 0, even_elink => 10, odd_elink => 11, station_id => 0),
    6      => (lpgbt_link => 0, even_elink => 12, odd_elink => 13, station_id => 0),
    7      => (lpgbt_link => 0, even_elink => 14, odd_elink => 15, station_id => 0),
    8      => (lpgbt_link => 0, even_elink => 16, odd_elink => 17, station_id => 0),
    9      => (lpgbt_link => 0, even_elink => 18, odd_elink => 19, station_id => 0),
    10     => (lpgbt_link => 0, even_elink => 20, odd_elink => 21, station_id => 0),
    11     => (lpgbt_link => 0, even_elink => 22, odd_elink => 23, station_id => 0),
    12     => (lpgbt_link => 0, even_elink => 24, odd_elink => 25, station_id => 0),
    13     => (lpgbt_link => 0, even_elink => 26, odd_elink => 27, station_id => 0),
    others => (-1, -1, -1, -1)
    );

end package board_pkg;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.board_pkg_common.all;

package board_pkg is

  constant c_NUM_MGTS                 : integer := 128;

  -- choose the nth felix RX link which should be used as the clock recovery source and connected to the LPGBT
  constant c_FELIX_RECCLK_SRC : integer := 0; -- TODO: find this from the mgt map with a function

  constant c_MGT_MAP : mgt_inst_array_t (c_NUM_MGTS-1 downto 0) := (

-- mgt#    => (mgt_type         , refclk , gt_type, x , y)
    0      => (MGT_SL          ,  0     , GTY    , 0 , 0)  , -- BANK 120
    1      => (MGT_SL          ,  0     , GTY    , 0 , 1)  , -- BANK 120
    2      => (MGT_SL          ,  0     , GTY    , 0 , 2)  , -- BANK 120
    3      => (MGT_SL          ,  0     , GTY    , 0 , 3)  , -- BANK 120
    4      => (MGT_SL          ,  1     , GTY    , 0 , 4)  , -- BANK 121
    5      => (MGT_SL          ,  1     , GTY    , 0 , 5)  , -- BANK 121
    6      => (MGT_SL          ,  1     , GTY    , 0 , 6)  , -- BANK 121
    7      => (MGT_SL          ,  1     , GTY    , 0 , 7)  , -- BANK 121
    8      => (MGT_SL          ,  2     , GTY    , 0 , 8)  , -- BANK 122
    9      => (MGT_SL          ,  2     , GTY    , 0 , 9)  , -- BANK 122
    10     => (MGT_SL          ,  2     , GTY    , 0 , 10) , -- BANK 122
    11     => (MGT_SL          ,  2     , GTY    , 0 , 11) , -- BANK 122
    12     => (MGT_C2C         ,  3     , GTY    , 0 , 12) , -- BANK 123
    13     => (MGT_C2C         ,  3     , GTY    , 0 , 13) , -- BANK 123
    14     => (MGT_C2C         ,  3     , GTY    , 0 , 14) , -- BANK 123
    15     => (MGT_C2C         ,  3     , GTY    , 0 , 15) , -- BANK 123
    16     => (MGT_LPGBT       ,  4     , GTY    , 0 , 16) , -- BANK 124
    17     => (MGT_LPGBT       ,  4     , GTY    , 0 , 17) , -- BANK 124
    18     => (MGT_LPGBT       ,  4     , GTY    , 0 , 18) , -- BANK 124
    19     => (MGT_LPGBT       ,  4     , GTY    , 0 , 19) , -- BANK 124
    20     => (MGT_LPGBT       ,  5     , GTY    , 0 , 20) , -- BANK 125
    21     => (MGT_LPGBT       ,  5     , GTY    , 0 , 21) , -- BANK 125
    22     => (MGT_LPGBT       ,  5     , GTY    , 0 , 22) , -- BANK 125
    23     => (MGT_LPGBT       ,  5     , GTY    , 0 , 23) , -- BANK 125
    24     => (MGT_LPGBT       ,  6     , GTY    , 0 , 24) , -- BANK 126
    25     => (MGT_LPGBT       ,  6     , GTY    , 0 , 25) , -- BANK 126
    26     => (MGT_LPGBT       ,  6     , GTY    , 0 , 26) , -- BANK 126
    27     => (MGT_LPGBT       ,  6     , GTY    , 0 , 27) , -- BANK 126
    28     => (MGT_LPGBT       ,  7     , GTY    , 0 , 28) , -- BANK 127
    29     => (MGT_LPGBT       ,  7     , GTY    , 0 , 29) , -- BANK 127
    30     => (MGT_LPGBT       ,  7     , GTY    , 0 , 30) , -- BANK 127
    31     => (MGT_LPGBT       ,  7     , GTY    , 0 , 31) , -- BANK 127
    32     => (MGT_LPGBT       ,  8     , GTY    , 0 , 32) , -- BANK 128
    33     => (MGT_LPGBT       ,  8     , GTY    , 0 , 33) , -- BANK 128
    34     => (MGT_LPGBT       ,  8     , GTY    , 0 , 34) , -- BANK 128
    35     => (MGT_LPGBT       ,  8     , GTY    , 0 , 35) , -- BANK 128
    36     => (MGT_LPGBT       ,  9     , GTY    , 0 , 36) , -- BANK 129
    37     => (MGT_LPGBT       ,  9     , GTY    , 0 , 37) , -- BANK 129
    38     => (MGT_LPGBT       ,  9     , GTY    , 0 , 38) , -- BANK 129
    39     => (MGT_LPGBT       ,  9     , GTY    , 0 , 39) , -- BANK 129
    40     => (MGT_LPGBT       ,  10    , GTY    , 0 , 40) , -- BANK 130
    41     => (MGT_LPGBT       ,  10    , GTY    , 0 , 41) , -- BANK 130
    42     => (MGT_LPGBT       ,  10    , GTY    , 0 , 42) , -- BANK 130
    43     => (MGT_LPGBT       ,  10    , GTY    , 0 , 43) , -- BANK 130
    44     => (MGT_LPGBT       ,  11    , GTY    , 0 , 44) , -- BANK 131
    45     => (MGT_LPGBT       ,  11    , GTY    , 0 , 45) , -- BANK 131
    46     => (MGT_LPGBT       ,  11    , GTY    , 0 , 46) , -- BANK 131
    47     => (MGT_LPGBT       ,  11    , GTY    , 0 , 47) , -- BANK 131
    48     => (MGT_LPGBT       ,  12    , GTY    , 0 , 48) , -- BANK 132
    49     => (MGT_LPGBT       ,  12    , GTY    , 0 , 49) , -- BANK 132
    50     => (MGT_LPGBT       ,  12    , GTY    , 0 , 50) , -- BANK 132
    51     => (MGT_LPGBT       ,  12    , GTY    , 0 , 51) , -- BANK 132
    52     => (MGT_LPGBT       ,  13    , GTY    , 0 , 52) , -- BANK 133
    53     => (MGT_LPGBT       ,  13    , GTY    , 0 , 53) , -- BANK 133
    54     => (MGT_LPGBT       ,  13    , GTY    , 0 , 54) , -- BANK 133
    55     => (MGT_LPGBT       ,  13    , GTY    , 0 , 55) , -- BANK 133
    56     => (MGT_LPGBT       ,  14    , GTY    , 0 , 56) , -- BANK 134
    57     => (MGT_LPGBT       ,  14    , GTY    , 0 , 57) , -- BANK 134
    58     => (MGT_LPGBT       ,  14    , GTY    , 0 , 58) , -- BANK 134
    59     => (MGT_LPGBT       ,  14    , GTY    , 0 , 59) , -- BANK 134
    60     => (MGT_LPGBT       ,  15    , GTY    , 0 , 60) , -- BANK 135
    61     => (MGT_LPGBT       ,  15    , GTY    , 0 , 61) , -- BANK 135
    62     => (MGT_LPGBT       ,  15    , GTY    , 0 , 62) , -- BANK 135
    63     => (MGT_LPGBT       ,  15    , GTY    , 0 , 63) , -- BANK 135
    64     => (MGT_LPGBT       ,  16    , GTY    , 1 , 0)  , -- BANK 220
    65     => (MGT_LPGBT       ,  16    , GTY    , 1 , 1)  , -- BANK 220
    66     => (MGT_LPGBT       ,  16    , GTY    , 1 , 2)  , -- BANK 220
    67     => (MGT_LPGBT       ,  16    , GTY    , 1 , 3)  , -- BANK 220
    68     => (MGT_LPGBT       ,  17    , GTY    , 1 , 4)  , -- BANK 221
    69     => (MGT_LPGBT       ,  17    , GTY    , 1 , 5)  , -- BANK 221
    70     => (MGT_LPGBT       ,  17    , GTY    , 1 , 6)  , -- BANK 221
    71     => (MGT_LPGBT       ,  17    , GTY    , 1 , 7)  , -- BANK 221
    72     => (MGT_LPGBT       ,  18    , GTY    , 1 , 8)  , -- BANK 222
    73     => (MGT_LPGBT       ,  18    , GTY    , 1 , 9)  , -- BANK 222
    74     => (MGT_LPGBT       ,  18    , GTY    , 1 , 10) , -- BANK 222
    75     => (MGT_LPGBT       ,  18    , GTY    , 1 , 11) , -- BANK 222
    76     => (MGT_LPGBT       ,  19    , GTY    , 1 , 12) , -- BANK 223
    77     => (MGT_LPGBT       ,  19    , GTY    , 1 , 13) , -- BANK 223
    78     => (MGT_LPGBT       ,  19    , GTY    , 1 , 14) , -- BANK 223
    79     => (MGT_LPGBT       ,  19    , GTY    , 1 , 15) , -- BANK 223
    80     => (MGT_LPGBT       ,  20    , GTY    , 1 , 16) , -- BANK 224
    81     => (MGT_LPGBT       ,  20    , GTY    , 1 , 17) , -- BANK 224
    82     => (MGT_LPGBT       ,  20    , GTY    , 1 , 18) , -- BANK 224
    83     => (MGT_LPGBT       ,  20    , GTY    , 1 , 19) , -- BANK 224
    84     => (MGT_LPGBT       ,  21    , GTY    , 1 , 20) , -- BANK 225
    85     => (MGT_LPGBT       ,  21    , GTY    , 1 , 21) , -- BANK 225
    86     => (MGT_LPGBT       ,  21    , GTY    , 1 , 22) , -- BANK 225
    87     => (MGT_LPGBT       ,  21    , GTY    , 1 , 23) , -- BANK 225
    88     => (MGT_LPGBT       ,  22    , GTY    , 1 , 24) , -- BANK 226
    89     => (MGT_LPGBT       ,  22    , GTY    , 1 , 25) , -- BANK 226
    90     => (MGT_LPGBT       ,  22    , GTY    , 1 , 26) , -- BANK 226
    91     => (MGT_LPGBT       ,  22    , GTY    , 1 , 27) , -- BANK 226
    92     => (MGT_LPGBT       ,  23    , GTY    , 1 , 28) , -- BANK 227
    93     => (MGT_LPGBT       ,  23    , GTY    , 1 , 29) , -- BANK 227
    94     => (MGT_LPGBT       ,  23    , GTY    , 1 , 30) , -- BANK 227
    95     => (MGT_LPGBT       ,  23    , GTY    , 1 , 31) , -- BANK 227
    96     => (MGT_LPGBT       ,  24    , GTY    , 1 , 32) , -- BANK 228
    97     => (MGT_LPGBT       ,  24    , GTY    , 1 , 33) , -- BANK 228
    98     => (MGT_LPGBT       ,  24    , GTY    , 1 , 34) , -- BANK 228
    99     => (MGT_LPGBT       ,  24    , GTY    , 1 , 35) , -- BANK 228
    100    => (MGT_LPGBT       ,  25    , GTY    , 1 , 36) , -- BANK 229
    101    => (MGT_LPGBT       ,  25    , GTY    , 1 , 37) , -- BANK 229
    102    => (MGT_LPGBT       ,  25    , GTY    , 1 , 38) , -- BANK 229
    103    => (MGT_LPGBT       ,  25    , GTY    , 1 , 39) , -- BANK 229
    104    => (MGT_LPGBT       ,  26    , GTY    , 1 , 40) , -- BANK 230
    105    => (MGT_LPGBT       ,  26    , GTY    , 1 , 41) , -- BANK 230
    106    => (MGT_LPGBT       ,  26    , GTY    , 1 , 42) , -- BANK 230
    107    => (MGT_LPGBT       ,  26    , GTY    , 1 , 43) , -- BANK 230
    108    => (MGT_LPGBT       ,  27    , GTY    , 1 , 44) , -- BANK 231
    109    => (MGT_LPGBT       ,  27    , GTY    , 1 , 45) , -- BANK 231
    110    => (MGT_LPGBT       ,  27    , GTY    , 1 , 46) , -- BANK 231
    111    => (MGT_LPGBT       ,  27    , GTY    , 1 , 47) , -- BANK 231
    112    => (MGT_LPGBT       ,  28    , GTY    , 1 , 48) , -- BANK 232
    113    => (MGT_LPGBT       ,  28    , GTY    , 1 , 49) , -- BANK 232
    114    => (MGT_LPGBT       ,  28    , GTY    , 1 , 50) , -- BANK 232
    115    => (MGT_LPGBT       ,  28    , GTY    , 1 , 51) , -- BANK 232
    116    => (MGT_LPGBT       ,  29    , GTY    , 1 , 52) , -- BANK 233
    117    => (MGT_FELIX_TXRX  ,  30    , GTY    , 1 , 53) , -- BANK 233
    118    => (MGT_FELIX       ,  31    , GTY    , 1 , 54) , -- BANK 233
    119    => (MGT_FELIX       ,  31    , GTY    , 1 , 55) , -- BANK 233
    120    => (MGT_FELIX       ,  31    , GTY    , 1 , 56) , -- BANK 234
    121    => (MGT_FELIX       ,  31    , GTY    , 1 , 57) , -- BANK 234
    122    => (MGT_FELIX       ,  31    , GTY    , 1 , 58) , -- BANK 234
    123    => (MGT_FELIX       ,  31    , GTY    , 1 , 59) , -- BANK 234
    124    => (MGT_FELIX       ,  31    , GTY    , 1 , 60) , -- BANK 235
    125    => (MGT_FELIX       ,  31    , GTY    , 1 , 61) , -- BANK 235
    126    => (MGT_FELIX       ,  31    , GTY    , 1 , 62) , -- BANK 235
    127    => (MGT_FELIX       ,  31    , GTY    , 1 , 63) , -- BANK 235
    others => MGT_NIL_MAP
    );

  constant c_NUM_REFCLKS : integer := 32;
  constant C2C_REFCLK_SRC : integer := 5;

  constant c_REFCLK_MAP : refclk_types_array_t (c_NUM_REFCLKS-1 downto 0) := (

    0  => (FREQ => REF_SYNC240),
    1  => (FREQ => REF_SYNC240),
    2  => (FREQ => REF_SYNC240),
    3  => (FREQ => REF_AXI_C2C),
    4  => (FREQ => REF_SYNC320),
    5  => (FREQ => REF_SYNC320),
    6  => (FREQ => REF_SYNC320),
    7  => (FREQ => REF_SYNC320),
    8  => (FREQ => REF_SYNC320),
    9  => (FREQ => REF_SYNC320),
    10 => (FREQ => REF_SYNC320),
    11 => (FREQ => REF_SYNC320),
    12 => (FREQ => REF_SYNC320),
    13 => (FREQ => REF_SYNC320),
    14 => (FREQ => REF_SYNC320),
    15 => (FREQ => REF_SYNC320),

    16 => (FREQ => REF_SYNC320),
    17 => (FREQ => REF_SYNC320),
    18 => (FREQ => REF_SYNC320),
    19 => (FREQ => REF_SYNC320),
    20 => (FREQ => REF_SYNC320),
    21 => (FREQ => REF_SYNC320),
    22 => (FREQ => REF_SYNC320),
    23 => (FREQ => REF_SYNC320),
    24 => (FREQ => REF_SYNC320),
    25 => (FREQ => REF_SYNC320),
    26 => (FREQ => REF_SYNC320),
    27 => (FREQ => REF_SYNC320),
    28 => (FREQ => REF_SYNC320),
    29 => (FREQ => REF_SYNC320),
    30 => (FREQ => REF_ASYNC320), -- need an async clock for clock recovery
    31 => (FREQ => REF_SYNC320),

    others => REFCLK_NIL_MAP

    );

end package board_pkg;

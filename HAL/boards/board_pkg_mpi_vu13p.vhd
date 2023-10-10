-------------------------------------------------------
--! @file
--! @author Andrew Peck
--! @date (March 5th, 2020 3:53 PM) 
--! @brief HAL - Board Package for MDTTP Prototype VU13P FPGA
--! @details     These "board packages" describe board specific information needed by the
--!              hardware abstraction layer.
--!              Specifically, it specifies:
--!              1. The number of MGTs connected
--!              2. The source of the recovered clock
--!              3. A mapping of the MGT links, including their:
--!                 1. Designation (Felix, Sector logic, CSM, etc)
--!                 2. REFCLK source
--!                 3. GT type (GTH vs. GTY)
--!                 4. X/Y location in the chip
--!              4. Information about the reference clocks
--!                 1. Which REFCLK is used for the C2C link
--!                 2. The "type" of each reference clock (LHC 320/240MHz MHz, AXI C2C, etc)
--!              
--!              ** Customization of constants
--!              *** c_NUM_MGTS
--!              *** c_FELIX_RECCLK_SRC
--!              *** c_MGT_MAP
--!              *** c_NUM_REFCLKS
--!              *** C2C_REFCLK_SRC
--!              *** c_REFCLK_MAP

-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.board_pkg_common.all;

package board_pkg is
  --! @brief Package containing constants for the MGT mapping of the MDTTP prototype 

  constant c_NUM_MGTS : integer := 128; --! # number of MGTs

  constant c_CLK_FREQ : integer := 200; --! Clk frequency of the onboard oscillator

  -- choose the nth felix RX link which should be used as the clock recovery source and connected to the LPGBT
  -- becuase of the parsing function, it has to be a MGT_TTC mgt_type
  constant c_FELIX_RECCLK_SRC : integer := 8; -- choose the nth felix RX link which should be used as the clock recovery source and connected to the LPGBT TODO: find this from the mgt map with a function

  -- override recovered clock to be connected to c_FELIX_RECCLK_SRC  if it is not a MGT_TTC mgt_type
  -- this shoul be always false unless you know what you are doing
  -- also this will only output a clock, of course no TTC will be used.
  constant c_OVERRIDE_REC_CLK : boolean := true;
  
  constant c_MGT_MAP : mgt_inst_array_t (c_NUM_MGTS-1 downto 0) := (
    --! Mapping of MGT to type, refclk and location
    --! mgt#    => (mgt_type         , refclk , gt_type, x , y)
    -- SLR0 Left
    0      => (MGT_TTC         ,  0     , GTY    , 0 ,  0) , -- BANK 120 ; tclink
    1      => (MGT_NIL         ,  0     , GTY    , 0 ,  1) , -- BANK 120 ; debug
    2      => (MGT_NIL         ,  0     , GTY    , 0 ,  2) , -- BANK 120 ; debug
    3      => (MGT_NIL         ,  0     , GTY    , 0 ,  3) , -- BANK 120 ; debug
    4      => (MGT_NIL          ,  1     , GTY    , 0 ,  4) , -- BANK 121
    5      => (MGT_NIL          ,  1     , GTY    , 0 ,  5) , -- BANK 121
    6      => (MGT_NIL          ,  1     , GTY    , 0 ,  6) , -- BANK 121
    7      => (MGT_NIL          ,  1     , GTY    , 0 ,  7) , -- BANK 121
    8      => (MGT_SL          ,  2     , GTY    , 0 ,  8) , -- BANK 122
    9      => (MGT_SL          ,  2     , GTY    , 0 ,  9) , -- BANK 122
    10     => (MGT_SL          ,  2     , GTY    , 0 , 10) , -- BANK 122
    11     => (MGT_SL          ,  2     , GTY    , 0 , 11) , -- BANK 122
    12     => (MGT_SL          ,  3     , GTY    , 0 , 12) , -- BANK 123
    13     => (MGT_SL          ,  3     , GTY    , 0 , 13) , -- BANK 123
    14     => (MGT_SL          ,  3     , GTY    , 0 , 14) , -- BANK 123
    15     => (MGT_SL          ,  3     , GTY    , 0 , 15) , -- BANK 123

    -- SLR0 Right
    16     => (MGT_C2C         ,  4     , GTY    , 1 , 0)  , -- BANK 220
    17     => (MGT_C2C         ,  4     , GTY    , 1 , 1)  , -- BANK 220
    18     => (MGT_C2C         ,  4     , GTY    , 1 , 2)  , -- BANK 220
    19     => (MGT_C2C         ,  4     , GTY    , 1 , 3)  , -- BANK 220
    20     => (MGT_LPGBT       ,  5     , GTY    , 1 , 4)  , -- BANK 221
    21     => (MGT_LPGBT       ,  5     , GTY    , 1 , 5)  , -- BANK 221
    22     => (MGT_LPGBT       ,  5     , GTY    , 1 , 6)  , -- BANK 221
    23     => (MGT_LPGBT       ,  5     , GTY    , 1 , 7)  , -- BANK 221
    24     => (MGT_LPGBT       ,  6     , GTY    , 1 , 8)  , -- BANK 222
    25     => (MGT_LPGBT       ,  6     , GTY    , 1 , 9)  , -- BANK 222
    26     => (MGT_LPGBT       ,  6     , GTY    , 1 , 10) , -- BANK 222
    27     => (MGT_LPGBT       ,  6     , GTY    , 1 , 11) , -- BANK 222
    28     => (MGT_LPGBT       ,  7     , GTY    , 1 , 12) , -- BANK 223
    29     => (MGT_LPGBT       ,  7     , GTY    , 1 , 13) , -- BANK 223
    30     => (MGT_LPGBT       ,  7     , GTY    , 1 , 14) , -- BANK 223
    31     => (MGT_LPGBT       ,  7     , GTY    , 1 , 15) , -- BANK 223

    -- SLR1 Left
    32     => (MGT_LPGBT       ,  8     , GTY    , 0 , 16) , -- BANK 124
    33     => (MGT_LPGBT       ,  8     , GTY    , 0 , 17) , -- BANK 124
    34     => (MGT_LPGBT       ,  8     , GTY    , 0 , 18) , -- BANK 124
    35     => (MGT_LPGBT       ,  8     , GTY    , 0 , 19) , -- BANK 124
    36     => (MGT_LPGBT       ,  9     , GTY    , 0 , 20) , -- BANK 125
    37     => (MGT_LPGBT       ,  9     , GTY    , 0 , 21) , -- BANK 125
    38     => (MGT_LPGBT       ,  9     , GTY    , 0 , 22) , -- BANK 125
    39     => (MGT_LPGBT       ,  9     , GTY    , 0 , 23) , -- BANK 125
    40     => (MGT_LPGBT       ,  10     , GTY    , 0 , 24) , -- BANK 126
    41     => (MGT_LPGBT       ,  10     , GTY    , 0 , 25) , -- BANK 126
    42     => (MGT_LPGBT       ,  10     , GTY    , 0 , 26) , -- BANK 126
    43     => (MGT_LPGBT       ,  10     , GTY    , 0 , 27) , -- BANK 126
    44     => (MGT_LPGBT       ,  11     , GTY    , 0 , 28) , -- BANK 127
    45     => (MGT_LPGBT       ,  11     , GTY    , 0 , 29) , -- BANK 127
    46     => (MGT_LPGBT       ,  11     , GTY    , 0 , 30) , -- BANK 127
    47     => (MGT_LPGBT       ,  11     , GTY    , 0 , 31) , -- BANK 127

    -- SLR1 Right
    48     => (MGT_LPGBT       ,  12    , GTY    , 1 , 16) , -- BANK 224
    49     => (MGT_LPGBT       ,  12    , GTY    , 1 , 17) , -- BANK 224
    50     => (MGT_LPGBT       ,  12    , GTY    , 1 , 18) , -- BANK 224
    51     => (MGT_LPGBT       ,  12    , GTY    , 1 , 19) , -- BANK 224
    52     => (MGT_LPGBT       ,  13    , GTY    , 1 , 20) , -- BANK 225
    53     => (MGT_LPGBT       ,  13    , GTY    , 1 , 21) , -- BANK 225
    54     => (MGT_LPGBT       ,  13    , GTY    , 1 , 22) , -- BANK 225
    55     => (MGT_LPGBT       ,  13    , GTY    , 1 , 23) , -- BANK 225
    56     => (MGT_FELIX       ,  14    , GTY    , 1 , 24) , -- BANK 226
    57     => (MGT_FELIX       ,  14    , GTY    , 1 , 25) , -- BANK 226
    58     => (MGT_FELIX       ,  14    , GTY    , 1 , 26) , -- BANK 226
    59     => (MGT_FELIX       ,  14    , GTY    , 1 , 27) , -- BANK 226
    60     => (MGT_FELIX       ,  15    , GTY    , 1 , 28) , -- BANK 227
    61     => (MGT_FELIX       ,  15    , GTY    , 1 , 29) , -- BANK 227
    62     => (MGT_FELIX       ,  15    , GTY    , 1 , 30) , -- BANK 227
    63     => (MGT_FELIX       ,  15    , GTY    , 1 , 31) , -- BANK 227

    -- SLR2 Left
    64     => (MGT_LPGBT       ,  16    , GTY    , 0 , 32) , -- BANK 128
    65     => (MGT_LPGBT       ,  16    , GTY    , 0 , 33) , -- BANK 128
    66     => (MGT_LPGBT       ,  16    , GTY    , 0 , 34) , -- BANK 128
    67     => (MGT_LPGBT       ,  16    , GTY    , 0 , 35) , -- BANK 128
    68     => (MGT_LPGBT       ,  17    , GTY    , 0 , 36) , -- BANK 129
    69     => (MGT_LPGBT       ,  17    , GTY    , 0 , 37) , -- BANK 129
    70     => (MGT_LPGBT       ,  17    , GTY    , 0 , 38) , -- BANK 129
    71     => (MGT_LPGBT       ,  17    , GTY    , 0 , 39) , -- BANK 129
    72     => (MGT_LPGBT       ,  18    , GTY    , 0 , 40) , -- BANK 130
    73     => (MGT_LPGBT       ,  18    , GTY    , 0 , 41) , -- BANK 130
    74     => (MGT_LPGBT       ,  18    , GTY    , 0 , 42) , -- BANK 130
    75     => (MGT_LPGBT       ,  18    , GTY    , 0 , 43) , -- BANK 130
    76     => (MGT_LPGBT       ,  19    , GTY    , 0 , 44) , -- BANK 131
    77     => (MGT_LPGBT       ,  19    , GTY    , 0 , 45) , -- BANK 131
    78     => (MGT_LPGBT       ,  19    , GTY    , 0 , 46) , -- BANK 131
    79     => (MGT_LPGBT       ,  19    , GTY    , 0 , 47) , -- BANK 131

    -- SLR2 Right
    80     => (MGT_LPGBT       ,  20    , GTY    , 1 , 32) , -- BANK 228
    81     => (MGT_LPGBT       ,  20    , GTY    , 1 , 33) , -- BANK 228
    82     => (MGT_LPGBT       ,  20    , GTY    , 1 , 34) , -- BANK 228
    83     => (MGT_LPGBT       ,  20    , GTY    , 1 , 35) , -- BANK 228
    84     => (MGT_LPGBT       ,  21    , GTY    , 1 , 36) , -- BANK 229
    85     => (MGT_LPGBT       ,  21    , GTY    , 1 , 37) , -- BANK 229
    86     => (MGT_LPGBT       ,  21    , GTY    , 1 , 38) , -- BANK 229
    87     => (MGT_LPGBT       ,  21    , GTY    , 1 , 39) , -- BANK 229
    88     => (MGT_FELIX       ,  22    , GTY    , 1 , 40) , -- BANK 230
    89     => (MGT_FELIX       ,  22    , GTY    , 1 , 41) , -- BANK 230
    90     => (MGT_FELIX       ,  22    , GTY    , 1 , 42) , -- BANK 230
    91     => (MGT_FELIX       ,  22    , GTY    , 1 , 43) , -- BANK 230
    92     => (MGT_FELIX       ,  23    , GTY    , 1 , 44) , -- BANK 231
    93     => (MGT_FELIX       ,  23    , GTY    , 1 , 45) , -- BANK 231
    94     => (MGT_FELIX       ,  23    , GTY    , 1 , 46) , -- BANK 231
    95     => (MGT_FELIX       ,  23    , GTY    , 1 , 47) , -- BANK 231

    -- SLR3 Left
    96     => (MGT_LPGBT       ,  24    , GTY    , 0 , 48) , -- BANK 132
    97     => (MGT_LPGBT       ,  24    , GTY    , 0 , 49) , -- BANK 132
    98     => (MGT_LPGBT       ,  24    , GTY    , 0 , 50) , -- BANK 132
    99     => (MGT_LPGBT       ,  24    , GTY    , 0 , 51) , -- BANK 132
    100    => (MGT_LPGBT       ,  25    , GTY    , 0 , 52) , -- BANK 133
    101    => (MGT_LPGBT       ,  25    , GTY    , 0 , 53) , -- BANK 133
    102    => (MGT_LPGBT       ,  25    , GTY    , 0 , 54) , -- BANK 133
    103    => (MGT_LPGBT       ,  25    , GTY    , 0 , 55) , -- BANK 133
    104    => (MGT_LPGBT       ,  26    , GTY    , 0 , 56) , -- BANK 134
    105    => (MGT_LPGBT       ,  26    , GTY    , 0 , 57) , -- BANK 134
    106    => (MGT_LPGBT       ,  26    , GTY    , 0 , 58) , -- BANK 134
    107    => (MGT_LPGBT       ,  26    , GTY    , 0 , 59) , -- BANK 134
    108    => (MGT_LPGBT       ,  27    , GTY    , 0 , 60) , -- BANK 135
    109    => (MGT_LPGBT       ,  27    , GTY    , 0 , 61) , -- BANK 135
    110    => (MGT_LPGBT       ,  27    , GTY    , 0 , 62) , -- BANK 135
    111    => (MGT_LPGBT       ,  27    , GTY    , 0 , 63) , -- BANK 135

    -- SLR3 Right
    112    => (MGT_LPGBT       ,  28    , GTY    , 1 , 48) , -- BANK 232
    113    => (MGT_LPGBT       ,  28    , GTY    , 1 , 49) , -- BANK 232
    114    => (MGT_LPGBT       ,  28    , GTY    , 1 , 50) , -- BANK 232
    115    => (MGT_LPGBT       ,  28    , GTY    , 1 , 51) , -- BANK 232
    116    => (MGT_LPGBT       ,  29    , GTY    , 1 , 52) , -- BANK 233
    117    => (MGT_LPGBT       ,  29    , GTY    , 1 , 53) , -- BANK 233
    118    => (MGT_LPGBT       ,  29    , GTY    , 1 , 54) , -- BANK 233
    119    => (MGT_LPGBT       ,  29    , GTY    , 1 , 55) , -- BANK 233
    120    => (MGT_FELIX       ,  30    , GTY    , 1 , 56) , -- BANK 234
    121    => (MGT_FELIX       ,  30    , GTY    , 1 , 57) , -- BANK 234
    122    => (MGT_FELIX       ,  30    , GTY    , 1 , 58) , -- BANK 234
    123    => (MGT_FELIX       ,  30    , GTY    , 1 , 59) , -- BANK 234
    124    => (MGT_NIL       ,  31    , GTY    , 1 , 60) , -- BANK 235
    125    => (MGT_NIL       ,  31    , GTY    , 1 , 61) , -- BANK 235
    126    => (MGT_NIL       ,  31    , GTY    , 1 , 62) , -- BANK 235
    127    => (MGT_NIL       ,  31    , GTY    , 1 , 63) , -- BANK 235
    others => MGT_NIL_MAP
    );

  constant c_NUM_REFCLKS : integer := 32; --! # No. of Refclks
  constant C2C_REFCLK_SRC : integer := 4; --! # Id of C2C refclk. TODO: find this constant with a function

  constant c_REFCLK_MAP : refclk_types_array_t (c_NUM_REFCLKS-1 downto 0) := (
    --! Mapping of MGT refclk to clk frequency
    0  => (FREQ => REF_SYNC320),
    1  => (FREQ => REF_SYNC240),
    2  => (FREQ => REF_SYNC240),
    3  => (FREQ => REF_SYNC240),
    4  => (FREQ => REF_AXI_C2C),
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
    30 => (FREQ => REF_SYNC320),
    31 => (FREQ => REF_SYNC320),

    others => REFCLK_NIL_MAP

    );

end package board_pkg;

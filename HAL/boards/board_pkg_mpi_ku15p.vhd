-------------------------------------------------------
--! @file
--! @author Andrew Peck
--! @date (March 5th, 2020 3:53 PM) 
--! @brief HAL - Board Package for MDTTP Demonstrator KU15P FPGA
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

  --! @brief Package containing constants for the MGT mapping of the MDTTP demonstrator 


  constant c_NUM_MGTS                 : integer := 44 + 32; --! # number of MGTs

  constant c_CLK_FREQ                 : integer := 100; --! Clk frequency of the onboard oscillator

  constant c_FELIX_RECCLK_SRC : integer := 0;   --! choose the nth felix RX link which should be used as the clock recovery source and connected to the LPGBT

  -- override recovered clock to be connected to c_FELIX_RECCLK_SRC  if it is not a MGT_TTC mgt_type
  -- this shoul be always false unless you know what you are doing
  -- also this will only output a clock, of course no TTC will be used.
  constant c_OVERRIDE_REC_CLK : boolean := true;
  
  constant c_MGT_MAP : mgt_inst_array_t (c_NUM_MGTS-1 downto 0) := ( --! Mapping of MGT to type, refclk and location

-- mgt#    => (mgt_type     , refclk , gt_type , x , y)
    0      => (MGT_NIL      ,  0     , GTY     , 0 , 0)  , -- BANK 127 C2C ZUP/KUP0
    1      => (MGT_NIL      ,  0     , GTY     , 0 , 1)  , -- BANK 127 C2C ZUP/KUP1
    2      => (MGT_NIL      ,  0     , GTY     , 0 , 2)  , -- BANK 127 C2C ZUP/KUP2
    3      => (MGT_NIL      ,  0     , GTY     , 0 , 3)  , -- BANK 127 C2C ZUP/KUP3
    4      => (MGT_NIL      ,  1     , GTY     , 0 , 4)  , -- BANK 128 CM2CM 0
    5      => (MGT_NIL      ,  1     , GTY     , 0 , 5)  , -- BANK 128 CM2CM 1
    6      => (MGT_NIL      ,  1     , GTY     , 0 , 6)  , -- BANK 128 CM2CM 2
    7      => (MGT_NIL      ,  1     , GTY     , 0 , 7)  , -- BANK 128 CM2CM 3
    8      => (MGT_SL       ,  2     , GTY     , 0 , 8)  , -- BANK 129 Sector Logic 0
    9      => (MGT_SL       ,  2     , GTY     , 0 , 9)  , -- BANK 129 Sector Logic 1
    10     => (MGT_SL       ,  2     , GTY     , 0 , 10) , -- BANK 129 Sector Logic 2
    11     => (MGT_SL       ,  2     , GTY     , 0 , 11) , -- BANK 129 Sector Logic 3
    12     => (MGT_FELIX    ,  3     , GTY     , 0 , 12) , -- BANK 130 Sector Logic 4  # FIXME: these should be SL links but were reassigned to FELIX due to issues with the user logic
    13     => (MGT_FELIX    ,  3     , GTY     , 0 , 13) , -- BANK 130 Sector Logic 5  # FIXME: these should be SL links but were reassigned to FELIX due to issues with the user logic
    14     => (MGT_FELIX    ,  3     , GTY     , 0 , 14) , -- BANK 130 Sector Logic 6  # FIXME: these should be SL links but were reassigned to FELIX due to issues with the user logic
    15     => (MGT_FELIX    ,  3     , GTY     , 0 , 15) , -- BANK 130 Sector Logic 7  # FIXME: these should be SL links but were reassigned to FELIX due to issues with the user logic
    16     => (MGT_FELIX    ,  4     , GTY     , 0 , 16) , -- BANK 131 Sector Logic 8  # FIXME: these should be SL links but were reassigned to FELIX due to issues with the user logic
    17     => (MGT_FELIX    ,  4     , GTY     , 0 , 17) , -- BANK 131 Sector Logic 9  # FIXME: these should be SL links but were reassigned to FELIX due to issues with the user logic
    18     => (MGT_FELIX    ,  4     , GTY     , 0 , 18) , -- BANK 131 Sector Logic 1  # FIXME: these should be SL links but were reassigned to FELIX due to issues with the user logic0
    19     => (MGT_FELIX    ,  4     , GTY     , 0 , 19) , -- BANK 131 Sector Logic 1  # FIXME: these should be SL links but were reassigned to FELIX due to issues with the user logic1
    20     => (MGT_FELIX    ,  5     , GTY     , 0 , 20) , -- BANK 132 FELIX 0
    21     => (MGT_FELIX    ,  5     , GTY     , 0 , 21) , -- BANK 132 FELIX 1
    22     => (MGT_FELIX    ,  5     , GTY     , 0 , 22) , -- BANK 132 FELIX 2
    23     => (MGT_FELIX    ,  5     , GTY     , 0 , 23) , -- BANK 132 FELIX 3
    24     => (MGT_FELIX    ,  6     , GTY     , 0 , 24) , -- BANK 133 FELIX 4
    25     => (MGT_FELIX    ,  6     , GTY     , 0 , 25) , -- BANK 133 FELIX 5
    26     => (MGT_FELIX    ,  6     , GTY     , 0 , 26) , -- BANK 133 FELIX 6
    27     => (MGT_FELIX    ,  6     , GTY     , 0 , 27) , -- BANK 133 FELIX 7
    28     => (MGT_FELIX    ,  7     , GTY     , 0 , 28) , -- BANK 134 FELIX 8
    29     => (MGT_FELIX    ,  7     , GTY     , 0 , 29) , -- BANK 134 FELIX 9
    30     => (MGT_FELIX    ,  7     , GTY     , 0 , 30) , -- BANK 134 FELIX 10
    31     => (MGT_FELIX    ,  7     , GTY     , 0 , 31) , -- BANK 134 FELIX 11
-- mgt#    => (mgt_type     , refclk , gt_type , x , y)
--    32     => (MGT_C2C      , 12     , GTH     , 0 , 0)  , -- BANK 224 SM/CM B2B0
--    33     => (MGT_C2C      , 12     , GTH     , 0 , 1)  , -- BANK 224 SM/CM B2B1
    32     => (MGT_NIL      , 12     , GTH     , 0 , 0)  , -- LOC cons in C2C BD
    33     => (MGT_NIL      , 12     , GTH     , 0 , 1)  , -- LOC cons in C2C BD
    34     => (MGT_NIL      , 12     , GTH     , 0 , 2)  , -- BANK 224 C2C ZUP/KUP4
    35     => (MGT_NIL      , 12     , GTH     , 0 , 3)  , -- BANK 224 C2C ZUP/KUP5
    36     => (MGT_NIL      , 13     , GTH     , 0 , 4)  , -- BANK 225 C2C ZUP/KUP6
    37     => (MGT_NIL      , 13     , GTH     , 0 , 5)  , -- BANK 225 LEGACY TTX RX/TX
    38     => (MGT_NIL      , 13     , GTH     , 0 , 6)  , -- BANK 225 TX/RX Spare 0 to SMA
    39     => (MGT_NIL      , 13     , GTH     , 0 , 7)  , -- BANK 225 TX/RX Spare 1 to SMA
    40     => (MGT_LPGBT    , 12     , GTH     , 0 , 8)  , -- BANK 226 CSM
    41     => (MGT_LPGBT    , 12     , GTH     , 0 , 9)  , -- BANK 226 CSM
    42     => (MGT_LPGBT    , 12     , GTH     , 0 , 10) , -- BANK 226 CSM
    43     => (MGT_LPGBT    , 12     , GTH     , 0 , 11) , -- BANK 226 CSM
    44     => (MGT_LPGBT    , 13     , GTH     , 0 , 12) , -- BANK 227 CSM
    45     => (MGT_LPGBT    , 13     , GTH     , 0 , 13) , -- BANK 227 CSM
    46     => (MGT_LPGBT    , 13     , GTH     , 0 , 14) , -- BANK 227 CSM
    47     => (MGT_LPGBT    , 13     , GTH     , 0 , 15) , -- BANK 227 CSM
    48     => (MGT_LPGBT    , 14     , GTH     , 0 , 16) , -- BANK 228 CSM
    49     => (MGT_LPGBT    , 14     , GTH     , 0 , 17) , -- BANK 228 CSM
    50     => (MGT_LPGBT    , 14     , GTH     , 0 , 18) , -- BANK 228 CSM
    51     => (MGT_LPGBT    , 14     , GTH     , 0 , 19) , -- BANK 228 CSM
    
    52     => (MGT_LPGBT    , 16     , GTH     , 0 , 20) , -- BANK 229 CSM
    53     => (MGT_LPGBT    , 16     , GTH     , 0 , 21) , -- BANK 229 CSM
    54     => (MGT_LPGBT    , 16     , GTH     , 0 , 22) , -- BANK 229 CSM
    55     => (MGT_LPGBT    , 16     , GTH     , 0 , 23) , -- BANK 229 CSM
    56     => (MGT_LPGBT    , 16     , GTH     , 0 , 24) , -- BANK 230 CSM
    57     => (MGT_LPGBT    , 16     , GTH     , 0 , 25) , -- BANK 230 CSM
    58     => (MGT_LPGBT    , 16     , GTH     , 0 , 26) , -- BANK 230 CSM
    59     => (MGT_LPGBT    , 16     , GTH     , 0 , 27) , -- BANK 230 CSM
    60     => (MGT_LPGBT    , 18     , GTH     , 0 , 28) , -- BANK 231 CSM
    61     => (MGT_LPGBT    , 18     , GTH     , 0 , 29) , -- BANK 231 CSM
    62     => (MGT_LPGBT    , 18     , GTH     , 0 , 30) , -- BANK 231 CSM
    63     => (MGT_LPGBT    , 18     , GTH     , 0 , 31) , -- BANK 231 CSM
    64     => (MGT_LPGBT    , 19     , GTH     , 0 , 32) , -- BANK 232 CSM
    65     => (MGT_LPGBT    , 19     , GTH     , 0 , 33) , -- BANK 232 CSM
    66     => (MGT_LPGBT    , 19     , GTH     , 0 , 34) , -- BANK 232 CSM
    67     => (MGT_LPGBT    , 19     , GTH     , 0 , 35) , -- BANK 232 CSM
    68     => (MGT_LPGBT    , 20     , GTH     , 0 , 36) , -- BANK 233 CSM
    69     => (MGT_LPGBT    , 20     , GTH     , 0 , 37) , -- BANK 233 CSM
    70     => (MGT_LPGBT    , 20     , GTH     , 0 , 38) , -- BANK 233 CSM
    71     => (MGT_LPGBT    , 20     , GTH     , 0 , 39) , -- BANK 233 CSM
    72     => (MGT_LPGBT    , 21     , GTH     , 0 , 40) , -- BANK 234 CSM
    73     => (MGT_LPGBT    , 21     , GTH     , 0 , 41) , -- BANK 234 CSM
    74     => (MGT_LPGBT    , 21     , GTH     , 0 , 42) , -- BANK 234 CSM
    75     => (MGT_LPGBT    , 21     , GTH     , 0 , 43) , -- BANK 234 CSM
    others => MGT_NIL_MAP
    );

  constant c_NUM_REFCLKS : integer := 22; --! # No. of Refclks
  -- TODO: get this from a function
  constant C2C_REFCLK_SRC : integer := 9; --! # Id of C2C refclk

  constant c_REFCLK_MAP : refclk_types_array_t (c_NUM_REFCLKS-1 downto 0) := ( 
    --! Mapping of MGT refclk to clk frequency
    -- B2B = AXI c2c
    -- C2C = sf c2c
    -- CM2CM = goes to firely
    0  => (FREQ => REF_NIL    ) , -- C2C_REF0
    1  => (FREQ => REF_NIL    ) , -- CM2CM_REF0
    2  => (FREQ => REF_SYNC240) , -- SL_REF0
    3  => (FREQ => REF_SYNC240) , -- SL_REF1
    4  => (FREQ => REF_SYNC240) , -- SL_REF2
    5  => (FREQ => REF_SYNC240_FLX) , -- FELIX_REF0
    6  => (FREQ => REF_SYNC240_FLX) , -- FELIX_REF1
    7  => (FREQ => REF_SYNC240_FLX) , -- FELIX_REF2
    8  => (FREQ => REF_NIL    ) , -- AD_CLK2_KUP , muxed as C2c or Spare
    9  => (FREQ => REF_AXI_C2C) , -- B2B_REF0 to SM
 --   9  => (FREQ => REF_NIL ), 
    10 => (FREQ => REF_NIL    ) , -- AD_CLK3_KUP , muxed as sma or spare
    11 => (FREQ => REF_NIL    ) , -- B2B_REF2 to SM
    12 => (FREQ => REF_SYNC320) , -- FE_REF0
    13 => (FREQ => REF_SYNC320) , -- FE_REF1
    14 => (FREQ => REF_SYNC320) , -- FE_REF2
    15 => (FREQ => REF_NIL    ) , -- SPARE_REF1
    16 => (FREQ => REF_SYNC320) , -- FE_REF3
    17 => (FREQ => REF_NIL    ) , -- SPARE_REF2
    18 => (FREQ => REF_SYNC320) , -- FE_REF4
    19 => (FREQ => REF_SYNC320) , -- FE_REF5
    20 => (FREQ => REF_SYNC320) , -- FE_REF6
    21 => (FREQ => REF_SYNC320) , -- FE_REF7
    others => REFCLK_NIL_MAP
    );

end package board_pkg;

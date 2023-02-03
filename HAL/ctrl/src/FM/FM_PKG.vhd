--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;


package FM_CTRL is
  type FM_SPY_CTRL_CTRL_t is record
    GLOBAL_FREEZE              :std_logic;   
    GLOBAL_PLAYBACK_MODE       :std_logic_vector( 1 downto 0);
  end record FM_SPY_CTRL_CTRL_t;


  constant DEFAULT_FM_SPY_CTRL_CTRL_t : FM_SPY_CTRL_CTRL_t := (
                                                               GLOBAL_FREEZE => '0',
                                                               GLOBAL_PLAYBACK_MODE => (others => '0')
                                                              );
  type FM_SB0_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB0_SB_MEM_MOSI_t;
  type FM_SB0_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB0_SB_MEM_MISO_t;

 
  constant Default_FM_SB0_SB_MEM_MOSI_t : FM_SB0_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB0_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB0_SB_META_MOSI_t;
  type FM_SB0_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB0_SB_META_MISO_t;
  constant Default_FM_SB0_SB_META_MOSI_t : FM_SB0_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB0_MON_t is record
    SB_MEM                     :FM_SB0_SB_MEM_MISO_t;
    SB_META                    :FM_SB0_SB_META_MISO_t;
  end record FM_SB0_MON_t;


  type FM_SB0_CTRL_t is record
    SB_MEM                     :FM_SB0_SB_MEM_MOSI_t;
    SB_META                    :FM_SB0_SB_META_MOSI_t;
  end record FM_SB0_CTRL_t;


  constant DEFAULT_FM_SB0_CTRL_t : FM_SB0_CTRL_t := (
                                                     SB_MEM => Default_FM_SB0_SB_MEM_MOSI_t,
                                                     SB_META => Default_FM_SB0_SB_META_MOSI_t
                                                    );
  type FM_SB1_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(10-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB1_SB_MEM_MOSI_t;
  type FM_SB1_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB1_SB_MEM_MISO_t;
  constant Default_FM_SB1_SB_MEM_MOSI_t : FM_SB1_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB1_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB1_SB_META_MOSI_t;
  type FM_SB1_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB1_SB_META_MISO_t;

  
  constant Default_FM_SB1_SB_META_MOSI_t : FM_SB1_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );

  constant DefaultSB_MEM_MISO : FM_SB0_SB_MEM_MISO_t :=(
    rd_data       => x"00000000",
    rd_data_valid => '0'
    );
  
  type FM_SB1_MON_t is record
    SB_MEM                     :FM_SB1_SB_MEM_MISO_t;
    SB_META                    :FM_SB1_SB_META_MISO_t;
  end record FM_SB1_MON_t;


  type FM_SB1_CTRL_t is record
    SB_MEM                     :FM_SB1_SB_MEM_MOSI_t;
    SB_META                    :FM_SB1_SB_META_MOSI_t;
  end record FM_SB1_CTRL_t;


  constant DEFAULT_FM_SB1_CTRL_t : FM_SB1_CTRL_t := (
                                                     SB_MEM => Default_FM_SB1_SB_MEM_MOSI_t,
                                                     SB_META => Default_FM_SB1_SB_META_MOSI_t
                                                    );
  type FM_SB2_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB2_SB_MEM_MOSI_t;
  type FM_SB2_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB2_SB_MEM_MISO_t;
  constant Default_FM_SB2_SB_MEM_MOSI_t : FM_SB2_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB2_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB2_SB_META_MOSI_t;
  type FM_SB2_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB2_SB_META_MISO_t;
  constant Default_FM_SB2_SB_META_MOSI_t : FM_SB2_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB2_MON_t is record
    SB_MEM                     :FM_SB2_SB_MEM_MISO_t;
    SB_META                    :FM_SB2_SB_META_MISO_t;
  end record FM_SB2_MON_t;


  type FM_SB2_CTRL_t is record
    SB_MEM                     :FM_SB2_SB_MEM_MOSI_t;
    SB_META                    :FM_SB2_SB_META_MOSI_t;
  end record FM_SB2_CTRL_t;


  constant DEFAULT_FM_SB2_CTRL_t : FM_SB2_CTRL_t := (
                                                     SB_MEM => Default_FM_SB2_SB_MEM_MOSI_t,
                                                     SB_META => Default_FM_SB2_SB_META_MOSI_t
                                                    );
  type FM_SB3_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB3_SB_MEM_MOSI_t;
  type FM_SB3_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB3_SB_MEM_MISO_t;
  constant Default_FM_SB3_SB_MEM_MOSI_t : FM_SB3_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB3_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB3_SB_META_MOSI_t;
  type FM_SB3_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB3_SB_META_MISO_t;
  constant Default_FM_SB3_SB_META_MOSI_t : FM_SB3_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB3_MON_t is record
    SB_MEM                     :FM_SB3_SB_MEM_MISO_t;
    SB_META                    :FM_SB3_SB_META_MISO_t;
  end record FM_SB3_MON_t;


  type FM_SB3_CTRL_t is record
    SB_MEM                     :FM_SB3_SB_MEM_MOSI_t;
    SB_META                    :FM_SB3_SB_META_MOSI_t;
  end record FM_SB3_CTRL_t;


  constant DEFAULT_FM_SB3_CTRL_t : FM_SB3_CTRL_t := (
                                                     SB_MEM => Default_FM_SB3_SB_MEM_MOSI_t,
                                                     SB_META => Default_FM_SB3_SB_META_MOSI_t
                                                    );
  type FM_SB4_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(10-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB4_SB_MEM_MOSI_t;
  type FM_SB4_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB4_SB_MEM_MISO_t;
  constant Default_FM_SB4_SB_MEM_MOSI_t : FM_SB4_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB4_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB4_SB_META_MOSI_t;
  type FM_SB4_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB4_SB_META_MISO_t;
  constant Default_FM_SB4_SB_META_MOSI_t : FM_SB4_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB4_MON_t is record
    SB_MEM                     :FM_SB4_SB_MEM_MISO_t;
    SB_META                    :FM_SB4_SB_META_MISO_t;
  end record FM_SB4_MON_t;


  type FM_SB4_CTRL_t is record
    SB_MEM                     :FM_SB4_SB_MEM_MOSI_t;
    SB_META                    :FM_SB4_SB_META_MOSI_t;
  end record FM_SB4_CTRL_t;


  constant DEFAULT_FM_SB4_CTRL_t : FM_SB4_CTRL_t := (
                                                     SB_MEM => Default_FM_SB4_SB_MEM_MOSI_t,
                                                     SB_META => Default_FM_SB4_SB_META_MOSI_t
                                                    );
  type FM_SB5_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB5_SB_MEM_MOSI_t;
  type FM_SB5_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB5_SB_MEM_MISO_t;
  constant Default_FM_SB5_SB_MEM_MOSI_t : FM_SB5_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB5_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB5_SB_META_MOSI_t;
  type FM_SB5_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB5_SB_META_MISO_t;
  constant Default_FM_SB5_SB_META_MOSI_t : FM_SB5_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB5_MON_t is record
    SB_MEM                     :FM_SB5_SB_MEM_MISO_t;
    SB_META                    :FM_SB5_SB_META_MISO_t;
  end record FM_SB5_MON_t;


  type FM_SB5_CTRL_t is record
    SB_MEM                     :FM_SB5_SB_MEM_MOSI_t;
    SB_META                    :FM_SB5_SB_META_MOSI_t;
  end record FM_SB5_CTRL_t;


  constant DEFAULT_FM_SB5_CTRL_t : FM_SB5_CTRL_t := (
                                                     SB_MEM => Default_FM_SB5_SB_MEM_MOSI_t,
                                                     SB_META => Default_FM_SB5_SB_META_MOSI_t
                                                    );
  type FM_SB6_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB6_SB_MEM_MOSI_t;
  type FM_SB6_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB6_SB_MEM_MISO_t;
  constant Default_FM_SB6_SB_MEM_MOSI_t : FM_SB6_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB6_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB6_SB_META_MOSI_t;
  type FM_SB6_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB6_SB_META_MISO_t;
  constant Default_FM_SB6_SB_META_MOSI_t : FM_SB6_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB6_MON_t is record
    SB_MEM                     :FM_SB6_SB_MEM_MISO_t;
    SB_META                    :FM_SB6_SB_META_MISO_t;
  end record FM_SB6_MON_t;


  type FM_SB6_CTRL_t is record
    SB_MEM                     :FM_SB6_SB_MEM_MOSI_t;
    SB_META                    :FM_SB6_SB_META_MOSI_t;
  end record FM_SB6_CTRL_t;


  constant DEFAULT_FM_SB6_CTRL_t : FM_SB6_CTRL_t := (
                                                     SB_MEM => Default_FM_SB6_SB_MEM_MOSI_t,
                                                     SB_META => Default_FM_SB6_SB_META_MOSI_t
                                                    );
  type FM_SB7_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(10-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB7_SB_MEM_MOSI_t;
  type FM_SB7_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB7_SB_MEM_MISO_t;
  constant Default_FM_SB7_SB_MEM_MOSI_t : FM_SB7_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB7_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB7_SB_META_MOSI_t;
  type FM_SB7_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB7_SB_META_MISO_t;
  constant Default_FM_SB7_SB_META_MOSI_t : FM_SB7_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB7_MON_t is record
    SB_MEM                     :FM_SB7_SB_MEM_MISO_t;
    SB_META                    :FM_SB7_SB_META_MISO_t;
  end record FM_SB7_MON_t;


  type FM_SB7_CTRL_t is record
    SB_MEM                     :FM_SB7_SB_MEM_MOSI_t;
    SB_META                    :FM_SB7_SB_META_MOSI_t;
  end record FM_SB7_CTRL_t;


  constant DEFAULT_FM_SB7_CTRL_t : FM_SB7_CTRL_t := (
                                                     SB_MEM => Default_FM_SB7_SB_MEM_MOSI_t,
                                                     SB_META => Default_FM_SB7_SB_META_MOSI_t
                                                    );
  type FM_SB8_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB8_SB_MEM_MOSI_t;
  type FM_SB8_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB8_SB_MEM_MISO_t;
  constant Default_FM_SB8_SB_MEM_MOSI_t : FM_SB8_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB8_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB8_SB_META_MOSI_t;
  type FM_SB8_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB8_SB_META_MISO_t;
  constant Default_FM_SB8_SB_META_MOSI_t : FM_SB8_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB8_MON_t is record
    SB_MEM                     :FM_SB8_SB_MEM_MISO_t;
    SB_META                    :FM_SB8_SB_META_MISO_t;
  end record FM_SB8_MON_t;


  type FM_SB8_CTRL_t is record
    SB_MEM                     :FM_SB8_SB_MEM_MOSI_t;
    SB_META                    :FM_SB8_SB_META_MOSI_t;
  end record FM_SB8_CTRL_t;


  constant DEFAULT_FM_SB8_CTRL_t : FM_SB8_CTRL_t := (
                                                     SB_MEM => Default_FM_SB8_SB_MEM_MOSI_t,
                                                     SB_META => Default_FM_SB8_SB_META_MOSI_t
                                                    );
  type FM_SB9_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB9_SB_MEM_MOSI_t;
  type FM_SB9_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB9_SB_MEM_MISO_t;
  constant Default_FM_SB9_SB_MEM_MOSI_t : FM_SB9_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB9_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB9_SB_META_MOSI_t;
  type FM_SB9_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB9_SB_META_MISO_t;
  constant Default_FM_SB9_SB_META_MOSI_t : FM_SB9_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB9_MON_t is record
    SB_MEM                     :FM_SB9_SB_MEM_MISO_t;
    SB_META                    :FM_SB9_SB_META_MISO_t;
  end record FM_SB9_MON_t;


  type FM_SB9_CTRL_t is record
    SB_MEM                     :FM_SB9_SB_MEM_MOSI_t;
    SB_META                    :FM_SB9_SB_META_MOSI_t;
  end record FM_SB9_CTRL_t;


  constant DEFAULT_FM_SB9_CTRL_t : FM_SB9_CTRL_t := (
                                                     SB_MEM => Default_FM_SB9_SB_MEM_MOSI_t,
                                                     SB_META => Default_FM_SB9_SB_META_MOSI_t
                                                    );
  type FM_SB10_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(10-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB10_SB_MEM_MOSI_t;
  type FM_SB10_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB10_SB_MEM_MISO_t;
  constant Default_FM_SB10_SB_MEM_MOSI_t : FM_SB10_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB10_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB10_SB_META_MOSI_t;
  type FM_SB10_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB10_SB_META_MISO_t;
  constant Default_FM_SB10_SB_META_MOSI_t : FM_SB10_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB10_MON_t is record
    SB_MEM                     :FM_SB10_SB_MEM_MISO_t;
    SB_META                    :FM_SB10_SB_META_MISO_t;
  end record FM_SB10_MON_t;


  type FM_SB10_CTRL_t is record
    SB_MEM                     :FM_SB10_SB_MEM_MOSI_t;
    SB_META                    :FM_SB10_SB_META_MOSI_t;
  end record FM_SB10_CTRL_t;


  constant DEFAULT_FM_SB10_CTRL_t : FM_SB10_CTRL_t := (
                                                       SB_MEM => Default_FM_SB10_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB10_SB_META_MOSI_t
                                                      );
  type FM_SB11_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB11_SB_MEM_MOSI_t;
  type FM_SB11_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB11_SB_MEM_MISO_t;
  constant Default_FM_SB11_SB_MEM_MOSI_t : FM_SB11_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB11_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB11_SB_META_MOSI_t;
  type FM_SB11_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB11_SB_META_MISO_t;
  constant Default_FM_SB11_SB_META_MOSI_t : FM_SB11_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB11_MON_t is record
    SB_MEM                     :FM_SB11_SB_MEM_MISO_t;
    SB_META                    :FM_SB11_SB_META_MISO_t;
  end record FM_SB11_MON_t;


  type FM_SB11_CTRL_t is record
    SB_MEM                     :FM_SB11_SB_MEM_MOSI_t;
    SB_META                    :FM_SB11_SB_META_MOSI_t;
  end record FM_SB11_CTRL_t;


  constant DEFAULT_FM_SB11_CTRL_t : FM_SB11_CTRL_t := (
                                                       SB_MEM => Default_FM_SB11_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB11_SB_META_MOSI_t
                                                      );
  type FM_SB12_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB12_SB_MEM_MOSI_t;
  type FM_SB12_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB12_SB_MEM_MISO_t;
  constant Default_FM_SB12_SB_MEM_MOSI_t : FM_SB12_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB12_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB12_SB_META_MOSI_t;
  type FM_SB12_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB12_SB_META_MISO_t;
  constant Default_FM_SB12_SB_META_MOSI_t : FM_SB12_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB12_MON_t is record
    SB_MEM                     :FM_SB12_SB_MEM_MISO_t;
    SB_META                    :FM_SB12_SB_META_MISO_t;
  end record FM_SB12_MON_t;


  type FM_SB12_CTRL_t is record
    SB_MEM                     :FM_SB12_SB_MEM_MOSI_t;
    SB_META                    :FM_SB12_SB_META_MOSI_t;
  end record FM_SB12_CTRL_t;


  constant DEFAULT_FM_SB12_CTRL_t : FM_SB12_CTRL_t := (
                                                       SB_MEM => Default_FM_SB12_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB12_SB_META_MOSI_t
                                                      );
  type FM_SB13_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(10-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB13_SB_MEM_MOSI_t;
  type FM_SB13_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB13_SB_MEM_MISO_t;
  constant Default_FM_SB13_SB_MEM_MOSI_t : FM_SB13_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB13_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB13_SB_META_MOSI_t;
  type FM_SB13_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB13_SB_META_MISO_t;
  constant Default_FM_SB13_SB_META_MOSI_t : FM_SB13_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB13_MON_t is record
    SB_MEM                     :FM_SB13_SB_MEM_MISO_t;
    SB_META                    :FM_SB13_SB_META_MISO_t;
  end record FM_SB13_MON_t;


  type FM_SB13_CTRL_t is record
    SB_MEM                     :FM_SB13_SB_MEM_MOSI_t;
    SB_META                    :FM_SB13_SB_META_MOSI_t;
  end record FM_SB13_CTRL_t;


  constant DEFAULT_FM_SB13_CTRL_t : FM_SB13_CTRL_t := (
                                                       SB_MEM => Default_FM_SB13_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB13_SB_META_MOSI_t
                                                      );
  type FM_SB14_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB14_SB_MEM_MOSI_t;
  type FM_SB14_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB14_SB_MEM_MISO_t;
  constant Default_FM_SB14_SB_MEM_MOSI_t : FM_SB14_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB14_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB14_SB_META_MOSI_t;
  type FM_SB14_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB14_SB_META_MISO_t;
  constant Default_FM_SB14_SB_META_MOSI_t : FM_SB14_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB14_MON_t is record
    SB_MEM                     :FM_SB14_SB_MEM_MISO_t;
    SB_META                    :FM_SB14_SB_META_MISO_t;
  end record FM_SB14_MON_t;


  type FM_SB14_CTRL_t is record
    SB_MEM                     :FM_SB14_SB_MEM_MOSI_t;
    SB_META                    :FM_SB14_SB_META_MOSI_t;
  end record FM_SB14_CTRL_t;


  constant DEFAULT_FM_SB14_CTRL_t : FM_SB14_CTRL_t := (
                                                       SB_MEM => Default_FM_SB14_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB14_SB_META_MOSI_t
                                                      );
  type FM_SB15_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB15_SB_MEM_MOSI_t;
  type FM_SB15_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB15_SB_MEM_MISO_t;
  constant Default_FM_SB15_SB_MEM_MOSI_t : FM_SB15_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB15_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB15_SB_META_MOSI_t;
  type FM_SB15_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB15_SB_META_MISO_t;
  constant Default_FM_SB15_SB_META_MOSI_t : FM_SB15_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB15_MON_t is record
    SB_MEM                     :FM_SB15_SB_MEM_MISO_t;
    SB_META                    :FM_SB15_SB_META_MISO_t;
  end record FM_SB15_MON_t;


  type FM_SB15_CTRL_t is record
    SB_MEM                     :FM_SB15_SB_MEM_MOSI_t;
    SB_META                    :FM_SB15_SB_META_MOSI_t;
  end record FM_SB15_CTRL_t;


  constant DEFAULT_FM_SB15_CTRL_t : FM_SB15_CTRL_t := (
                                                       SB_MEM => Default_FM_SB15_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB15_SB_META_MOSI_t
                                                      );
  type FM_SB16_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(10-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB16_SB_MEM_MOSI_t;
  type FM_SB16_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB16_SB_MEM_MISO_t;
  constant Default_FM_SB16_SB_MEM_MOSI_t : FM_SB16_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB16_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB16_SB_META_MOSI_t;
  type FM_SB16_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB16_SB_META_MISO_t;
  constant Default_FM_SB16_SB_META_MOSI_t : FM_SB16_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB16_MON_t is record
    SB_MEM                     :FM_SB16_SB_MEM_MISO_t;
    SB_META                    :FM_SB16_SB_META_MISO_t;
  end record FM_SB16_MON_t;


  type FM_SB16_CTRL_t is record
    SB_MEM                     :FM_SB16_SB_MEM_MOSI_t;
    SB_META                    :FM_SB16_SB_META_MOSI_t;
  end record FM_SB16_CTRL_t;


  constant DEFAULT_FM_SB16_CTRL_t : FM_SB16_CTRL_t := (
                                                       SB_MEM => Default_FM_SB16_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB16_SB_META_MOSI_t
                                                      );
  type FM_SB17_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB17_SB_MEM_MOSI_t;
  type FM_SB17_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB17_SB_MEM_MISO_t;
  constant Default_FM_SB17_SB_MEM_MOSI_t : FM_SB17_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB17_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB17_SB_META_MOSI_t;
  type FM_SB17_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB17_SB_META_MISO_t;
  constant Default_FM_SB17_SB_META_MOSI_t : FM_SB17_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB17_MON_t is record
    SB_MEM                     :FM_SB17_SB_MEM_MISO_t;
    SB_META                    :FM_SB17_SB_META_MISO_t;
  end record FM_SB17_MON_t;


  type FM_SB17_CTRL_t is record
    SB_MEM                     :FM_SB17_SB_MEM_MOSI_t;
    SB_META                    :FM_SB17_SB_META_MOSI_t;
  end record FM_SB17_CTRL_t;


  constant DEFAULT_FM_SB17_CTRL_t : FM_SB17_CTRL_t := (
                                                       SB_MEM => Default_FM_SB17_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB17_SB_META_MOSI_t
                                                      );
  type FM_SB18_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB18_SB_MEM_MOSI_t;
  type FM_SB18_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB18_SB_MEM_MISO_t;
  constant Default_FM_SB18_SB_MEM_MOSI_t : FM_SB18_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB18_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB18_SB_META_MOSI_t;
  type FM_SB18_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB18_SB_META_MISO_t;
  constant Default_FM_SB18_SB_META_MOSI_t : FM_SB18_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB18_MON_t is record
    SB_MEM                     :FM_SB18_SB_MEM_MISO_t;
    SB_META                    :FM_SB18_SB_META_MISO_t;
  end record FM_SB18_MON_t;


  type FM_SB18_CTRL_t is record
    SB_MEM                     :FM_SB18_SB_MEM_MOSI_t;
    SB_META                    :FM_SB18_SB_META_MOSI_t;
  end record FM_SB18_CTRL_t;


  constant DEFAULT_FM_SB18_CTRL_t : FM_SB18_CTRL_t := (
                                                       SB_MEM => Default_FM_SB18_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB18_SB_META_MOSI_t
                                                      );
  type FM_SB19_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(10-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB19_SB_MEM_MOSI_t;
  type FM_SB19_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB19_SB_MEM_MISO_t;
  constant Default_FM_SB19_SB_MEM_MOSI_t : FM_SB19_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB19_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB19_SB_META_MOSI_t;
  type FM_SB19_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB19_SB_META_MISO_t;
  constant Default_FM_SB19_SB_META_MOSI_t : FM_SB19_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB19_MON_t is record
    SB_MEM                     :FM_SB19_SB_MEM_MISO_t;
    SB_META                    :FM_SB19_SB_META_MISO_t;
  end record FM_SB19_MON_t;


  type FM_SB19_CTRL_t is record
    SB_MEM                     :FM_SB19_SB_MEM_MOSI_t;
    SB_META                    :FM_SB19_SB_META_MOSI_t;
  end record FM_SB19_CTRL_t;


  constant DEFAULT_FM_SB19_CTRL_t : FM_SB19_CTRL_t := (
                                                       SB_MEM => Default_FM_SB19_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB19_SB_META_MOSI_t
                                                      );
  type FM_SB20_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB20_SB_MEM_MOSI_t;
  type FM_SB20_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB20_SB_MEM_MISO_t;
  constant Default_FM_SB20_SB_MEM_MOSI_t : FM_SB20_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB20_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB20_SB_META_MOSI_t;
  type FM_SB20_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB20_SB_META_MISO_t;
  constant Default_FM_SB20_SB_META_MOSI_t : FM_SB20_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB20_MON_t is record
    SB_MEM                     :FM_SB20_SB_MEM_MISO_t;
    SB_META                    :FM_SB20_SB_META_MISO_t;
  end record FM_SB20_MON_t;


  type FM_SB20_CTRL_t is record
    SB_MEM                     :FM_SB20_SB_MEM_MOSI_t;
    SB_META                    :FM_SB20_SB_META_MOSI_t;
  end record FM_SB20_CTRL_t;


  constant DEFAULT_FM_SB20_CTRL_t : FM_SB20_CTRL_t := (
                                                       SB_MEM => Default_FM_SB20_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB20_SB_META_MOSI_t
                                                      );
  type FM_SB21_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB21_SB_MEM_MOSI_t;
  type FM_SB21_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB21_SB_MEM_MISO_t;
  constant Default_FM_SB21_SB_MEM_MOSI_t : FM_SB21_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB21_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB21_SB_META_MOSI_t;
  type FM_SB21_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB21_SB_META_MISO_t;
  constant Default_FM_SB21_SB_META_MOSI_t : FM_SB21_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB21_MON_t is record
    SB_MEM                     :FM_SB21_SB_MEM_MISO_t;
    SB_META                    :FM_SB21_SB_META_MISO_t;
  end record FM_SB21_MON_t;


  type FM_SB21_CTRL_t is record
    SB_MEM                     :FM_SB21_SB_MEM_MOSI_t;
    SB_META                    :FM_SB21_SB_META_MOSI_t;
  end record FM_SB21_CTRL_t;


  constant DEFAULT_FM_SB21_CTRL_t : FM_SB21_CTRL_t := (
                                                       SB_MEM => Default_FM_SB21_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB21_SB_META_MOSI_t
                                                      );
  type FM_SB22_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(10-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB22_SB_MEM_MOSI_t;
  type FM_SB22_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB22_SB_MEM_MISO_t;
  constant Default_FM_SB22_SB_MEM_MOSI_t : FM_SB22_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB22_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB22_SB_META_MOSI_t;
  type FM_SB22_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB22_SB_META_MISO_t;
  constant Default_FM_SB22_SB_META_MOSI_t : FM_SB22_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB22_MON_t is record
    SB_MEM                     :FM_SB22_SB_MEM_MISO_t;
    SB_META                    :FM_SB22_SB_META_MISO_t;
  end record FM_SB22_MON_t;


  type FM_SB22_CTRL_t is record
    SB_MEM                     :FM_SB22_SB_MEM_MOSI_t;
    SB_META                    :FM_SB22_SB_META_MOSI_t;
  end record FM_SB22_CTRL_t;


  constant DEFAULT_FM_SB22_CTRL_t : FM_SB22_CTRL_t := (
                                                       SB_MEM => Default_FM_SB22_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB22_SB_META_MOSI_t
                                                      );
  type FM_SB23_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB23_SB_MEM_MOSI_t;
  type FM_SB23_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB23_SB_MEM_MISO_t;
  constant Default_FM_SB23_SB_MEM_MOSI_t : FM_SB23_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB23_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB23_SB_META_MOSI_t;
  type FM_SB23_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB23_SB_META_MISO_t;
  constant Default_FM_SB23_SB_META_MOSI_t : FM_SB23_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB23_MON_t is record
    SB_MEM                     :FM_SB23_SB_MEM_MISO_t;
    SB_META                    :FM_SB23_SB_META_MISO_t;
  end record FM_SB23_MON_t;


  type FM_SB23_CTRL_t is record
    SB_MEM                     :FM_SB23_SB_MEM_MOSI_t;
    SB_META                    :FM_SB23_SB_META_MOSI_t;
  end record FM_SB23_CTRL_t;


  constant DEFAULT_FM_SB23_CTRL_t : FM_SB23_CTRL_t := (
                                                       SB_MEM => Default_FM_SB23_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB23_SB_META_MOSI_t
                                                      );
  type FM_SB24_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB24_SB_MEM_MOSI_t;
  type FM_SB24_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB24_SB_MEM_MISO_t;
  constant Default_FM_SB24_SB_MEM_MOSI_t : FM_SB24_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB24_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB24_SB_META_MOSI_t;
  type FM_SB24_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB24_SB_META_MISO_t;
  constant Default_FM_SB24_SB_META_MOSI_t : FM_SB24_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB24_MON_t is record
    SB_MEM                     :FM_SB24_SB_MEM_MISO_t;
    SB_META                    :FM_SB24_SB_META_MISO_t;
  end record FM_SB24_MON_t;


  type FM_SB24_CTRL_t is record
    SB_MEM                     :FM_SB24_SB_MEM_MOSI_t;
    SB_META                    :FM_SB24_SB_META_MOSI_t;
  end record FM_SB24_CTRL_t;


  constant DEFAULT_FM_SB24_CTRL_t : FM_SB24_CTRL_t := (
                                                       SB_MEM => Default_FM_SB24_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB24_SB_META_MOSI_t
                                                      );
  type FM_SB25_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(10-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB25_SB_MEM_MOSI_t;
  type FM_SB25_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB25_SB_MEM_MISO_t;
  constant Default_FM_SB25_SB_MEM_MOSI_t : FM_SB25_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB25_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(4-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB25_SB_META_MOSI_t;
  type FM_SB25_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB25_SB_META_MISO_t;
  constant Default_FM_SB25_SB_META_MOSI_t : FM_SB25_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB25_MON_t is record
    SB_MEM                     :FM_SB25_SB_MEM_MISO_t;
    SB_META                    :FM_SB25_SB_META_MISO_t;
  end record FM_SB25_MON_t;


  type FM_SB25_CTRL_t is record
    SB_MEM                     :FM_SB25_SB_MEM_MOSI_t;
    SB_META                    :FM_SB25_SB_META_MOSI_t;
  end record FM_SB25_CTRL_t;


  constant DEFAULT_FM_SB25_CTRL_t : FM_SB25_CTRL_t := (
                                                       SB_MEM => Default_FM_SB25_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB25_SB_META_MOSI_t
                                                      );
  type FM_SB26_SB_MEM_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB26_SB_MEM_MOSI_t;
  type FM_SB26_SB_MEM_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB26_SB_MEM_MISO_t;
  constant Default_FM_SB26_SB_MEM_MOSI_t : FM_SB26_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB26_SB_META_MOSI_t is record
    clk       : std_logic;
    enable    : std_logic;
    wr_enable : std_logic;
    address   : std_logic_vector(5-1 downto 0);
    wr_data   : std_logic_vector(32-1 downto 0);
  end record FM_SB26_SB_META_MOSI_t;
  type FM_SB26_SB_META_MISO_t is record
    rd_data         : std_logic_vector(32-1 downto 0);
    rd_data_valid   : std_logic;
  end record FM_SB26_SB_META_MISO_t;
  constant Default_FM_SB26_SB_META_MOSI_t : FM_SB26_SB_META_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  type FM_SB26_MON_t is record
    SB_MEM                     :FM_SB26_SB_MEM_MISO_t;
    SB_META                    :FM_SB26_SB_META_MISO_t;
  end record FM_SB26_MON_t;


  type FM_SB26_CTRL_t is record
    SB_MEM                     :FM_SB26_SB_MEM_MOSI_t;
    SB_META                    :FM_SB26_SB_META_MOSI_t;
  end record FM_SB26_CTRL_t;


  constant DEFAULT_FM_SB26_CTRL_t : FM_SB26_CTRL_t := (
                                                       SB_MEM => Default_FM_SB26_SB_MEM_MOSI_t,
                                                       SB_META => Default_FM_SB26_SB_META_MOSI_t
                                                      );
  type FM_MON_t is record
    SB0                        :FM_SB0_MON_t;
    SB1                        :FM_SB1_MON_t;
    SB2                        :FM_SB2_MON_t;
    SB3                        :FM_SB3_MON_t;
    SB4                        :FM_SB4_MON_t;
    SB5                        :FM_SB5_MON_t;
    SB6                        :FM_SB6_MON_t;
    SB7                        :FM_SB7_MON_t;
    SB8                        :FM_SB8_MON_t;
    SB9                        :FM_SB9_MON_t;
    SB10                       :FM_SB10_MON_t;
    SB11                       :FM_SB11_MON_t;
    SB12                       :FM_SB12_MON_t;
    SB13                       :FM_SB13_MON_t;
    SB14                       :FM_SB14_MON_t;
    SB15                       :FM_SB15_MON_t;
    SB16                       :FM_SB16_MON_t;
    SB17                       :FM_SB17_MON_t;
    SB18                       :FM_SB18_MON_t;
    SB19                       :FM_SB19_MON_t;
    SB20                       :FM_SB20_MON_t;
    SB21                       :FM_SB21_MON_t;
    SB22                       :FM_SB22_MON_t;
    SB23                       :FM_SB23_MON_t;
    SB24                       :FM_SB24_MON_t;
    SB25                       :FM_SB25_MON_t;
    SB26                       :FM_SB26_MON_t;
  end record FM_MON_t;
  attribute w of FM_MON_t : type is 1782;
  function width(x: FM_MON_t) return natural;
  function convert(x: FM_MON_t; tpl: std_logic_vector) return std_logic_vector;
  function convert(x: std_logic_vector; tpl: FM_MON_t) return FM_MON_t;
  function zero(tpl: FM_MON_t) return FM_MON_t;

  type FM_CTRL_t is record
    SPY_CTRL                   :FM_SPY_CTRL_CTRL_t;
    FREEZE_MASK_0              :std_logic_vector(31 downto 0);
    FREEZE_MASK_1              :std_logic_vector(31 downto 0);
    PLAYBACK_MASK_0            :std_logic_vector(31 downto 0);
    PLAYBACK_MASK_1            :std_logic_vector(31 downto 0);
    SB0                        :FM_SB0_CTRL_t;                
    SB1                        :FM_SB1_CTRL_t;                
    SB2                        :FM_SB2_CTRL_t;                
    SB3                        :FM_SB3_CTRL_t;                
    SB4                        :FM_SB4_CTRL_t;                
    SB5                        :FM_SB5_CTRL_t;                
    SB6                        :FM_SB6_CTRL_t;                
    SB7                        :FM_SB7_CTRL_t;                
    SB8                        :FM_SB8_CTRL_t;                
    SB9                        :FM_SB9_CTRL_t;                
    SB10                       :FM_SB10_CTRL_t;               
    SB11                       :FM_SB11_CTRL_t;               
    SB12                       :FM_SB12_CTRL_t;               
    SB13                       :FM_SB13_CTRL_t;               
    SB14                       :FM_SB14_CTRL_t;               
    SB15                       :FM_SB15_CTRL_t;               
    SB16                       :FM_SB16_CTRL_t;               
    SB17                       :FM_SB17_CTRL_t;               
    SB18                       :FM_SB18_CTRL_t;               
    SB19                       :FM_SB19_CTRL_t;               
    SB20                       :FM_SB20_CTRL_t;               
    SB21                       :FM_SB21_CTRL_t;               
    SB22                       :FM_SB22_CTRL_t;               
    SB23                       :FM_SB23_CTRL_t;               
    SB24                       :FM_SB24_CTRL_t;               
    SB25                       :FM_SB25_CTRL_t;               
    SB26                       :FM_SB26_CTRL_t;               
  end record FM_CTRL_t;
  attribute w of FM_CTRL_t : type is 2319;
  function width(x: FM_CTRL_t) return natural;
  function convert(x: FM_CTRL_t; tpl: std_logic_vector) return std_logic_vector;
  function convert(x: std_logic_vector; tpl: FM_CTRL_t) return FM_CTRL_t;
  function zero(tpl: FM_CTRL_t) return FM_CTRL_t;


  constant DEFAULT_FM_CTRL_t : FM_CTRL_t := (
                                             SPY_CTRL => DEFAULT_FM_SPY_CTRL_CTRL_t,
                                             FREEZE_MASK_0 => (others => '1'),
                                             FREEZE_MASK_1 => (others => '1'),
                                             PLAYBACK_MASK_0 => (others => '1'),
                                             PLAYBACK_MASK_1 => (others => '1'),
                                             SB0 => DEFAULT_FM_SB0_CTRL_t,
                                             SB1 => DEFAULT_FM_SB1_CTRL_t,
                                             SB2 => DEFAULT_FM_SB2_CTRL_t,
                                             SB3 => DEFAULT_FM_SB3_CTRL_t,
                                             SB4 => DEFAULT_FM_SB4_CTRL_t,
                                             SB5 => DEFAULT_FM_SB5_CTRL_t,
                                             SB6 => DEFAULT_FM_SB6_CTRL_t,
                                             SB7 => DEFAULT_FM_SB7_CTRL_t,
                                             SB8 => DEFAULT_FM_SB8_CTRL_t,
                                             SB9 => DEFAULT_FM_SB9_CTRL_t,
                                             SB10 => DEFAULT_FM_SB10_CTRL_t,
                                             SB11 => DEFAULT_FM_SB11_CTRL_t,
                                             SB12 => DEFAULT_FM_SB12_CTRL_t,
                                             SB13 => DEFAULT_FM_SB13_CTRL_t,
                                             SB14 => DEFAULT_FM_SB14_CTRL_t,
                                             SB15 => DEFAULT_FM_SB15_CTRL_t,
                                             SB16 => DEFAULT_FM_SB16_CTRL_t,
                                             SB17 => DEFAULT_FM_SB17_CTRL_t,
                                             SB18 => DEFAULT_FM_SB18_CTRL_t,
                                             SB19 => DEFAULT_FM_SB19_CTRL_t,
                                             SB20 => DEFAULT_FM_SB20_CTRL_t,
                                             SB21 => DEFAULT_FM_SB21_CTRL_t,
                                             SB22 => DEFAULT_FM_SB22_CTRL_t,
                                             SB23 => DEFAULT_FM_SB23_CTRL_t,
                                             SB24 => DEFAULT_FM_SB24_CTRL_t,
                                             SB25 => DEFAULT_FM_SB25_CTRL_t,
                                             SB26 => DEFAULT_FM_SB26_CTRL_t
                                            );


end package FM_CTRL;


------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package body FM_CTRL is

   -- Custom types and functions --

   function width(x: FM_SPY_CTRL_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.GLOBAL_FREEZE);
      w := w + width(x.GLOBAL_PLAYBACK_MODE);
      return w;
   end function width;
   function convert(x: FM_SPY_CTRL_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.GLOBAL_FREEZE);
         y(u to u+w-1) := convert(x.GLOBAL_FREEZE, y(u to u+w-1));
         u := u + w;
         w := width(x.GLOBAL_PLAYBACK_MODE);
         y(u to u+w-1) := convert(x.GLOBAL_PLAYBACK_MODE, y(u to u+w-1));
      else
         w := width(x.GLOBAL_FREEZE);
         y(u downto u-w+1) := convert(x.GLOBAL_FREEZE, y(u downto u-w+1));
         u := u - w;
         w := width(x.GLOBAL_PLAYBACK_MODE);
         y(u downto u-w+1) := convert(x.GLOBAL_PLAYBACK_MODE, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SPY_CTRL_CTRL_t) return FM_SPY_CTRL_CTRL_t is
      variable y : FM_SPY_CTRL_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.GLOBAL_FREEZE);
         y.GLOBAL_FREEZE := convert(x(u to u+w-1), tpl.GLOBAL_FREEZE);
         u := u + w;
         w := width(tpl.GLOBAL_PLAYBACK_MODE);
         y.GLOBAL_PLAYBACK_MODE := convert(x(u to u+w-1), tpl.GLOBAL_PLAYBACK_MODE);
      else
         w := width(tpl.GLOBAL_FREEZE);
         y.GLOBAL_FREEZE := convert(x(u downto u-w+1), tpl.GLOBAL_FREEZE);
         u := u - w;
         w := width(tpl.GLOBAL_PLAYBACK_MODE);
         y.GLOBAL_PLAYBACK_MODE := convert(x(u downto u-w+1), tpl.GLOBAL_PLAYBACK_MODE);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SPY_CTRL_CTRL_t) return FM_SPY_CTRL_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB0_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB0_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB0_SB_MEM_MOSI_t) return FM_SB0_SB_MEM_MOSI_t is
      variable y : FM_SB0_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB0_SB_MEM_MOSI_t) return FM_SB0_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB0_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB0_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB0_SB_MEM_MISO_t) return FM_SB0_SB_MEM_MISO_t is
      variable y : FM_SB0_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB0_SB_MEM_MISO_t) return FM_SB0_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB0_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB0_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB0_SB_META_MOSI_t) return FM_SB0_SB_META_MOSI_t is
      variable y : FM_SB0_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB0_SB_META_MOSI_t) return FM_SB0_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB0_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB0_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB0_SB_META_MISO_t) return FM_SB0_SB_META_MISO_t is
      variable y : FM_SB0_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB0_SB_META_MISO_t) return FM_SB0_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB0_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB0_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB0_MON_t) return FM_SB0_MON_t is
      variable y : FM_SB0_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB0_MON_t) return FM_SB0_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB0_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB0_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB0_CTRL_t) return FM_SB0_CTRL_t is
      variable y : FM_SB0_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB0_CTRL_t) return FM_SB0_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB1_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB1_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB1_SB_MEM_MOSI_t) return FM_SB1_SB_MEM_MOSI_t is
      variable y : FM_SB1_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB1_SB_MEM_MOSI_t) return FM_SB1_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB1_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB1_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB1_SB_MEM_MISO_t) return FM_SB1_SB_MEM_MISO_t is
      variable y : FM_SB1_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB1_SB_MEM_MISO_t) return FM_SB1_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB1_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB1_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB1_SB_META_MOSI_t) return FM_SB1_SB_META_MOSI_t is
      variable y : FM_SB1_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB1_SB_META_MOSI_t) return FM_SB1_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB1_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB1_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB1_SB_META_MISO_t) return FM_SB1_SB_META_MISO_t is
      variable y : FM_SB1_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB1_SB_META_MISO_t) return FM_SB1_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB1_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB1_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB1_MON_t) return FM_SB1_MON_t is
      variable y : FM_SB1_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB1_MON_t) return FM_SB1_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB1_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB1_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB1_CTRL_t) return FM_SB1_CTRL_t is
      variable y : FM_SB1_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB1_CTRL_t) return FM_SB1_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB2_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB2_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB2_SB_MEM_MOSI_t) return FM_SB2_SB_MEM_MOSI_t is
      variable y : FM_SB2_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB2_SB_MEM_MOSI_t) return FM_SB2_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB2_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB2_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB2_SB_MEM_MISO_t) return FM_SB2_SB_MEM_MISO_t is
      variable y : FM_SB2_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB2_SB_MEM_MISO_t) return FM_SB2_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB2_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB2_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB2_SB_META_MOSI_t) return FM_SB2_SB_META_MOSI_t is
      variable y : FM_SB2_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB2_SB_META_MOSI_t) return FM_SB2_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB2_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB2_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB2_SB_META_MISO_t) return FM_SB2_SB_META_MISO_t is
      variable y : FM_SB2_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB2_SB_META_MISO_t) return FM_SB2_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB2_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB2_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB2_MON_t) return FM_SB2_MON_t is
      variable y : FM_SB2_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB2_MON_t) return FM_SB2_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB2_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB2_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB2_CTRL_t) return FM_SB2_CTRL_t is
      variable y : FM_SB2_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB2_CTRL_t) return FM_SB2_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB3_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB3_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB3_SB_MEM_MOSI_t) return FM_SB3_SB_MEM_MOSI_t is
      variable y : FM_SB3_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB3_SB_MEM_MOSI_t) return FM_SB3_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB3_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB3_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB3_SB_MEM_MISO_t) return FM_SB3_SB_MEM_MISO_t is
      variable y : FM_SB3_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB3_SB_MEM_MISO_t) return FM_SB3_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB3_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB3_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB3_SB_META_MOSI_t) return FM_SB3_SB_META_MOSI_t is
      variable y : FM_SB3_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB3_SB_META_MOSI_t) return FM_SB3_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB3_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB3_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB3_SB_META_MISO_t) return FM_SB3_SB_META_MISO_t is
      variable y : FM_SB3_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB3_SB_META_MISO_t) return FM_SB3_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB3_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB3_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB3_MON_t) return FM_SB3_MON_t is
      variable y : FM_SB3_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB3_MON_t) return FM_SB3_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB3_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB3_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB3_CTRL_t) return FM_SB3_CTRL_t is
      variable y : FM_SB3_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB3_CTRL_t) return FM_SB3_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB4_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB4_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB4_SB_MEM_MOSI_t) return FM_SB4_SB_MEM_MOSI_t is
      variable y : FM_SB4_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB4_SB_MEM_MOSI_t) return FM_SB4_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB4_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB4_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB4_SB_MEM_MISO_t) return FM_SB4_SB_MEM_MISO_t is
      variable y : FM_SB4_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB4_SB_MEM_MISO_t) return FM_SB4_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB4_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB4_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB4_SB_META_MOSI_t) return FM_SB4_SB_META_MOSI_t is
      variable y : FM_SB4_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB4_SB_META_MOSI_t) return FM_SB4_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB4_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB4_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB4_SB_META_MISO_t) return FM_SB4_SB_META_MISO_t is
      variable y : FM_SB4_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB4_SB_META_MISO_t) return FM_SB4_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB4_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB4_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB4_MON_t) return FM_SB4_MON_t is
      variable y : FM_SB4_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB4_MON_t) return FM_SB4_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB4_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB4_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB4_CTRL_t) return FM_SB4_CTRL_t is
      variable y : FM_SB4_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB4_CTRL_t) return FM_SB4_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB5_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB5_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB5_SB_MEM_MOSI_t) return FM_SB5_SB_MEM_MOSI_t is
      variable y : FM_SB5_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB5_SB_MEM_MOSI_t) return FM_SB5_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB5_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB5_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB5_SB_MEM_MISO_t) return FM_SB5_SB_MEM_MISO_t is
      variable y : FM_SB5_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB5_SB_MEM_MISO_t) return FM_SB5_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB5_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB5_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB5_SB_META_MOSI_t) return FM_SB5_SB_META_MOSI_t is
      variable y : FM_SB5_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB5_SB_META_MOSI_t) return FM_SB5_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB5_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB5_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB5_SB_META_MISO_t) return FM_SB5_SB_META_MISO_t is
      variable y : FM_SB5_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB5_SB_META_MISO_t) return FM_SB5_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB5_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB5_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB5_MON_t) return FM_SB5_MON_t is
      variable y : FM_SB5_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB5_MON_t) return FM_SB5_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB5_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB5_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB5_CTRL_t) return FM_SB5_CTRL_t is
      variable y : FM_SB5_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB5_CTRL_t) return FM_SB5_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB6_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB6_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB6_SB_MEM_MOSI_t) return FM_SB6_SB_MEM_MOSI_t is
      variable y : FM_SB6_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB6_SB_MEM_MOSI_t) return FM_SB6_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB6_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB6_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB6_SB_MEM_MISO_t) return FM_SB6_SB_MEM_MISO_t is
      variable y : FM_SB6_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB6_SB_MEM_MISO_t) return FM_SB6_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB6_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB6_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB6_SB_META_MOSI_t) return FM_SB6_SB_META_MOSI_t is
      variable y : FM_SB6_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB6_SB_META_MOSI_t) return FM_SB6_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB6_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB6_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB6_SB_META_MISO_t) return FM_SB6_SB_META_MISO_t is
      variable y : FM_SB6_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB6_SB_META_MISO_t) return FM_SB6_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB6_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB6_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB6_MON_t) return FM_SB6_MON_t is
      variable y : FM_SB6_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB6_MON_t) return FM_SB6_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB6_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB6_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB6_CTRL_t) return FM_SB6_CTRL_t is
      variable y : FM_SB6_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB6_CTRL_t) return FM_SB6_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB7_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB7_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB7_SB_MEM_MOSI_t) return FM_SB7_SB_MEM_MOSI_t is
      variable y : FM_SB7_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB7_SB_MEM_MOSI_t) return FM_SB7_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB7_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB7_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB7_SB_MEM_MISO_t) return FM_SB7_SB_MEM_MISO_t is
      variable y : FM_SB7_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB7_SB_MEM_MISO_t) return FM_SB7_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB7_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB7_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB7_SB_META_MOSI_t) return FM_SB7_SB_META_MOSI_t is
      variable y : FM_SB7_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB7_SB_META_MOSI_t) return FM_SB7_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB7_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB7_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB7_SB_META_MISO_t) return FM_SB7_SB_META_MISO_t is
      variable y : FM_SB7_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB7_SB_META_MISO_t) return FM_SB7_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB7_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB7_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB7_MON_t) return FM_SB7_MON_t is
      variable y : FM_SB7_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB7_MON_t) return FM_SB7_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB7_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB7_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB7_CTRL_t) return FM_SB7_CTRL_t is
      variable y : FM_SB7_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB7_CTRL_t) return FM_SB7_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB8_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB8_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB8_SB_MEM_MOSI_t) return FM_SB8_SB_MEM_MOSI_t is
      variable y : FM_SB8_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB8_SB_MEM_MOSI_t) return FM_SB8_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB8_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB8_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB8_SB_MEM_MISO_t) return FM_SB8_SB_MEM_MISO_t is
      variable y : FM_SB8_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB8_SB_MEM_MISO_t) return FM_SB8_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB8_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB8_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB8_SB_META_MOSI_t) return FM_SB8_SB_META_MOSI_t is
      variable y : FM_SB8_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB8_SB_META_MOSI_t) return FM_SB8_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB8_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB8_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB8_SB_META_MISO_t) return FM_SB8_SB_META_MISO_t is
      variable y : FM_SB8_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB8_SB_META_MISO_t) return FM_SB8_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB8_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB8_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB8_MON_t) return FM_SB8_MON_t is
      variable y : FM_SB8_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB8_MON_t) return FM_SB8_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB8_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB8_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB8_CTRL_t) return FM_SB8_CTRL_t is
      variable y : FM_SB8_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB8_CTRL_t) return FM_SB8_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB9_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB9_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB9_SB_MEM_MOSI_t) return FM_SB9_SB_MEM_MOSI_t is
      variable y : FM_SB9_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB9_SB_MEM_MOSI_t) return FM_SB9_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB9_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB9_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB9_SB_MEM_MISO_t) return FM_SB9_SB_MEM_MISO_t is
      variable y : FM_SB9_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB9_SB_MEM_MISO_t) return FM_SB9_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB9_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB9_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB9_SB_META_MOSI_t) return FM_SB9_SB_META_MOSI_t is
      variable y : FM_SB9_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB9_SB_META_MOSI_t) return FM_SB9_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB9_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB9_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB9_SB_META_MISO_t) return FM_SB9_SB_META_MISO_t is
      variable y : FM_SB9_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB9_SB_META_MISO_t) return FM_SB9_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB9_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB9_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB9_MON_t) return FM_SB9_MON_t is
      variable y : FM_SB9_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB9_MON_t) return FM_SB9_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB9_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB9_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB9_CTRL_t) return FM_SB9_CTRL_t is
      variable y : FM_SB9_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB9_CTRL_t) return FM_SB9_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB10_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB10_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB10_SB_MEM_MOSI_t) return FM_SB10_SB_MEM_MOSI_t is
      variable y : FM_SB10_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB10_SB_MEM_MOSI_t) return FM_SB10_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB10_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB10_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB10_SB_MEM_MISO_t) return FM_SB10_SB_MEM_MISO_t is
      variable y : FM_SB10_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB10_SB_MEM_MISO_t) return FM_SB10_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB10_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB10_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB10_SB_META_MOSI_t) return FM_SB10_SB_META_MOSI_t is
      variable y : FM_SB10_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB10_SB_META_MOSI_t) return FM_SB10_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB10_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB10_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB10_SB_META_MISO_t) return FM_SB10_SB_META_MISO_t is
      variable y : FM_SB10_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB10_SB_META_MISO_t) return FM_SB10_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB10_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB10_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB10_MON_t) return FM_SB10_MON_t is
      variable y : FM_SB10_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB10_MON_t) return FM_SB10_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB10_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB10_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB10_CTRL_t) return FM_SB10_CTRL_t is
      variable y : FM_SB10_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB10_CTRL_t) return FM_SB10_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB11_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB11_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB11_SB_MEM_MOSI_t) return FM_SB11_SB_MEM_MOSI_t is
      variable y : FM_SB11_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB11_SB_MEM_MOSI_t) return FM_SB11_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB11_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB11_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB11_SB_MEM_MISO_t) return FM_SB11_SB_MEM_MISO_t is
      variable y : FM_SB11_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB11_SB_MEM_MISO_t) return FM_SB11_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB11_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB11_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB11_SB_META_MOSI_t) return FM_SB11_SB_META_MOSI_t is
      variable y : FM_SB11_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB11_SB_META_MOSI_t) return FM_SB11_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB11_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB11_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB11_SB_META_MISO_t) return FM_SB11_SB_META_MISO_t is
      variable y : FM_SB11_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB11_SB_META_MISO_t) return FM_SB11_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB11_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB11_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB11_MON_t) return FM_SB11_MON_t is
      variable y : FM_SB11_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB11_MON_t) return FM_SB11_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB11_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB11_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB11_CTRL_t) return FM_SB11_CTRL_t is
      variable y : FM_SB11_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB11_CTRL_t) return FM_SB11_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB12_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB12_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB12_SB_MEM_MOSI_t) return FM_SB12_SB_MEM_MOSI_t is
      variable y : FM_SB12_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB12_SB_MEM_MOSI_t) return FM_SB12_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB12_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB12_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB12_SB_MEM_MISO_t) return FM_SB12_SB_MEM_MISO_t is
      variable y : FM_SB12_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB12_SB_MEM_MISO_t) return FM_SB12_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB12_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB12_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB12_SB_META_MOSI_t) return FM_SB12_SB_META_MOSI_t is
      variable y : FM_SB12_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB12_SB_META_MOSI_t) return FM_SB12_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB12_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB12_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB12_SB_META_MISO_t) return FM_SB12_SB_META_MISO_t is
      variable y : FM_SB12_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB12_SB_META_MISO_t) return FM_SB12_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB12_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB12_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB12_MON_t) return FM_SB12_MON_t is
      variable y : FM_SB12_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB12_MON_t) return FM_SB12_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB12_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB12_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB12_CTRL_t) return FM_SB12_CTRL_t is
      variable y : FM_SB12_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB12_CTRL_t) return FM_SB12_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB13_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB13_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB13_SB_MEM_MOSI_t) return FM_SB13_SB_MEM_MOSI_t is
      variable y : FM_SB13_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB13_SB_MEM_MOSI_t) return FM_SB13_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB13_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB13_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB13_SB_MEM_MISO_t) return FM_SB13_SB_MEM_MISO_t is
      variable y : FM_SB13_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB13_SB_MEM_MISO_t) return FM_SB13_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB13_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB13_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB13_SB_META_MOSI_t) return FM_SB13_SB_META_MOSI_t is
      variable y : FM_SB13_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB13_SB_META_MOSI_t) return FM_SB13_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB13_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB13_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB13_SB_META_MISO_t) return FM_SB13_SB_META_MISO_t is
      variable y : FM_SB13_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB13_SB_META_MISO_t) return FM_SB13_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB13_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB13_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB13_MON_t) return FM_SB13_MON_t is
      variable y : FM_SB13_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB13_MON_t) return FM_SB13_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB13_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB13_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB13_CTRL_t) return FM_SB13_CTRL_t is
      variable y : FM_SB13_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB13_CTRL_t) return FM_SB13_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB14_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB14_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB14_SB_MEM_MOSI_t) return FM_SB14_SB_MEM_MOSI_t is
      variable y : FM_SB14_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB14_SB_MEM_MOSI_t) return FM_SB14_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB14_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB14_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB14_SB_MEM_MISO_t) return FM_SB14_SB_MEM_MISO_t is
      variable y : FM_SB14_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB14_SB_MEM_MISO_t) return FM_SB14_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB14_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB14_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB14_SB_META_MOSI_t) return FM_SB14_SB_META_MOSI_t is
      variable y : FM_SB14_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB14_SB_META_MOSI_t) return FM_SB14_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB14_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB14_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB14_SB_META_MISO_t) return FM_SB14_SB_META_MISO_t is
      variable y : FM_SB14_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB14_SB_META_MISO_t) return FM_SB14_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB14_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB14_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB14_MON_t) return FM_SB14_MON_t is
      variable y : FM_SB14_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB14_MON_t) return FM_SB14_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB14_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB14_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB14_CTRL_t) return FM_SB14_CTRL_t is
      variable y : FM_SB14_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB14_CTRL_t) return FM_SB14_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB15_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB15_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB15_SB_MEM_MOSI_t) return FM_SB15_SB_MEM_MOSI_t is
      variable y : FM_SB15_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB15_SB_MEM_MOSI_t) return FM_SB15_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB15_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB15_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB15_SB_MEM_MISO_t) return FM_SB15_SB_MEM_MISO_t is
      variable y : FM_SB15_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB15_SB_MEM_MISO_t) return FM_SB15_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB15_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB15_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB15_SB_META_MOSI_t) return FM_SB15_SB_META_MOSI_t is
      variable y : FM_SB15_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB15_SB_META_MOSI_t) return FM_SB15_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB15_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB15_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB15_SB_META_MISO_t) return FM_SB15_SB_META_MISO_t is
      variable y : FM_SB15_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB15_SB_META_MISO_t) return FM_SB15_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB15_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB15_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB15_MON_t) return FM_SB15_MON_t is
      variable y : FM_SB15_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB15_MON_t) return FM_SB15_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB15_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB15_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB15_CTRL_t) return FM_SB15_CTRL_t is
      variable y : FM_SB15_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB15_CTRL_t) return FM_SB15_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB16_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB16_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB16_SB_MEM_MOSI_t) return FM_SB16_SB_MEM_MOSI_t is
      variable y : FM_SB16_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB16_SB_MEM_MOSI_t) return FM_SB16_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB16_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB16_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB16_SB_MEM_MISO_t) return FM_SB16_SB_MEM_MISO_t is
      variable y : FM_SB16_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB16_SB_MEM_MISO_t) return FM_SB16_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB16_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB16_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB16_SB_META_MOSI_t) return FM_SB16_SB_META_MOSI_t is
      variable y : FM_SB16_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB16_SB_META_MOSI_t) return FM_SB16_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB16_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB16_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB16_SB_META_MISO_t) return FM_SB16_SB_META_MISO_t is
      variable y : FM_SB16_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB16_SB_META_MISO_t) return FM_SB16_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB16_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB16_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB16_MON_t) return FM_SB16_MON_t is
      variable y : FM_SB16_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB16_MON_t) return FM_SB16_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB16_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB16_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB16_CTRL_t) return FM_SB16_CTRL_t is
      variable y : FM_SB16_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB16_CTRL_t) return FM_SB16_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB17_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB17_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB17_SB_MEM_MOSI_t) return FM_SB17_SB_MEM_MOSI_t is
      variable y : FM_SB17_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB17_SB_MEM_MOSI_t) return FM_SB17_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB17_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB17_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB17_SB_MEM_MISO_t) return FM_SB17_SB_MEM_MISO_t is
      variable y : FM_SB17_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB17_SB_MEM_MISO_t) return FM_SB17_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB17_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB17_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB17_SB_META_MOSI_t) return FM_SB17_SB_META_MOSI_t is
      variable y : FM_SB17_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB17_SB_META_MOSI_t) return FM_SB17_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB17_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB17_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB17_SB_META_MISO_t) return FM_SB17_SB_META_MISO_t is
      variable y : FM_SB17_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB17_SB_META_MISO_t) return FM_SB17_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB17_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB17_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB17_MON_t) return FM_SB17_MON_t is
      variable y : FM_SB17_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB17_MON_t) return FM_SB17_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB17_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB17_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB17_CTRL_t) return FM_SB17_CTRL_t is
      variable y : FM_SB17_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB17_CTRL_t) return FM_SB17_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB18_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB18_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB18_SB_MEM_MOSI_t) return FM_SB18_SB_MEM_MOSI_t is
      variable y : FM_SB18_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB18_SB_MEM_MOSI_t) return FM_SB18_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB18_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB18_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB18_SB_MEM_MISO_t) return FM_SB18_SB_MEM_MISO_t is
      variable y : FM_SB18_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB18_SB_MEM_MISO_t) return FM_SB18_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB18_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB18_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB18_SB_META_MOSI_t) return FM_SB18_SB_META_MOSI_t is
      variable y : FM_SB18_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB18_SB_META_MOSI_t) return FM_SB18_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB18_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB18_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB18_SB_META_MISO_t) return FM_SB18_SB_META_MISO_t is
      variable y : FM_SB18_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB18_SB_META_MISO_t) return FM_SB18_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB18_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB18_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB18_MON_t) return FM_SB18_MON_t is
      variable y : FM_SB18_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB18_MON_t) return FM_SB18_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB18_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB18_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB18_CTRL_t) return FM_SB18_CTRL_t is
      variable y : FM_SB18_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB18_CTRL_t) return FM_SB18_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB19_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB19_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB19_SB_MEM_MOSI_t) return FM_SB19_SB_MEM_MOSI_t is
      variable y : FM_SB19_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB19_SB_MEM_MOSI_t) return FM_SB19_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB19_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB19_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB19_SB_MEM_MISO_t) return FM_SB19_SB_MEM_MISO_t is
      variable y : FM_SB19_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB19_SB_MEM_MISO_t) return FM_SB19_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB19_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB19_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB19_SB_META_MOSI_t) return FM_SB19_SB_META_MOSI_t is
      variable y : FM_SB19_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB19_SB_META_MOSI_t) return FM_SB19_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB19_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB19_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB19_SB_META_MISO_t) return FM_SB19_SB_META_MISO_t is
      variable y : FM_SB19_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB19_SB_META_MISO_t) return FM_SB19_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB19_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB19_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB19_MON_t) return FM_SB19_MON_t is
      variable y : FM_SB19_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB19_MON_t) return FM_SB19_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB19_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB19_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB19_CTRL_t) return FM_SB19_CTRL_t is
      variable y : FM_SB19_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB19_CTRL_t) return FM_SB19_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB20_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB20_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB20_SB_MEM_MOSI_t) return FM_SB20_SB_MEM_MOSI_t is
      variable y : FM_SB20_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB20_SB_MEM_MOSI_t) return FM_SB20_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB20_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB20_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB20_SB_MEM_MISO_t) return FM_SB20_SB_MEM_MISO_t is
      variable y : FM_SB20_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB20_SB_MEM_MISO_t) return FM_SB20_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB20_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB20_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB20_SB_META_MOSI_t) return FM_SB20_SB_META_MOSI_t is
      variable y : FM_SB20_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB20_SB_META_MOSI_t) return FM_SB20_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB20_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB20_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB20_SB_META_MISO_t) return FM_SB20_SB_META_MISO_t is
      variable y : FM_SB20_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB20_SB_META_MISO_t) return FM_SB20_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB20_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB20_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB20_MON_t) return FM_SB20_MON_t is
      variable y : FM_SB20_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB20_MON_t) return FM_SB20_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB20_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB20_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB20_CTRL_t) return FM_SB20_CTRL_t is
      variable y : FM_SB20_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB20_CTRL_t) return FM_SB20_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB21_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB21_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB21_SB_MEM_MOSI_t) return FM_SB21_SB_MEM_MOSI_t is
      variable y : FM_SB21_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB21_SB_MEM_MOSI_t) return FM_SB21_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB21_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB21_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB21_SB_MEM_MISO_t) return FM_SB21_SB_MEM_MISO_t is
      variable y : FM_SB21_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB21_SB_MEM_MISO_t) return FM_SB21_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB21_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB21_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB21_SB_META_MOSI_t) return FM_SB21_SB_META_MOSI_t is
      variable y : FM_SB21_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB21_SB_META_MOSI_t) return FM_SB21_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB21_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB21_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB21_SB_META_MISO_t) return FM_SB21_SB_META_MISO_t is
      variable y : FM_SB21_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB21_SB_META_MISO_t) return FM_SB21_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB21_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB21_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB21_MON_t) return FM_SB21_MON_t is
      variable y : FM_SB21_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB21_MON_t) return FM_SB21_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB21_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB21_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB21_CTRL_t) return FM_SB21_CTRL_t is
      variable y : FM_SB21_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB21_CTRL_t) return FM_SB21_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB22_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB22_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB22_SB_MEM_MOSI_t) return FM_SB22_SB_MEM_MOSI_t is
      variable y : FM_SB22_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB22_SB_MEM_MOSI_t) return FM_SB22_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB22_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB22_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB22_SB_MEM_MISO_t) return FM_SB22_SB_MEM_MISO_t is
      variable y : FM_SB22_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB22_SB_MEM_MISO_t) return FM_SB22_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB22_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB22_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB22_SB_META_MOSI_t) return FM_SB22_SB_META_MOSI_t is
      variable y : FM_SB22_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB22_SB_META_MOSI_t) return FM_SB22_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB22_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB22_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB22_SB_META_MISO_t) return FM_SB22_SB_META_MISO_t is
      variable y : FM_SB22_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB22_SB_META_MISO_t) return FM_SB22_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB22_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB22_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB22_MON_t) return FM_SB22_MON_t is
      variable y : FM_SB22_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB22_MON_t) return FM_SB22_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB22_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB22_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB22_CTRL_t) return FM_SB22_CTRL_t is
      variable y : FM_SB22_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB22_CTRL_t) return FM_SB22_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB23_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB23_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB23_SB_MEM_MOSI_t) return FM_SB23_SB_MEM_MOSI_t is
      variable y : FM_SB23_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB23_SB_MEM_MOSI_t) return FM_SB23_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB23_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB23_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB23_SB_MEM_MISO_t) return FM_SB23_SB_MEM_MISO_t is
      variable y : FM_SB23_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB23_SB_MEM_MISO_t) return FM_SB23_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB23_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB23_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB23_SB_META_MOSI_t) return FM_SB23_SB_META_MOSI_t is
      variable y : FM_SB23_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB23_SB_META_MOSI_t) return FM_SB23_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB23_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB23_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB23_SB_META_MISO_t) return FM_SB23_SB_META_MISO_t is
      variable y : FM_SB23_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB23_SB_META_MISO_t) return FM_SB23_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB23_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB23_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB23_MON_t) return FM_SB23_MON_t is
      variable y : FM_SB23_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB23_MON_t) return FM_SB23_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB23_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB23_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB23_CTRL_t) return FM_SB23_CTRL_t is
      variable y : FM_SB23_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB23_CTRL_t) return FM_SB23_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB24_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB24_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB24_SB_MEM_MOSI_t) return FM_SB24_SB_MEM_MOSI_t is
      variable y : FM_SB24_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB24_SB_MEM_MOSI_t) return FM_SB24_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB24_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB24_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB24_SB_MEM_MISO_t) return FM_SB24_SB_MEM_MISO_t is
      variable y : FM_SB24_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB24_SB_MEM_MISO_t) return FM_SB24_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB24_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB24_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB24_SB_META_MOSI_t) return FM_SB24_SB_META_MOSI_t is
      variable y : FM_SB24_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB24_SB_META_MOSI_t) return FM_SB24_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB24_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB24_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB24_SB_META_MISO_t) return FM_SB24_SB_META_MISO_t is
      variable y : FM_SB24_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB24_SB_META_MISO_t) return FM_SB24_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB24_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB24_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB24_MON_t) return FM_SB24_MON_t is
      variable y : FM_SB24_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB24_MON_t) return FM_SB24_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB24_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB24_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB24_CTRL_t) return FM_SB24_CTRL_t is
      variable y : FM_SB24_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB24_CTRL_t) return FM_SB24_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB25_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB25_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB25_SB_MEM_MOSI_t) return FM_SB25_SB_MEM_MOSI_t is
      variable y : FM_SB25_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB25_SB_MEM_MOSI_t) return FM_SB25_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB25_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB25_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB25_SB_MEM_MISO_t) return FM_SB25_SB_MEM_MISO_t is
      variable y : FM_SB25_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB25_SB_MEM_MISO_t) return FM_SB25_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB25_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB25_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB25_SB_META_MOSI_t) return FM_SB25_SB_META_MOSI_t is
      variable y : FM_SB25_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB25_SB_META_MOSI_t) return FM_SB25_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB25_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB25_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB25_SB_META_MISO_t) return FM_SB25_SB_META_MISO_t is
      variable y : FM_SB25_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB25_SB_META_MISO_t) return FM_SB25_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB25_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB25_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB25_MON_t) return FM_SB25_MON_t is
      variable y : FM_SB25_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB25_MON_t) return FM_SB25_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB25_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB25_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB25_CTRL_t) return FM_SB25_CTRL_t is
      variable y : FM_SB25_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB25_CTRL_t) return FM_SB25_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB26_SB_MEM_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB26_SB_MEM_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB26_SB_MEM_MOSI_t) return FM_SB26_SB_MEM_MOSI_t is
      variable y : FM_SB26_SB_MEM_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB26_SB_MEM_MOSI_t) return FM_SB26_SB_MEM_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB26_SB_MEM_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB26_SB_MEM_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB26_SB_MEM_MISO_t) return FM_SB26_SB_MEM_MISO_t is
      variable y : FM_SB26_SB_MEM_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB26_SB_MEM_MISO_t) return FM_SB26_SB_MEM_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB26_SB_META_MOSI_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.clk);
      w := w + width(x.enable);
      w := w + width(x.wr_enable);
      w := w + width(x.address);
      w := w + width(x.wr_data);
      return w;
   end function width;
   function convert(x: FM_SB26_SB_META_MOSI_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.clk);
         y(u to u+w-1) := convert(x.clk, y(u to u+w-1));
         u := u + w;
         w := width(x.enable);
         y(u to u+w-1) := convert(x.enable, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_enable);
         y(u to u+w-1) := convert(x.wr_enable, y(u to u+w-1));
         u := u + w;
         w := width(x.address);
         y(u to u+w-1) := convert(x.address, y(u to u+w-1));
         u := u + w;
         w := width(x.wr_data);
         y(u to u+w-1) := convert(x.wr_data, y(u to u+w-1));
      else
         w := width(x.clk);
         y(u downto u-w+1) := convert(x.clk, y(u downto u-w+1));
         u := u - w;
         w := width(x.enable);
         y(u downto u-w+1) := convert(x.enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_enable);
         y(u downto u-w+1) := convert(x.wr_enable, y(u downto u-w+1));
         u := u - w;
         w := width(x.address);
         y(u downto u-w+1) := convert(x.address, y(u downto u-w+1));
         u := u - w;
         w := width(x.wr_data);
         y(u downto u-w+1) := convert(x.wr_data, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB26_SB_META_MOSI_t) return FM_SB26_SB_META_MOSI_t is
      variable y : FM_SB26_SB_META_MOSI_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.clk);
         y.clk := convert(x(u to u+w-1), tpl.clk);
         u := u + w;
         w := width(tpl.enable);
         y.enable := convert(x(u to u+w-1), tpl.enable);
         u := u + w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u to u+w-1), tpl.wr_enable);
         u := u + w;
         w := width(tpl.address);
         y.address := convert(x(u to u+w-1), tpl.address);
         u := u + w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u to u+w-1), tpl.wr_data);
      else
         w := width(tpl.clk);
         y.clk := convert(x(u downto u-w+1), tpl.clk);
         u := u - w;
         w := width(tpl.enable);
         y.enable := convert(x(u downto u-w+1), tpl.enable);
         u := u - w;
         w := width(tpl.wr_enable);
         y.wr_enable := convert(x(u downto u-w+1), tpl.wr_enable);
         u := u - w;
         w := width(tpl.address);
         y.address := convert(x(u downto u-w+1), tpl.address);
         u := u - w;
         w := width(tpl.wr_data);
         y.wr_data := convert(x(u downto u-w+1), tpl.wr_data);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB26_SB_META_MOSI_t) return FM_SB26_SB_META_MOSI_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB26_SB_META_MISO_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.rd_data);
      w := w + width(x.rd_data_valid);
      return w;
   end function width;
   function convert(x: FM_SB26_SB_META_MISO_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.rd_data);
         y(u to u+w-1) := convert(x.rd_data, y(u to u+w-1));
         u := u + w;
         w := width(x.rd_data_valid);
         y(u to u+w-1) := convert(x.rd_data_valid, y(u to u+w-1));
      else
         w := width(x.rd_data);
         y(u downto u-w+1) := convert(x.rd_data, y(u downto u-w+1));
         u := u - w;
         w := width(x.rd_data_valid);
         y(u downto u-w+1) := convert(x.rd_data_valid, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB26_SB_META_MISO_t) return FM_SB26_SB_META_MISO_t is
      variable y : FM_SB26_SB_META_MISO_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u to u+w-1), tpl.rd_data);
         u := u + w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u to u+w-1), tpl.rd_data_valid);
      else
         w := width(tpl.rd_data);
         y.rd_data := convert(x(u downto u-w+1), tpl.rd_data);
         u := u - w;
         w := width(tpl.rd_data_valid);
         y.rd_data_valid := convert(x(u downto u-w+1), tpl.rd_data_valid);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB26_SB_META_MISO_t) return FM_SB26_SB_META_MISO_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB26_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB26_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB26_MON_t) return FM_SB26_MON_t is
      variable y : FM_SB26_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB26_MON_t) return FM_SB26_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_SB26_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB_MEM);
      w := w + width(x.SB_META);
      return w;
   end function width;
   function convert(x: FM_SB26_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB_MEM);
         y(u to u+w-1) := convert(x.SB_MEM, y(u to u+w-1));
         u := u + w;
         w := width(x.SB_META);
         y(u to u+w-1) := convert(x.SB_META, y(u to u+w-1));
      else
         w := width(x.SB_MEM);
         y(u downto u-w+1) := convert(x.SB_MEM, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB_META);
         y(u downto u-w+1) := convert(x.SB_META, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_SB26_CTRL_t) return FM_SB26_CTRL_t is
      variable y : FM_SB26_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u to u+w-1), tpl.SB_MEM);
         u := u + w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u to u+w-1), tpl.SB_META);
      else
         w := width(tpl.SB_MEM);
         y.SB_MEM := convert(x(u downto u-w+1), tpl.SB_MEM);
         u := u - w;
         w := width(tpl.SB_META);
         y.SB_META := convert(x(u downto u-w+1), tpl.SB_META);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_SB26_CTRL_t) return FM_SB26_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_MON_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SB0);
      w := w + width(x.SB1);
      w := w + width(x.SB2);
      w := w + width(x.SB3);
      w := w + width(x.SB4);
      w := w + width(x.SB5);
      w := w + width(x.SB6);
      w := w + width(x.SB7);
      w := w + width(x.SB8);
      w := w + width(x.SB9);
      w := w + width(x.SB10);
      w := w + width(x.SB11);
      w := w + width(x.SB12);
      w := w + width(x.SB13);
      w := w + width(x.SB14);
      w := w + width(x.SB15);
      w := w + width(x.SB16);
      w := w + width(x.SB17);
      w := w + width(x.SB18);
      w := w + width(x.SB19);
      w := w + width(x.SB20);
      w := w + width(x.SB21);
      w := w + width(x.SB22);
      w := w + width(x.SB23);
      w := w + width(x.SB24);
      w := w + width(x.SB25);
      w := w + width(x.SB26);
      return w;
   end function width;
   function convert(x: FM_MON_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SB0);
         y(u to u+w-1) := convert(x.SB0, y(u to u+w-1));
         u := u + w;
         w := width(x.SB1);
         y(u to u+w-1) := convert(x.SB1, y(u to u+w-1));
         u := u + w;
         w := width(x.SB2);
         y(u to u+w-1) := convert(x.SB2, y(u to u+w-1));
         u := u + w;
         w := width(x.SB3);
         y(u to u+w-1) := convert(x.SB3, y(u to u+w-1));
         u := u + w;
         w := width(x.SB4);
         y(u to u+w-1) := convert(x.SB4, y(u to u+w-1));
         u := u + w;
         w := width(x.SB5);
         y(u to u+w-1) := convert(x.SB5, y(u to u+w-1));
         u := u + w;
         w := width(x.SB6);
         y(u to u+w-1) := convert(x.SB6, y(u to u+w-1));
         u := u + w;
         w := width(x.SB7);
         y(u to u+w-1) := convert(x.SB7, y(u to u+w-1));
         u := u + w;
         w := width(x.SB8);
         y(u to u+w-1) := convert(x.SB8, y(u to u+w-1));
         u := u + w;
         w := width(x.SB9);
         y(u to u+w-1) := convert(x.SB9, y(u to u+w-1));
         u := u + w;
         w := width(x.SB10);
         y(u to u+w-1) := convert(x.SB10, y(u to u+w-1));
         u := u + w;
         w := width(x.SB11);
         y(u to u+w-1) := convert(x.SB11, y(u to u+w-1));
         u := u + w;
         w := width(x.SB12);
         y(u to u+w-1) := convert(x.SB12, y(u to u+w-1));
         u := u + w;
         w := width(x.SB13);
         y(u to u+w-1) := convert(x.SB13, y(u to u+w-1));
         u := u + w;
         w := width(x.SB14);
         y(u to u+w-1) := convert(x.SB14, y(u to u+w-1));
         u := u + w;
         w := width(x.SB15);
         y(u to u+w-1) := convert(x.SB15, y(u to u+w-1));
         u := u + w;
         w := width(x.SB16);
         y(u to u+w-1) := convert(x.SB16, y(u to u+w-1));
         u := u + w;
         w := width(x.SB17);
         y(u to u+w-1) := convert(x.SB17, y(u to u+w-1));
         u := u + w;
         w := width(x.SB18);
         y(u to u+w-1) := convert(x.SB18, y(u to u+w-1));
         u := u + w;
         w := width(x.SB19);
         y(u to u+w-1) := convert(x.SB19, y(u to u+w-1));
         u := u + w;
         w := width(x.SB20);
         y(u to u+w-1) := convert(x.SB20, y(u to u+w-1));
         u := u + w;
         w := width(x.SB21);
         y(u to u+w-1) := convert(x.SB21, y(u to u+w-1));
         u := u + w;
         w := width(x.SB22);
         y(u to u+w-1) := convert(x.SB22, y(u to u+w-1));
         u := u + w;
         w := width(x.SB23);
         y(u to u+w-1) := convert(x.SB23, y(u to u+w-1));
         u := u + w;
         w := width(x.SB24);
         y(u to u+w-1) := convert(x.SB24, y(u to u+w-1));
         u := u + w;
         w := width(x.SB25);
         y(u to u+w-1) := convert(x.SB25, y(u to u+w-1));
         u := u + w;
         w := width(x.SB26);
         y(u to u+w-1) := convert(x.SB26, y(u to u+w-1));
      else
         w := width(x.SB0);
         y(u downto u-w+1) := convert(x.SB0, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB1);
         y(u downto u-w+1) := convert(x.SB1, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB2);
         y(u downto u-w+1) := convert(x.SB2, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB3);
         y(u downto u-w+1) := convert(x.SB3, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB4);
         y(u downto u-w+1) := convert(x.SB4, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB5);
         y(u downto u-w+1) := convert(x.SB5, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB6);
         y(u downto u-w+1) := convert(x.SB6, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB7);
         y(u downto u-w+1) := convert(x.SB7, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB8);
         y(u downto u-w+1) := convert(x.SB8, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB9);
         y(u downto u-w+1) := convert(x.SB9, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB10);
         y(u downto u-w+1) := convert(x.SB10, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB11);
         y(u downto u-w+1) := convert(x.SB11, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB12);
         y(u downto u-w+1) := convert(x.SB12, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB13);
         y(u downto u-w+1) := convert(x.SB13, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB14);
         y(u downto u-w+1) := convert(x.SB14, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB15);
         y(u downto u-w+1) := convert(x.SB15, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB16);
         y(u downto u-w+1) := convert(x.SB16, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB17);
         y(u downto u-w+1) := convert(x.SB17, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB18);
         y(u downto u-w+1) := convert(x.SB18, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB19);
         y(u downto u-w+1) := convert(x.SB19, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB20);
         y(u downto u-w+1) := convert(x.SB20, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB21);
         y(u downto u-w+1) := convert(x.SB21, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB22);
         y(u downto u-w+1) := convert(x.SB22, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB23);
         y(u downto u-w+1) := convert(x.SB23, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB24);
         y(u downto u-w+1) := convert(x.SB24, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB25);
         y(u downto u-w+1) := convert(x.SB25, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB26);
         y(u downto u-w+1) := convert(x.SB26, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_MON_t) return FM_MON_t is
      variable y : FM_MON_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SB0);
         y.SB0 := convert(x(u to u+w-1), tpl.SB0);
         u := u + w;
         w := width(tpl.SB1);
         y.SB1 := convert(x(u to u+w-1), tpl.SB1);
         u := u + w;
         w := width(tpl.SB2);
         y.SB2 := convert(x(u to u+w-1), tpl.SB2);
         u := u + w;
         w := width(tpl.SB3);
         y.SB3 := convert(x(u to u+w-1), tpl.SB3);
         u := u + w;
         w := width(tpl.SB4);
         y.SB4 := convert(x(u to u+w-1), tpl.SB4);
         u := u + w;
         w := width(tpl.SB5);
         y.SB5 := convert(x(u to u+w-1), tpl.SB5);
         u := u + w;
         w := width(tpl.SB6);
         y.SB6 := convert(x(u to u+w-1), tpl.SB6);
         u := u + w;
         w := width(tpl.SB7);
         y.SB7 := convert(x(u to u+w-1), tpl.SB7);
         u := u + w;
         w := width(tpl.SB8);
         y.SB8 := convert(x(u to u+w-1), tpl.SB8);
         u := u + w;
         w := width(tpl.SB9);
         y.SB9 := convert(x(u to u+w-1), tpl.SB9);
         u := u + w;
         w := width(tpl.SB10);
         y.SB10 := convert(x(u to u+w-1), tpl.SB10);
         u := u + w;
         w := width(tpl.SB11);
         y.SB11 := convert(x(u to u+w-1), tpl.SB11);
         u := u + w;
         w := width(tpl.SB12);
         y.SB12 := convert(x(u to u+w-1), tpl.SB12);
         u := u + w;
         w := width(tpl.SB13);
         y.SB13 := convert(x(u to u+w-1), tpl.SB13);
         u := u + w;
         w := width(tpl.SB14);
         y.SB14 := convert(x(u to u+w-1), tpl.SB14);
         u := u + w;
         w := width(tpl.SB15);
         y.SB15 := convert(x(u to u+w-1), tpl.SB15);
         u := u + w;
         w := width(tpl.SB16);
         y.SB16 := convert(x(u to u+w-1), tpl.SB16);
         u := u + w;
         w := width(tpl.SB17);
         y.SB17 := convert(x(u to u+w-1), tpl.SB17);
         u := u + w;
         w := width(tpl.SB18);
         y.SB18 := convert(x(u to u+w-1), tpl.SB18);
         u := u + w;
         w := width(tpl.SB19);
         y.SB19 := convert(x(u to u+w-1), tpl.SB19);
         u := u + w;
         w := width(tpl.SB20);
         y.SB20 := convert(x(u to u+w-1), tpl.SB20);
         u := u + w;
         w := width(tpl.SB21);
         y.SB21 := convert(x(u to u+w-1), tpl.SB21);
         u := u + w;
         w := width(tpl.SB22);
         y.SB22 := convert(x(u to u+w-1), tpl.SB22);
         u := u + w;
         w := width(tpl.SB23);
         y.SB23 := convert(x(u to u+w-1), tpl.SB23);
         u := u + w;
         w := width(tpl.SB24);
         y.SB24 := convert(x(u to u+w-1), tpl.SB24);
         u := u + w;
         w := width(tpl.SB25);
         y.SB25 := convert(x(u to u+w-1), tpl.SB25);
         u := u + w;
         w := width(tpl.SB26);
         y.SB26 := convert(x(u to u+w-1), tpl.SB26);
      else
         w := width(tpl.SB0);
         y.SB0 := convert(x(u downto u-w+1), tpl.SB0);
         u := u - w;
         w := width(tpl.SB1);
         y.SB1 := convert(x(u downto u-w+1), tpl.SB1);
         u := u - w;
         w := width(tpl.SB2);
         y.SB2 := convert(x(u downto u-w+1), tpl.SB2);
         u := u - w;
         w := width(tpl.SB3);
         y.SB3 := convert(x(u downto u-w+1), tpl.SB3);
         u := u - w;
         w := width(tpl.SB4);
         y.SB4 := convert(x(u downto u-w+1), tpl.SB4);
         u := u - w;
         w := width(tpl.SB5);
         y.SB5 := convert(x(u downto u-w+1), tpl.SB5);
         u := u - w;
         w := width(tpl.SB6);
         y.SB6 := convert(x(u downto u-w+1), tpl.SB6);
         u := u - w;
         w := width(tpl.SB7);
         y.SB7 := convert(x(u downto u-w+1), tpl.SB7);
         u := u - w;
         w := width(tpl.SB8);
         y.SB8 := convert(x(u downto u-w+1), tpl.SB8);
         u := u - w;
         w := width(tpl.SB9);
         y.SB9 := convert(x(u downto u-w+1), tpl.SB9);
         u := u - w;
         w := width(tpl.SB10);
         y.SB10 := convert(x(u downto u-w+1), tpl.SB10);
         u := u - w;
         w := width(tpl.SB11);
         y.SB11 := convert(x(u downto u-w+1), tpl.SB11);
         u := u - w;
         w := width(tpl.SB12);
         y.SB12 := convert(x(u downto u-w+1), tpl.SB12);
         u := u - w;
         w := width(tpl.SB13);
         y.SB13 := convert(x(u downto u-w+1), tpl.SB13);
         u := u - w;
         w := width(tpl.SB14);
         y.SB14 := convert(x(u downto u-w+1), tpl.SB14);
         u := u - w;
         w := width(tpl.SB15);
         y.SB15 := convert(x(u downto u-w+1), tpl.SB15);
         u := u - w;
         w := width(tpl.SB16);
         y.SB16 := convert(x(u downto u-w+1), tpl.SB16);
         u := u - w;
         w := width(tpl.SB17);
         y.SB17 := convert(x(u downto u-w+1), tpl.SB17);
         u := u - w;
         w := width(tpl.SB18);
         y.SB18 := convert(x(u downto u-w+1), tpl.SB18);
         u := u - w;
         w := width(tpl.SB19);
         y.SB19 := convert(x(u downto u-w+1), tpl.SB19);
         u := u - w;
         w := width(tpl.SB20);
         y.SB20 := convert(x(u downto u-w+1), tpl.SB20);
         u := u - w;
         w := width(tpl.SB21);
         y.SB21 := convert(x(u downto u-w+1), tpl.SB21);
         u := u - w;
         w := width(tpl.SB22);
         y.SB22 := convert(x(u downto u-w+1), tpl.SB22);
         u := u - w;
         w := width(tpl.SB23);
         y.SB23 := convert(x(u downto u-w+1), tpl.SB23);
         u := u - w;
         w := width(tpl.SB24);
         y.SB24 := convert(x(u downto u-w+1), tpl.SB24);
         u := u - w;
         w := width(tpl.SB25);
         y.SB25 := convert(x(u downto u-w+1), tpl.SB25);
         u := u - w;
         w := width(tpl.SB26);
         y.SB26 := convert(x(u downto u-w+1), tpl.SB26);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_MON_t) return FM_MON_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: FM_CTRL_t) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.SPY_CTRL);
      w := w + width(x.FREEZE_MASK_0);
      w := w + width(x.FREEZE_MASK_1);
      w := w + width(x.PLAYBACK_MASK_0);
      w := w + width(x.PLAYBACK_MASK_1);
      w := w + width(x.SB0);
      w := w + width(x.SB1);
      w := w + width(x.SB2);
      w := w + width(x.SB3);
      w := w + width(x.SB4);
      w := w + width(x.SB5);
      w := w + width(x.SB6);
      w := w + width(x.SB7);
      w := w + width(x.SB8);
      w := w + width(x.SB9);
      w := w + width(x.SB10);
      w := w + width(x.SB11);
      w := w + width(x.SB12);
      w := w + width(x.SB13);
      w := w + width(x.SB14);
      w := w + width(x.SB15);
      w := w + width(x.SB16);
      w := w + width(x.SB17);
      w := w + width(x.SB18);
      w := w + width(x.SB19);
      w := w + width(x.SB20);
      w := w + width(x.SB21);
      w := w + width(x.SB22);
      w := w + width(x.SB23);
      w := w + width(x.SB24);
      w := w + width(x.SB25);
      w := w + width(x.SB26);
      return w;
   end function width;
   function convert(x: FM_CTRL_t; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.SPY_CTRL);
         y(u to u+w-1) := convert(x.SPY_CTRL, y(u to u+w-1));
         u := u + w;
         w := width(x.FREEZE_MASK_0);
         y(u to u+w-1) := convert(x.FREEZE_MASK_0, y(u to u+w-1));
         u := u + w;
         w := width(x.FREEZE_MASK_1);
         y(u to u+w-1) := convert(x.FREEZE_MASK_1, y(u to u+w-1));
         u := u + w;
         w := width(x.PLAYBACK_MASK_0);
         y(u to u+w-1) := convert(x.PLAYBACK_MASK_0, y(u to u+w-1));
         u := u + w;
         w := width(x.PLAYBACK_MASK_1);
         y(u to u+w-1) := convert(x.PLAYBACK_MASK_1, y(u to u+w-1));
         u := u + w;
         w := width(x.SB0);
         y(u to u+w-1) := convert(x.SB0, y(u to u+w-1));
         u := u + w;
         w := width(x.SB1);
         y(u to u+w-1) := convert(x.SB1, y(u to u+w-1));
         u := u + w;
         w := width(x.SB2);
         y(u to u+w-1) := convert(x.SB2, y(u to u+w-1));
         u := u + w;
         w := width(x.SB3);
         y(u to u+w-1) := convert(x.SB3, y(u to u+w-1));
         u := u + w;
         w := width(x.SB4);
         y(u to u+w-1) := convert(x.SB4, y(u to u+w-1));
         u := u + w;
         w := width(x.SB5);
         y(u to u+w-1) := convert(x.SB5, y(u to u+w-1));
         u := u + w;
         w := width(x.SB6);
         y(u to u+w-1) := convert(x.SB6, y(u to u+w-1));
         u := u + w;
         w := width(x.SB7);
         y(u to u+w-1) := convert(x.SB7, y(u to u+w-1));
         u := u + w;
         w := width(x.SB8);
         y(u to u+w-1) := convert(x.SB8, y(u to u+w-1));
         u := u + w;
         w := width(x.SB9);
         y(u to u+w-1) := convert(x.SB9, y(u to u+w-1));
         u := u + w;
         w := width(x.SB10);
         y(u to u+w-1) := convert(x.SB10, y(u to u+w-1));
         u := u + w;
         w := width(x.SB11);
         y(u to u+w-1) := convert(x.SB11, y(u to u+w-1));
         u := u + w;
         w := width(x.SB12);
         y(u to u+w-1) := convert(x.SB12, y(u to u+w-1));
         u := u + w;
         w := width(x.SB13);
         y(u to u+w-1) := convert(x.SB13, y(u to u+w-1));
         u := u + w;
         w := width(x.SB14);
         y(u to u+w-1) := convert(x.SB14, y(u to u+w-1));
         u := u + w;
         w := width(x.SB15);
         y(u to u+w-1) := convert(x.SB15, y(u to u+w-1));
         u := u + w;
         w := width(x.SB16);
         y(u to u+w-1) := convert(x.SB16, y(u to u+w-1));
         u := u + w;
         w := width(x.SB17);
         y(u to u+w-1) := convert(x.SB17, y(u to u+w-1));
         u := u + w;
         w := width(x.SB18);
         y(u to u+w-1) := convert(x.SB18, y(u to u+w-1));
         u := u + w;
         w := width(x.SB19);
         y(u to u+w-1) := convert(x.SB19, y(u to u+w-1));
         u := u + w;
         w := width(x.SB20);
         y(u to u+w-1) := convert(x.SB20, y(u to u+w-1));
         u := u + w;
         w := width(x.SB21);
         y(u to u+w-1) := convert(x.SB21, y(u to u+w-1));
         u := u + w;
         w := width(x.SB22);
         y(u to u+w-1) := convert(x.SB22, y(u to u+w-1));
         u := u + w;
         w := width(x.SB23);
         y(u to u+w-1) := convert(x.SB23, y(u to u+w-1));
         u := u + w;
         w := width(x.SB24);
         y(u to u+w-1) := convert(x.SB24, y(u to u+w-1));
         u := u + w;
         w := width(x.SB25);
         y(u to u+w-1) := convert(x.SB25, y(u to u+w-1));
         u := u + w;
         w := width(x.SB26);
         y(u to u+w-1) := convert(x.SB26, y(u to u+w-1));
      else
         w := width(x.SPY_CTRL);
         y(u downto u-w+1) := convert(x.SPY_CTRL, y(u downto u-w+1));
         u := u - w;
         w := width(x.FREEZE_MASK_0);
         y(u downto u-w+1) := convert(x.FREEZE_MASK_0, y(u downto u-w+1));
         u := u - w;
         w := width(x.FREEZE_MASK_1);
         y(u downto u-w+1) := convert(x.FREEZE_MASK_1, y(u downto u-w+1));
         u := u - w;
         w := width(x.PLAYBACK_MASK_0);
         y(u downto u-w+1) := convert(x.PLAYBACK_MASK_0, y(u downto u-w+1));
         u := u - w;
         w := width(x.PLAYBACK_MASK_1);
         y(u downto u-w+1) := convert(x.PLAYBACK_MASK_1, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB0);
         y(u downto u-w+1) := convert(x.SB0, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB1);
         y(u downto u-w+1) := convert(x.SB1, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB2);
         y(u downto u-w+1) := convert(x.SB2, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB3);
         y(u downto u-w+1) := convert(x.SB3, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB4);
         y(u downto u-w+1) := convert(x.SB4, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB5);
         y(u downto u-w+1) := convert(x.SB5, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB6);
         y(u downto u-w+1) := convert(x.SB6, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB7);
         y(u downto u-w+1) := convert(x.SB7, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB8);
         y(u downto u-w+1) := convert(x.SB8, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB9);
         y(u downto u-w+1) := convert(x.SB9, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB10);
         y(u downto u-w+1) := convert(x.SB10, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB11);
         y(u downto u-w+1) := convert(x.SB11, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB12);
         y(u downto u-w+1) := convert(x.SB12, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB13);
         y(u downto u-w+1) := convert(x.SB13, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB14);
         y(u downto u-w+1) := convert(x.SB14, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB15);
         y(u downto u-w+1) := convert(x.SB15, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB16);
         y(u downto u-w+1) := convert(x.SB16, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB17);
         y(u downto u-w+1) := convert(x.SB17, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB18);
         y(u downto u-w+1) := convert(x.SB18, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB19);
         y(u downto u-w+1) := convert(x.SB19, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB20);
         y(u downto u-w+1) := convert(x.SB20, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB21);
         y(u downto u-w+1) := convert(x.SB21, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB22);
         y(u downto u-w+1) := convert(x.SB22, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB23);
         y(u downto u-w+1) := convert(x.SB23, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB24);
         y(u downto u-w+1) := convert(x.SB24, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB25);
         y(u downto u-w+1) := convert(x.SB25, y(u downto u-w+1));
         u := u - w;
         w := width(x.SB26);
         y(u downto u-w+1) := convert(x.SB26, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: FM_CTRL_t) return FM_CTRL_t is
      variable y : FM_CTRL_t;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.SPY_CTRL);
         y.SPY_CTRL := convert(x(u to u+w-1), tpl.SPY_CTRL);
         u := u + w;
         w := width(tpl.FREEZE_MASK_0);
         y.FREEZE_MASK_0 := convert(x(u to u+w-1), tpl.FREEZE_MASK_0);
         u := u + w;
         w := width(tpl.FREEZE_MASK_1);
         y.FREEZE_MASK_1 := convert(x(u to u+w-1), tpl.FREEZE_MASK_1);
         u := u + w;
         w := width(tpl.PLAYBACK_MASK_0);
         y.PLAYBACK_MASK_0 := convert(x(u to u+w-1), tpl.PLAYBACK_MASK_0);
         u := u + w;
         w := width(tpl.PLAYBACK_MASK_1);
         y.PLAYBACK_MASK_1 := convert(x(u to u+w-1), tpl.PLAYBACK_MASK_1);
         u := u + w;
         w := width(tpl.SB0);
         y.SB0 := convert(x(u to u+w-1), tpl.SB0);
         u := u + w;
         w := width(tpl.SB1);
         y.SB1 := convert(x(u to u+w-1), tpl.SB1);
         u := u + w;
         w := width(tpl.SB2);
         y.SB2 := convert(x(u to u+w-1), tpl.SB2);
         u := u + w;
         w := width(tpl.SB3);
         y.SB3 := convert(x(u to u+w-1), tpl.SB3);
         u := u + w;
         w := width(tpl.SB4);
         y.SB4 := convert(x(u to u+w-1), tpl.SB4);
         u := u + w;
         w := width(tpl.SB5);
         y.SB5 := convert(x(u to u+w-1), tpl.SB5);
         u := u + w;
         w := width(tpl.SB6);
         y.SB6 := convert(x(u to u+w-1), tpl.SB6);
         u := u + w;
         w := width(tpl.SB7);
         y.SB7 := convert(x(u to u+w-1), tpl.SB7);
         u := u + w;
         w := width(tpl.SB8);
         y.SB8 := convert(x(u to u+w-1), tpl.SB8);
         u := u + w;
         w := width(tpl.SB9);
         y.SB9 := convert(x(u to u+w-1), tpl.SB9);
         u := u + w;
         w := width(tpl.SB10);
         y.SB10 := convert(x(u to u+w-1), tpl.SB10);
         u := u + w;
         w := width(tpl.SB11);
         y.SB11 := convert(x(u to u+w-1), tpl.SB11);
         u := u + w;
         w := width(tpl.SB12);
         y.SB12 := convert(x(u to u+w-1), tpl.SB12);
         u := u + w;
         w := width(tpl.SB13);
         y.SB13 := convert(x(u to u+w-1), tpl.SB13);
         u := u + w;
         w := width(tpl.SB14);
         y.SB14 := convert(x(u to u+w-1), tpl.SB14);
         u := u + w;
         w := width(tpl.SB15);
         y.SB15 := convert(x(u to u+w-1), tpl.SB15);
         u := u + w;
         w := width(tpl.SB16);
         y.SB16 := convert(x(u to u+w-1), tpl.SB16);
         u := u + w;
         w := width(tpl.SB17);
         y.SB17 := convert(x(u to u+w-1), tpl.SB17);
         u := u + w;
         w := width(tpl.SB18);
         y.SB18 := convert(x(u to u+w-1), tpl.SB18);
         u := u + w;
         w := width(tpl.SB19);
         y.SB19 := convert(x(u to u+w-1), tpl.SB19);
         u := u + w;
         w := width(tpl.SB20);
         y.SB20 := convert(x(u to u+w-1), tpl.SB20);
         u := u + w;
         w := width(tpl.SB21);
         y.SB21 := convert(x(u to u+w-1), tpl.SB21);
         u := u + w;
         w := width(tpl.SB22);
         y.SB22 := convert(x(u to u+w-1), tpl.SB22);
         u := u + w;
         w := width(tpl.SB23);
         y.SB23 := convert(x(u to u+w-1), tpl.SB23);
         u := u + w;
         w := width(tpl.SB24);
         y.SB24 := convert(x(u to u+w-1), tpl.SB24);
         u := u + w;
         w := width(tpl.SB25);
         y.SB25 := convert(x(u to u+w-1), tpl.SB25);
         u := u + w;
         w := width(tpl.SB26);
         y.SB26 := convert(x(u to u+w-1), tpl.SB26);
      else
         w := width(tpl.SPY_CTRL);
         y.SPY_CTRL := convert(x(u downto u-w+1), tpl.SPY_CTRL);
         u := u - w;
         w := width(tpl.FREEZE_MASK_0);
         y.FREEZE_MASK_0 := convert(x(u downto u-w+1), tpl.FREEZE_MASK_0);
         u := u - w;
         w := width(tpl.FREEZE_MASK_1);
         y.FREEZE_MASK_1 := convert(x(u downto u-w+1), tpl.FREEZE_MASK_1);
         u := u - w;
         w := width(tpl.PLAYBACK_MASK_0);
         y.PLAYBACK_MASK_0 := convert(x(u downto u-w+1), tpl.PLAYBACK_MASK_0);
         u := u - w;
         w := width(tpl.PLAYBACK_MASK_1);
         y.PLAYBACK_MASK_1 := convert(x(u downto u-w+1), tpl.PLAYBACK_MASK_1);
         u := u - w;
         w := width(tpl.SB0);
         y.SB0 := convert(x(u downto u-w+1), tpl.SB0);
         u := u - w;
         w := width(tpl.SB1);
         y.SB1 := convert(x(u downto u-w+1), tpl.SB1);
         u := u - w;
         w := width(tpl.SB2);
         y.SB2 := convert(x(u downto u-w+1), tpl.SB2);
         u := u - w;
         w := width(tpl.SB3);
         y.SB3 := convert(x(u downto u-w+1), tpl.SB3);
         u := u - w;
         w := width(tpl.SB4);
         y.SB4 := convert(x(u downto u-w+1), tpl.SB4);
         u := u - w;
         w := width(tpl.SB5);
         y.SB5 := convert(x(u downto u-w+1), tpl.SB5);
         u := u - w;
         w := width(tpl.SB6);
         y.SB6 := convert(x(u downto u-w+1), tpl.SB6);
         u := u - w;
         w := width(tpl.SB7);
         y.SB7 := convert(x(u downto u-w+1), tpl.SB7);
         u := u - w;
         w := width(tpl.SB8);
         y.SB8 := convert(x(u downto u-w+1), tpl.SB8);
         u := u - w;
         w := width(tpl.SB9);
         y.SB9 := convert(x(u downto u-w+1), tpl.SB9);
         u := u - w;
         w := width(tpl.SB10);
         y.SB10 := convert(x(u downto u-w+1), tpl.SB10);
         u := u - w;
         w := width(tpl.SB11);
         y.SB11 := convert(x(u downto u-w+1), tpl.SB11);
         u := u - w;
         w := width(tpl.SB12);
         y.SB12 := convert(x(u downto u-w+1), tpl.SB12);
         u := u - w;
         w := width(tpl.SB13);
         y.SB13 := convert(x(u downto u-w+1), tpl.SB13);
         u := u - w;
         w := width(tpl.SB14);
         y.SB14 := convert(x(u downto u-w+1), tpl.SB14);
         u := u - w;
         w := width(tpl.SB15);
         y.SB15 := convert(x(u downto u-w+1), tpl.SB15);
         u := u - w;
         w := width(tpl.SB16);
         y.SB16 := convert(x(u downto u-w+1), tpl.SB16);
         u := u - w;
         w := width(tpl.SB17);
         y.SB17 := convert(x(u downto u-w+1), tpl.SB17);
         u := u - w;
         w := width(tpl.SB18);
         y.SB18 := convert(x(u downto u-w+1), tpl.SB18);
         u := u - w;
         w := width(tpl.SB19);
         y.SB19 := convert(x(u downto u-w+1), tpl.SB19);
         u := u - w;
         w := width(tpl.SB20);
         y.SB20 := convert(x(u downto u-w+1), tpl.SB20);
         u := u - w;
         w := width(tpl.SB21);
         y.SB21 := convert(x(u downto u-w+1), tpl.SB21);
         u := u - w;
         w := width(tpl.SB22);
         y.SB22 := convert(x(u downto u-w+1), tpl.SB22);
         u := u - w;
         w := width(tpl.SB23);
         y.SB23 := convert(x(u downto u-w+1), tpl.SB23);
         u := u - w;
         w := width(tpl.SB24);
         y.SB24 := convert(x(u downto u-w+1), tpl.SB24);
         u := u - w;
         w := width(tpl.SB25);
         y.SB25 := convert(x(u downto u-w+1), tpl.SB25);
         u := u - w;
         w := width(tpl.SB26);
         y.SB26 := convert(x(u downto u-w+1), tpl.SB26);
      end if;
      return y;
   end function convert;
   function zero(tpl: FM_CTRL_t) return FM_CTRL_t is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

end package body FM_CTRL;

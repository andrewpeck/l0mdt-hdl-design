--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.FM_CTRL.all;


package FM_CTRL_DEF is
  constant Default_FM_SB1_SB_MEM_MOSI_t : FM_SB1_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB1_CTRL_t : FM_SB1_CTRL_t := (
                                                     SB_MEM => Default_FM_SB1_SB_MEM_MOSI_t
                                                    );
  constant Default_FM_SB4_SB_MEM_MOSI_t : FM_SB4_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB4_CTRL_t : FM_SB4_CTRL_t := (
                                                     SB_MEM => Default_FM_SB4_SB_MEM_MOSI_t
                                                    );
  constant Default_FM_SB7_SB_MEM_MOSI_t : FM_SB7_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB7_CTRL_t : FM_SB7_CTRL_t := (
                                                     SB_MEM => Default_FM_SB7_SB_MEM_MOSI_t
                                                    );
  constant Default_FM_SB10_SB_MEM_MOSI_t : FM_SB10_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB10_CTRL_t : FM_SB10_CTRL_t := (
                                                       SB_MEM => Default_FM_SB10_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB13_SB_MEM_MOSI_t : FM_SB13_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB13_CTRL_t : FM_SB13_CTRL_t := (
                                                       SB_MEM => Default_FM_SB13_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB16_SB_MEM_MOSI_t : FM_SB16_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB16_CTRL_t : FM_SB16_CTRL_t := (
                                                       SB_MEM => Default_FM_SB16_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB19_SB_MEM_MOSI_t : FM_SB19_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB19_CTRL_t : FM_SB19_CTRL_t := (
                                                       SB_MEM => Default_FM_SB19_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB22_SB_MEM_MOSI_t : FM_SB22_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB22_CTRL_t : FM_SB22_CTRL_t := (
                                                       SB_MEM => Default_FM_SB22_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB25_SB_MEM_MOSI_t : FM_SB25_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB25_CTRL_t : FM_SB25_CTRL_t := (
                                                       SB_MEM => Default_FM_SB25_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB0_SB_MEM_MOSI_t : FM_SB0_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB0_CTRL_t : FM_SB0_CTRL_t := (
                                                     SB_MEM => Default_FM_SB0_SB_MEM_MOSI_t
                                                    );
  constant Default_FM_SB2_SB_MEM_MOSI_t : FM_SB2_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB2_CTRL_t : FM_SB2_CTRL_t := (
                                                     SB_MEM => Default_FM_SB2_SB_MEM_MOSI_t
                                                    );
  constant Default_FM_SB3_SB_MEM_MOSI_t : FM_SB3_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB3_CTRL_t : FM_SB3_CTRL_t := (
                                                     SB_MEM => Default_FM_SB3_SB_MEM_MOSI_t
                                                    );
  constant Default_FM_SB5_SB_MEM_MOSI_t : FM_SB5_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB5_CTRL_t : FM_SB5_CTRL_t := (
                                                     SB_MEM => Default_FM_SB5_SB_MEM_MOSI_t
                                                    );
  constant Default_FM_SB6_SB_MEM_MOSI_t : FM_SB6_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB6_CTRL_t : FM_SB6_CTRL_t := (
                                                     SB_MEM => Default_FM_SB6_SB_MEM_MOSI_t
                                                    );
  constant Default_FM_SB8_SB_MEM_MOSI_t : FM_SB8_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB8_CTRL_t : FM_SB8_CTRL_t := (
                                                     SB_MEM => Default_FM_SB8_SB_MEM_MOSI_t
                                                    );
  constant Default_FM_SB9_SB_MEM_MOSI_t : FM_SB9_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB9_CTRL_t : FM_SB9_CTRL_t := (
                                                     SB_MEM => Default_FM_SB9_SB_MEM_MOSI_t
                                                    );
  constant Default_FM_SB11_SB_MEM_MOSI_t : FM_SB11_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB11_CTRL_t : FM_SB11_CTRL_t := (
                                                       SB_MEM => Default_FM_SB11_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB12_SB_MEM_MOSI_t : FM_SB12_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB12_CTRL_t : FM_SB12_CTRL_t := (
                                                       SB_MEM => Default_FM_SB12_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB14_SB_MEM_MOSI_t : FM_SB14_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB14_CTRL_t : FM_SB14_CTRL_t := (
                                                       SB_MEM => Default_FM_SB14_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB15_SB_MEM_MOSI_t : FM_SB15_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB15_CTRL_t : FM_SB15_CTRL_t := (
                                                       SB_MEM => Default_FM_SB15_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB17_SB_MEM_MOSI_t : FM_SB17_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB17_CTRL_t : FM_SB17_CTRL_t := (
                                                       SB_MEM => Default_FM_SB17_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB18_SB_MEM_MOSI_t : FM_SB18_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB18_CTRL_t : FM_SB18_CTRL_t := (
                                                       SB_MEM => Default_FM_SB18_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB20_SB_MEM_MOSI_t : FM_SB20_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB20_CTRL_t : FM_SB20_CTRL_t := (
                                                       SB_MEM => Default_FM_SB20_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB21_SB_MEM_MOSI_t : FM_SB21_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB21_CTRL_t : FM_SB21_CTRL_t := (
                                                       SB_MEM => Default_FM_SB21_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB23_SB_MEM_MOSI_t : FM_SB23_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB23_CTRL_t : FM_SB23_CTRL_t := (
                                                       SB_MEM => Default_FM_SB23_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB24_SB_MEM_MOSI_t : FM_SB24_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB24_CTRL_t : FM_SB24_CTRL_t := (
                                                       SB_MEM => Default_FM_SB24_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB26_SB_MEM_MOSI_t : FM_SB26_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB26_CTRL_t : FM_SB26_CTRL_t := (
                                                       SB_MEM => Default_FM_SB26_SB_MEM_MOSI_t
                                                      );
  constant DEFAULT_FM_SPY_CTRL_CTRL_t : FM_SPY_CTRL_CTRL_t := (
                                                               GLOBAL_FREEZE => '0',
                                                               GLOBAL_PLAYBACK_MODE => (others => '0'),
                                                               INITIALIZE_SPY_MEMORY => '0'
                                                              );
  constant DEFAULT_FM_CTRL_t : FM_CTRL_t := (
                                             SB1 => DEFAULT_FM_SB1_CTRL_t,
                                             SB4 => DEFAULT_FM_SB4_CTRL_t,
                                             SB7 => DEFAULT_FM_SB7_CTRL_t,
                                             SB10 => DEFAULT_FM_SB10_CTRL_t,
                                             SB13 => DEFAULT_FM_SB13_CTRL_t,
                                             SB16 => DEFAULT_FM_SB16_CTRL_t,
                                             SB19 => DEFAULT_FM_SB19_CTRL_t,
                                             SB22 => DEFAULT_FM_SB22_CTRL_t,
                                             SB25 => DEFAULT_FM_SB25_CTRL_t,
                                             SB0 => DEFAULT_FM_SB0_CTRL_t,
                                             SB2 => DEFAULT_FM_SB2_CTRL_t,
                                             SB3 => DEFAULT_FM_SB3_CTRL_t,
                                             SB5 => DEFAULT_FM_SB5_CTRL_t,
                                             SB6 => DEFAULT_FM_SB6_CTRL_t,
                                             SB8 => DEFAULT_FM_SB8_CTRL_t,
                                             SB9 => DEFAULT_FM_SB9_CTRL_t,
                                             SB11 => DEFAULT_FM_SB11_CTRL_t,
                                             SB12 => DEFAULT_FM_SB12_CTRL_t,
                                             SB14 => DEFAULT_FM_SB14_CTRL_t,
                                             SB15 => DEFAULT_FM_SB15_CTRL_t,
                                             SB17 => DEFAULT_FM_SB17_CTRL_t,
                                             SB18 => DEFAULT_FM_SB18_CTRL_t,
                                             SB20 => DEFAULT_FM_SB20_CTRL_t,
                                             SB21 => DEFAULT_FM_SB21_CTRL_t,
                                             SB23 => DEFAULT_FM_SB23_CTRL_t,
                                             SB24 => DEFAULT_FM_SB24_CTRL_t,
                                             SB26 => DEFAULT_FM_SB26_CTRL_t,
                                             SPY_CTRL => DEFAULT_FM_SPY_CTRL_CTRL_t,
                                             FREEZE_MASK_0 => (others => '0'),
                                             FREEZE_MASK_1 => (others => '0'),
                                             PLAYBACK_MASK_0 => (others => '0'),
                                             PLAYBACK_MASK_1 => (others => '0')
                                            );

end package FM_CTRL_DEF;

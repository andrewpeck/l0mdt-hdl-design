--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.FM_CTRL.all;


package FM_CTRL_DEF is
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
  constant Default_FM_SB27_SB_MEM_MOSI_t : FM_SB27_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB27_CTRL_t : FM_SB27_CTRL_t := (
                                                       SB_MEM => Default_FM_SB27_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB28_SB_MEM_MOSI_t : FM_SB28_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB28_CTRL_t : FM_SB28_CTRL_t := (
                                                       SB_MEM => Default_FM_SB28_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB29_SB_MEM_MOSI_t : FM_SB29_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB29_CTRL_t : FM_SB29_CTRL_t := (
                                                       SB_MEM => Default_FM_SB29_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB30_SB_MEM_MOSI_t : FM_SB30_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB30_CTRL_t : FM_SB30_CTRL_t := (
                                                       SB_MEM => Default_FM_SB30_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB31_SB_MEM_MOSI_t : FM_SB31_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB31_CTRL_t : FM_SB31_CTRL_t := (
                                                       SB_MEM => Default_FM_SB31_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB32_SB_MEM_MOSI_t : FM_SB32_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB32_CTRL_t : FM_SB32_CTRL_t := (
                                                       SB_MEM => Default_FM_SB32_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB33_SB_MEM_MOSI_t : FM_SB33_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB33_CTRL_t : FM_SB33_CTRL_t := (
                                                       SB_MEM => Default_FM_SB33_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB34_SB_MEM_MOSI_t : FM_SB34_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB34_CTRL_t : FM_SB34_CTRL_t := (
                                                       SB_MEM => Default_FM_SB34_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB35_SB_MEM_MOSI_t : FM_SB35_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB35_CTRL_t : FM_SB35_CTRL_t := (
                                                       SB_MEM => Default_FM_SB35_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB36_SB_MEM_MOSI_t : FM_SB36_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB36_CTRL_t : FM_SB36_CTRL_t := (
                                                       SB_MEM => Default_FM_SB36_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB37_SB_MEM_MOSI_t : FM_SB37_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB37_CTRL_t : FM_SB37_CTRL_t := (
                                                       SB_MEM => Default_FM_SB37_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB38_SB_MEM_MOSI_t : FM_SB38_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB38_CTRL_t : FM_SB38_CTRL_t := (
                                                       SB_MEM => Default_FM_SB38_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB39_SB_MEM_MOSI_t : FM_SB39_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB39_CTRL_t : FM_SB39_CTRL_t := (
                                                       SB_MEM => Default_FM_SB39_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB40_SB_MEM_MOSI_t : FM_SB40_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB40_CTRL_t : FM_SB40_CTRL_t := (
                                                       SB_MEM => Default_FM_SB40_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB41_SB_MEM_MOSI_t : FM_SB41_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB41_CTRL_t : FM_SB41_CTRL_t := (
                                                       SB_MEM => Default_FM_SB41_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB42_SB_MEM_MOSI_t : FM_SB42_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB42_CTRL_t : FM_SB42_CTRL_t := (
                                                       SB_MEM => Default_FM_SB42_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB43_SB_MEM_MOSI_t : FM_SB43_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB43_CTRL_t : FM_SB43_CTRL_t := (
                                                       SB_MEM => Default_FM_SB43_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB44_SB_MEM_MOSI_t : FM_SB44_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB44_CTRL_t : FM_SB44_CTRL_t := (
                                                       SB_MEM => Default_FM_SB44_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB45_SB_MEM_MOSI_t : FM_SB45_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB45_CTRL_t : FM_SB45_CTRL_t := (
                                                       SB_MEM => Default_FM_SB45_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB46_SB_MEM_MOSI_t : FM_SB46_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB46_CTRL_t : FM_SB46_CTRL_t := (
                                                       SB_MEM => Default_FM_SB46_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB47_SB_MEM_MOSI_t : FM_SB47_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB47_CTRL_t : FM_SB47_CTRL_t := (
                                                       SB_MEM => Default_FM_SB47_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB48_SB_MEM_MOSI_t : FM_SB48_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB48_CTRL_t : FM_SB48_CTRL_t := (
                                                       SB_MEM => Default_FM_SB48_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB49_SB_MEM_MOSI_t : FM_SB49_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB49_CTRL_t : FM_SB49_CTRL_t := (
                                                       SB_MEM => Default_FM_SB49_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB50_SB_MEM_MOSI_t : FM_SB50_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB50_CTRL_t : FM_SB50_CTRL_t := (
                                                       SB_MEM => Default_FM_SB50_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB51_SB_MEM_MOSI_t : FM_SB51_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB51_CTRL_t : FM_SB51_CTRL_t := (
                                                       SB_MEM => Default_FM_SB51_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB52_SB_MEM_MOSI_t : FM_SB52_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB52_CTRL_t : FM_SB52_CTRL_t := (
                                                       SB_MEM => Default_FM_SB52_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB53_SB_MEM_MOSI_t : FM_SB53_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB53_CTRL_t : FM_SB53_CTRL_t := (
                                                       SB_MEM => Default_FM_SB53_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB54_SB_MEM_MOSI_t : FM_SB54_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB54_CTRL_t : FM_SB54_CTRL_t := (
                                                       SB_MEM => Default_FM_SB54_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB55_SB_MEM_MOSI_t : FM_SB55_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB55_CTRL_t : FM_SB55_CTRL_t := (
                                                       SB_MEM => Default_FM_SB55_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB56_SB_MEM_MOSI_t : FM_SB56_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB56_CTRL_t : FM_SB56_CTRL_t := (
                                                       SB_MEM => Default_FM_SB56_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB57_SB_MEM_MOSI_t : FM_SB57_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB57_CTRL_t : FM_SB57_CTRL_t := (
                                                       SB_MEM => Default_FM_SB57_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB58_SB_MEM_MOSI_t : FM_SB58_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB58_CTRL_t : FM_SB58_CTRL_t := (
                                                       SB_MEM => Default_FM_SB58_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB59_SB_MEM_MOSI_t : FM_SB59_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB59_CTRL_t : FM_SB59_CTRL_t := (
                                                       SB_MEM => Default_FM_SB59_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB60_SB_MEM_MOSI_t : FM_SB60_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB60_CTRL_t : FM_SB60_CTRL_t := (
                                                       SB_MEM => Default_FM_SB60_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB61_SB_MEM_MOSI_t : FM_SB61_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB61_CTRL_t : FM_SB61_CTRL_t := (
                                                       SB_MEM => Default_FM_SB61_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB62_SB_MEM_MOSI_t : FM_SB62_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB62_CTRL_t : FM_SB62_CTRL_t := (
                                                       SB_MEM => Default_FM_SB62_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB63_SB_MEM_MOSI_t : FM_SB63_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB63_CTRL_t : FM_SB63_CTRL_t := (
                                                       SB_MEM => Default_FM_SB63_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB64_SB_MEM_MOSI_t : FM_SB64_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB64_CTRL_t : FM_SB64_CTRL_t := (
                                                       SB_MEM => Default_FM_SB64_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB65_SB_MEM_MOSI_t : FM_SB65_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB65_CTRL_t : FM_SB65_CTRL_t := (
                                                       SB_MEM => Default_FM_SB65_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB66_SB_MEM_MOSI_t : FM_SB66_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB66_CTRL_t : FM_SB66_CTRL_t := (
                                                       SB_MEM => Default_FM_SB66_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB67_SB_MEM_MOSI_t : FM_SB67_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB67_CTRL_t : FM_SB67_CTRL_t := (
                                                       SB_MEM => Default_FM_SB67_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB68_SB_MEM_MOSI_t : FM_SB68_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB68_CTRL_t : FM_SB68_CTRL_t := (
                                                       SB_MEM => Default_FM_SB68_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB69_SB_MEM_MOSI_t : FM_SB69_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB69_CTRL_t : FM_SB69_CTRL_t := (
                                                       SB_MEM => Default_FM_SB69_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB70_SB_MEM_MOSI_t : FM_SB70_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB70_CTRL_t : FM_SB70_CTRL_t := (
                                                       SB_MEM => Default_FM_SB70_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB71_SB_MEM_MOSI_t : FM_SB71_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB71_CTRL_t : FM_SB71_CTRL_t := (
                                                       SB_MEM => Default_FM_SB71_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB72_SB_MEM_MOSI_t : FM_SB72_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB72_CTRL_t : FM_SB72_CTRL_t := (
                                                       SB_MEM => Default_FM_SB72_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB73_SB_MEM_MOSI_t : FM_SB73_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB73_CTRL_t : FM_SB73_CTRL_t := (
                                                       SB_MEM => Default_FM_SB73_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB74_SB_MEM_MOSI_t : FM_SB74_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB74_CTRL_t : FM_SB74_CTRL_t := (
                                                       SB_MEM => Default_FM_SB74_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB75_SB_MEM_MOSI_t : FM_SB75_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB75_CTRL_t : FM_SB75_CTRL_t := (
                                                       SB_MEM => Default_FM_SB75_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB76_SB_MEM_MOSI_t : FM_SB76_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB76_CTRL_t : FM_SB76_CTRL_t := (
                                                       SB_MEM => Default_FM_SB76_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB77_SB_MEM_MOSI_t : FM_SB77_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB77_CTRL_t : FM_SB77_CTRL_t := (
                                                       SB_MEM => Default_FM_SB77_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB78_SB_MEM_MOSI_t : FM_SB78_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB78_CTRL_t : FM_SB78_CTRL_t := (
                                                       SB_MEM => Default_FM_SB78_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB79_SB_MEM_MOSI_t : FM_SB79_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB79_CTRL_t : FM_SB79_CTRL_t := (
                                                       SB_MEM => Default_FM_SB79_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB80_SB_MEM_MOSI_t : FM_SB80_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB80_CTRL_t : FM_SB80_CTRL_t := (
                                                       SB_MEM => Default_FM_SB80_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB81_SB_MEM_MOSI_t : FM_SB81_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB81_CTRL_t : FM_SB81_CTRL_t := (
                                                       SB_MEM => Default_FM_SB81_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB82_SB_MEM_MOSI_t : FM_SB82_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB82_CTRL_t : FM_SB82_CTRL_t := (
                                                       SB_MEM => Default_FM_SB82_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB83_SB_MEM_MOSI_t : FM_SB83_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB83_CTRL_t : FM_SB83_CTRL_t := (
                                                       SB_MEM => Default_FM_SB83_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB84_SB_MEM_MOSI_t : FM_SB84_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB84_CTRL_t : FM_SB84_CTRL_t := (
                                                       SB_MEM => Default_FM_SB84_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB85_SB_MEM_MOSI_t : FM_SB85_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB85_CTRL_t : FM_SB85_CTRL_t := (
                                                       SB_MEM => Default_FM_SB85_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB86_SB_MEM_MOSI_t : FM_SB86_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB86_CTRL_t : FM_SB86_CTRL_t := (
                                                       SB_MEM => Default_FM_SB86_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB87_SB_MEM_MOSI_t : FM_SB87_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB87_CTRL_t : FM_SB87_CTRL_t := (
                                                       SB_MEM => Default_FM_SB87_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB88_SB_MEM_MOSI_t : FM_SB88_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB88_CTRL_t : FM_SB88_CTRL_t := (
                                                       SB_MEM => Default_FM_SB88_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB89_SB_MEM_MOSI_t : FM_SB89_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB89_CTRL_t : FM_SB89_CTRL_t := (
                                                       SB_MEM => Default_FM_SB89_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB90_SB_MEM_MOSI_t : FM_SB90_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB90_CTRL_t : FM_SB90_CTRL_t := (
                                                       SB_MEM => Default_FM_SB90_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB91_SB_MEM_MOSI_t : FM_SB91_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB91_CTRL_t : FM_SB91_CTRL_t := (
                                                       SB_MEM => Default_FM_SB91_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB92_SB_MEM_MOSI_t : FM_SB92_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB92_CTRL_t : FM_SB92_CTRL_t := (
                                                       SB_MEM => Default_FM_SB92_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB93_SB_MEM_MOSI_t : FM_SB93_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB93_CTRL_t : FM_SB93_CTRL_t := (
                                                       SB_MEM => Default_FM_SB93_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB94_SB_MEM_MOSI_t : FM_SB94_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB94_CTRL_t : FM_SB94_CTRL_t := (
                                                       SB_MEM => Default_FM_SB94_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB95_SB_MEM_MOSI_t : FM_SB95_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB95_CTRL_t : FM_SB95_CTRL_t := (
                                                       SB_MEM => Default_FM_SB95_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB96_SB_MEM_MOSI_t : FM_SB96_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB96_CTRL_t : FM_SB96_CTRL_t := (
                                                       SB_MEM => Default_FM_SB96_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB97_SB_MEM_MOSI_t : FM_SB97_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB97_CTRL_t : FM_SB97_CTRL_t := (
                                                       SB_MEM => Default_FM_SB97_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB98_SB_MEM_MOSI_t : FM_SB98_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB98_CTRL_t : FM_SB98_CTRL_t := (
                                                       SB_MEM => Default_FM_SB98_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB99_SB_MEM_MOSI_t : FM_SB99_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB99_CTRL_t : FM_SB99_CTRL_t := (
                                                       SB_MEM => Default_FM_SB99_SB_MEM_MOSI_t
                                                      );
  constant Default_FM_SB100_SB_MEM_MOSI_t : FM_SB100_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB100_CTRL_t : FM_SB100_CTRL_t := (
                                                         SB_MEM => Default_FM_SB100_SB_MEM_MOSI_t
                                                        );
  constant Default_FM_SB101_SB_MEM_MOSI_t : FM_SB101_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB101_CTRL_t : FM_SB101_CTRL_t := (
                                                         SB_MEM => Default_FM_SB101_SB_MEM_MOSI_t
                                                        );
  constant Default_FM_SB102_SB_MEM_MOSI_t : FM_SB102_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB102_CTRL_t : FM_SB102_CTRL_t := (
                                                         SB_MEM => Default_FM_SB102_SB_MEM_MOSI_t
                                                        );
  constant Default_FM_SB103_SB_MEM_MOSI_t : FM_SB103_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB103_CTRL_t : FM_SB103_CTRL_t := (
                                                         SB_MEM => Default_FM_SB103_SB_MEM_MOSI_t
                                                        );
  constant Default_FM_SB104_SB_MEM_MOSI_t : FM_SB104_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB104_CTRL_t : FM_SB104_CTRL_t := (
                                                         SB_MEM => Default_FM_SB104_SB_MEM_MOSI_t
                                                        );
  constant Default_FM_SB105_SB_MEM_MOSI_t : FM_SB105_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB105_CTRL_t : FM_SB105_CTRL_t := (
                                                         SB_MEM => Default_FM_SB105_SB_MEM_MOSI_t
                                                        );
  constant Default_FM_SB106_SB_MEM_MOSI_t : FM_SB106_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB106_CTRL_t : FM_SB106_CTRL_t := (
                                                         SB_MEM => Default_FM_SB106_SB_MEM_MOSI_t
                                                        );
  constant Default_FM_SB107_SB_MEM_MOSI_t : FM_SB107_SB_MEM_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_FM_SB107_CTRL_t : FM_SB107_CTRL_t := (
                                                         SB_MEM => Default_FM_SB107_SB_MEM_MOSI_t
                                                        );
  constant DEFAULT_FM_SPY_CTRL_CTRL_t : FM_SPY_CTRL_CTRL_t := (
                                                               GLOBAL_FREEZE => '1',
                                                               GLOBAL_PLAYBACK_MODE => "00",
                                                               INITIALIZE_SPY_MEMORY => '1'
                                                              );
  constant DEFAULT_FM_CTRL_t : FM_CTRL_t := (
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
                                             SB26 => DEFAULT_FM_SB26_CTRL_t,
                                             SB27 => DEFAULT_FM_SB27_CTRL_t,
                                             SB28 => DEFAULT_FM_SB28_CTRL_t,
                                             SB29 => DEFAULT_FM_SB29_CTRL_t,
                                             SB30 => DEFAULT_FM_SB30_CTRL_t,
                                             SB31 => DEFAULT_FM_SB31_CTRL_t,
                                             SB32 => DEFAULT_FM_SB32_CTRL_t,
                                             SB33 => DEFAULT_FM_SB33_CTRL_t,
                                             SB34 => DEFAULT_FM_SB34_CTRL_t,
                                             SB35 => DEFAULT_FM_SB35_CTRL_t,
                                             SB36 => DEFAULT_FM_SB36_CTRL_t,
                                             SB37 => DEFAULT_FM_SB37_CTRL_t,
                                             SB38 => DEFAULT_FM_SB38_CTRL_t,
                                             SB39 => DEFAULT_FM_SB39_CTRL_t,
                                             SB40 => DEFAULT_FM_SB40_CTRL_t,
                                             SB41 => DEFAULT_FM_SB41_CTRL_t,
                                             SB42 => DEFAULT_FM_SB42_CTRL_t,
                                             SB43 => DEFAULT_FM_SB43_CTRL_t,
                                             SB44 => DEFAULT_FM_SB44_CTRL_t,
                                             SB45 => DEFAULT_FM_SB45_CTRL_t,
                                             SB46 => DEFAULT_FM_SB46_CTRL_t,
                                             SB47 => DEFAULT_FM_SB47_CTRL_t,
                                             SB48 => DEFAULT_FM_SB48_CTRL_t,
                                             SB49 => DEFAULT_FM_SB49_CTRL_t,
                                             SB50 => DEFAULT_FM_SB50_CTRL_t,
                                             SB51 => DEFAULT_FM_SB51_CTRL_t,
                                             SB52 => DEFAULT_FM_SB52_CTRL_t,
                                             SB53 => DEFAULT_FM_SB53_CTRL_t,
                                             SB54 => DEFAULT_FM_SB54_CTRL_t,
                                             SB55 => DEFAULT_FM_SB55_CTRL_t,
                                             SB56 => DEFAULT_FM_SB56_CTRL_t,
                                             SB57 => DEFAULT_FM_SB57_CTRL_t,
                                             SB58 => DEFAULT_FM_SB58_CTRL_t,
                                             SB59 => DEFAULT_FM_SB59_CTRL_t,
                                             SB60 => DEFAULT_FM_SB60_CTRL_t,
                                             SB61 => DEFAULT_FM_SB61_CTRL_t,
                                             SB62 => DEFAULT_FM_SB62_CTRL_t,
                                             SB63 => DEFAULT_FM_SB63_CTRL_t,
                                             SB64 => DEFAULT_FM_SB64_CTRL_t,
                                             SB65 => DEFAULT_FM_SB65_CTRL_t,
                                             SB66 => DEFAULT_FM_SB66_CTRL_t,
                                             SB67 => DEFAULT_FM_SB67_CTRL_t,
                                             SB68 => DEFAULT_FM_SB68_CTRL_t,
                                             SB69 => DEFAULT_FM_SB69_CTRL_t,
                                             SB70 => DEFAULT_FM_SB70_CTRL_t,
                                             SB71 => DEFAULT_FM_SB71_CTRL_t,
                                             SB72 => DEFAULT_FM_SB72_CTRL_t,
                                             SB73 => DEFAULT_FM_SB73_CTRL_t,
                                             SB74 => DEFAULT_FM_SB74_CTRL_t,
                                             SB75 => DEFAULT_FM_SB75_CTRL_t,
                                             SB76 => DEFAULT_FM_SB76_CTRL_t,
                                             SB77 => DEFAULT_FM_SB77_CTRL_t,
                                             SB78 => DEFAULT_FM_SB78_CTRL_t,
                                             SB79 => DEFAULT_FM_SB79_CTRL_t,
                                             SB80 => DEFAULT_FM_SB80_CTRL_t,
                                             SB81 => DEFAULT_FM_SB81_CTRL_t,
                                             SB82 => DEFAULT_FM_SB82_CTRL_t,
                                             SB83 => DEFAULT_FM_SB83_CTRL_t,
                                             SB84 => DEFAULT_FM_SB84_CTRL_t,
                                             SB85 => DEFAULT_FM_SB85_CTRL_t,
                                             SB86 => DEFAULT_FM_SB86_CTRL_t,
                                             SB87 => DEFAULT_FM_SB87_CTRL_t,
                                             SB88 => DEFAULT_FM_SB88_CTRL_t,
                                             SB89 => DEFAULT_FM_SB89_CTRL_t,
                                             SB90 => DEFAULT_FM_SB90_CTRL_t,
                                             SB91 => DEFAULT_FM_SB91_CTRL_t,
                                             SB92 => DEFAULT_FM_SB92_CTRL_t,
                                             SB93 => DEFAULT_FM_SB93_CTRL_t,
                                             SB94 => DEFAULT_FM_SB94_CTRL_t,
                                             SB95 => DEFAULT_FM_SB95_CTRL_t,
                                             SB96 => DEFAULT_FM_SB96_CTRL_t,
                                             SB97 => DEFAULT_FM_SB97_CTRL_t,
                                             SB98 => DEFAULT_FM_SB98_CTRL_t,
                                             SB99 => DEFAULT_FM_SB99_CTRL_t,
                                             SB100 => DEFAULT_FM_SB100_CTRL_t,
                                             SB101 => DEFAULT_FM_SB101_CTRL_t,
                                             SB102 => DEFAULT_FM_SB102_CTRL_t,
                                             SB103 => DEFAULT_FM_SB103_CTRL_t,
                                             SB104 => DEFAULT_FM_SB104_CTRL_t,
                                             SB105 => DEFAULT_FM_SB105_CTRL_t,
                                             SB106 => DEFAULT_FM_SB106_CTRL_t,
                                             SB107 => DEFAULT_FM_SB107_CTRL_t,
                                             SPY_CTRL => DEFAULT_FM_SPY_CTRL_CTRL_t,
                                             FREEZE_MASK_0 => x"00000000",
                                             FREEZE_MASK_1 => x"00000000",
                                             FREEZE_MASK_2 => x"00000000",
                                             FREEZE_MASK_3 => x"00000000",
                                             PLAYBACK_MASK_0 => x"ffffffff",
                                             PLAYBACK_MASK_1 => x"ffffffff",
                                             PLAYBACK_MASK_2 => x"ffffffff",
                                             PLAYBACK_MASK_3 => x"ffffffff",
                                             SB_RESET_0 => x"00000000",
                                             SB_RESET_1 => x"00000000",
                                             SB_RESET_2 => x"00000000",
                                             SB_RESET_3 => x"00000000"
                                            );

end package FM_CTRL_DEF;

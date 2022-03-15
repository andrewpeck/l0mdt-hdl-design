--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.FM_CTRL.all;


package FM_CTRL_DEF is
  constant DEFAULT_FM_SPY_CTRL_CTRL_t : FM_SPY_CTRL_CTRL_t := (
                                                               GLOBAL_FREEZE => '0',
                                                               GLOBAL_PLAYBACK_MODE => (others => '0')
                                                              );
  constant DEFAULT_FM_CTRL_t : FM_CTRL_t := (
                                             SPY_CTRL => DEFAULT_FM_SPY_CTRL_CTRL_t,
                                             FREEZE_MASK_0 => (others => '0'),
                                             FREEZE_MASK_1 => (others => '0'),
                                             PLAYBACK_MASK_0 => (others => '0'),
                                             PLAYBACK_MASK_1 => (others => '0')
                                            );

end package FM_CTRL_DEF;

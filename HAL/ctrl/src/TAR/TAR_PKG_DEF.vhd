--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.TAR_CTRL.all;


package TAR_CTRL_DEF is
  constant DEFAULT_TAR_ACTIONS_CTRL_t : TAR_ACTIONS_CTRL_t := (
                                                               RESET => '0',
                                                               ENABLE => '0',
                                                               DISABLE => '0',
                                                               FREEZE => '0'
                                                              );
  constant DEFAULT_TAR_CONFIGS_CTRL_t : TAR_CONFIGS_CTRL_t := (
                                                               INPUT_EN => '1',
                                                               OUTPUT_EN => '1',
                                                               FLUSH_MEM_RESET => '1'
                                                              );
  constant DEFAULT_TAR_CTRL_t : TAR_CTRL_t := (
                                               ACTIONS => DEFAULT_TAR_ACTIONS_CTRL_t,
                                               CONFIGS => DEFAULT_TAR_CONFIGS_CTRL_t
                                              );

end package TAR_CTRL_DEF;

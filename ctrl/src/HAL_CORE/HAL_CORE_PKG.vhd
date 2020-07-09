--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package HAL_CORE_CTRL is
  type HAL_CORE_CLOCKING_MON_t is record
    MMCM_LOCKED                :std_logic;   
    CLK_PHASE_OUTOFSYNC        :std_logic;   
  end record HAL_CORE_CLOCKING_MON_t;


  type HAL_CORE_CLOCKING_CTRL_t is record
    RESET_MMCM                 :std_logic;   
    SELECT_FELIX_CLK           :std_logic;   
    RESYNC_CLK_PHASE           :std_logic;   
  end record HAL_CORE_CLOCKING_CTRL_t;


  constant DEFAULT_HAL_CORE_CLOCKING_CTRL_t : HAL_CORE_CLOCKING_CTRL_t := (
                                                                           RESET_MMCM => '0',
                                                                           SELECT_FELIX_CLK => '0',
                                                                           RESYNC_CLK_PHASE => '0'
                                                                          );
  type HAL_CORE_MON_t is record
    CLOCKING                   :HAL_CORE_CLOCKING_MON_t;
  end record HAL_CORE_MON_t;


  type HAL_CORE_CTRL_t is record
    CLOCKING                   :HAL_CORE_CLOCKING_CTRL_t;
  end record HAL_CORE_CTRL_t;


  constant DEFAULT_HAL_CORE_CTRL_t : HAL_CORE_CTRL_t := (
                                                         CLOCKING => DEFAULT_HAL_CORE_CLOCKING_CTRL_t
                                                        );


end package HAL_CORE_CTRL;
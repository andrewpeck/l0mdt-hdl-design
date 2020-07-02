--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package HAL_CTRL is
  type HAL_CLOCKING_MON_t is record
    MMCM_LOCKED                :std_logic;   
  end record HAL_CLOCKING_MON_t;


  type HAL_MON_t is record
    CLOCKING                   :HAL_CLOCKING_MON_t;
  end record HAL_MON_t;




end package HAL_CTRL;
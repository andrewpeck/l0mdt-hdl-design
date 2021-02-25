--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package MPL_CTRL is
  type MPL_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record MPL_MON_t;


  type MPL_CTRL_t is record
    RESET                      :std_logic;   
  end record MPL_CTRL_t;


  constant DEFAULT_MPL_CTRL_t : MPL_CTRL_t := (
                                               RESET => '0'
                                              );


end package MPL_CTRL;
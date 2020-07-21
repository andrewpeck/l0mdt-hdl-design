--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package UCM_CTRL is
  type UCM_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record UCM_MON_t;


  type UCM_CTRL_t is record
    RESET                      :std_logic;   
  end record UCM_CTRL_t;


  constant DEFAULT_UCM_CTRL_t : UCM_CTRL_t := (
                                               RESET => '0'
                                              );


end package UCM_CTRL;
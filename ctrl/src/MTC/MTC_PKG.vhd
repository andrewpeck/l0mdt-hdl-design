--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package MTC_CTRL is
  type MTC_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record MTC_MON_t;


  type MTC_CTRL_t is record
    RESET                      :std_logic;   
  end record MTC_CTRL_t;


  constant DEFAULT_MTC_CTRL_t : MTC_CTRL_t := (
                                               RESET => '0'
                                              );


end package MTC_CTRL;
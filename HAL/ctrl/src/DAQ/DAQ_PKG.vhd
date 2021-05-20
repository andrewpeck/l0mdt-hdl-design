--This file was auto-generated.
--Modifications might be lost.
-- Created : 2021-04-01 21:30:40.965387.
library IEEE;
use IEEE.std_logic_1164.all;

library shared_lib;
use shared_lib.common_ieee.all;


package DAQ_CTRL is
  type DAQ_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record DAQ_MON_t;


  type DAQ_CTRL_t is record
    RESET                      :std_logic;   
  end record DAQ_CTRL_t;


  constant DEFAULT_DAQ_CTRL_t : DAQ_CTRL_t := (
                                               RESET => '0'
                                              );


end package DAQ_CTRL;
--This file was auto-generated.
--Modifications might be lost.
-- Created : 2021-04-01 21:30:40.773257.
library IEEE;
use IEEE.std_logic_1164.all;

library shared_lib;
use shared_lib.common_ieee.all;


package TAR_CTRL is
  type TAR_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record TAR_MON_t;


  type TAR_CTRL_t is record
    RESET                      :std_logic;   
  end record TAR_CTRL_t;


  constant DEFAULT_TAR_CTRL_t : TAR_CTRL_t := (
                                               RESET => '0'
                                              );


end package TAR_CTRL;
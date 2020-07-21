--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package TF_CTRL is
  type TF_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record TF_MON_t;


  type TF_CTRL_t is record
    RESET                      :std_logic;   
  end record TF_CTRL_t;


  constant DEFAULT_TF_CTRL_t : TF_CTRL_t := (
                                             RESET => '0'
                                            );


end package TF_CTRL;
--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package KINTEX_SYS_MGMT_CTRL is
  type KINTEX_SYS_MGMT_MON_t is record
    TEMP                       : std_logic_vector( 9 downto  0);
    TEMP_MAX                   : std_logic_vector( 9 downto  0);
    TEMP_MIN                   : std_logic_vector( 9 downto  0);
    VCCAUX                     : std_logic_vector( 9 downto  0);
    VCCAUX_MAX                 : std_logic_vector( 9 downto  0);
    VCCAUX_MIN                 : std_logic_vector( 9 downto  0);
    VCCBRAM                    : std_logic_vector( 9 downto  0);
    VCCBRAM_MAX                : std_logic_vector( 9 downto  0);
    VCCBRAM_MIN                : std_logic_vector( 9 downto  0);
    VCCINT                     : std_logic_vector( 9 downto  0);
    VCCINT_MAX                 : std_logic_vector( 9 downto  0);
    VCCINT_MIN                 : std_logic_vector( 9 downto  0);
  end record KINTEX_SYS_MGMT_MON_t;



end package KINTEX_SYS_MGMT_CTRL;
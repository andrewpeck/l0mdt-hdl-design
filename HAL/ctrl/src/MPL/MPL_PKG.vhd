--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package MPL_CTRL is
  type MPL_ACTIONS_CTRL_t is record
    RESET                      :std_logic;   
    ENABLE                     :std_logic;   
    DISABLE                    :std_logic;   
  end record MPL_ACTIONS_CTRL_t;


  constant DEFAULT_MPL_ACTIONS_CTRL_t : MPL_ACTIONS_CTRL_t := (
                                                               RESET => '0',
                                                               DISABLE => '0',
                                                               ENABLE => '0'
                                                              );
  type MPL_CONFIGS_CTRL_t is record
    THREADS                    :std_logic_vector( 3 downto 0);
    INPUT_EN                   :std_logic;                    
    OUTPUT_EN                  :std_logic;                    
    FLUSH_MEM_RESET            :std_logic;                    
  end record MPL_CONFIGS_CTRL_t;


  constant DEFAULT_MPL_CONFIGS_CTRL_t : MPL_CONFIGS_CTRL_t := (
                                                               INPUT_EN => '1',
                                                               THREADS => x"3",
                                                               OUTPUT_EN => '1',
                                                               FLUSH_MEM_RESET => '1'
                                                              );
  type MPL_STATUS_MON_t is record
    G_ENABLED                  :std_logic;   
    G_READY                    :std_logic;   
    G_ERROR                    :std_logic;   
  end record MPL_STATUS_MON_t;


  type MPL_MON_t is record
    STATUS                     :MPL_STATUS_MON_t;
  end record MPL_MON_t;


  type MPL_CTRL_t is record
    ACTIONS                    :MPL_ACTIONS_CTRL_t;
    CONFIGS                    :MPL_CONFIGS_CTRL_t;
  end record MPL_CTRL_t;


  constant DEFAULT_MPL_CTRL_t : MPL_CTRL_t := (
                                               CONFIGS => DEFAULT_MPL_CONFIGS_CTRL_t,
                                               ACTIONS => DEFAULT_MPL_ACTIONS_CTRL_t
                                              );


end package MPL_CTRL;
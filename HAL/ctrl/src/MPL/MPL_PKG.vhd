--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package MPL_CTRL is
  type MPL_ACTIONS_CTRL_t is record
    RESET                      :std_logic;   
    ENABLE                     :std_logic;   
    DISABLE                    :std_logic;   
    FREEZE                     :std_logic;   
  end record MPL_ACTIONS_CTRL_t;


  constant DEFAULT_MPL_ACTIONS_CTRL_t : MPL_ACTIONS_CTRL_t := (
                                                               RESET => '0',
                                                               DISABLE => '0',
                                                               ENABLE => '0',
                                                               FREEZE => '0'
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
    ENABLED                    :std_logic;   
    READY                      :std_logic;   
    ERROR                      :std_logic;   
  end record MPL_STATUS_MON_t;


  type MPL_PL_MEM_PL_MEM_MON_t is record
    rd_rdy                     :std_logic;     -- Read ready
    rd_data_0                  :std_logic_vector(31 downto 0);  -- Read Data 0
    rd_data_1                  :std_logic_vector(31 downto 0);  -- Read Data 1
    rd_data_2                  :std_logic_vector(31 downto 0);  -- Read Data 2
    rd_data_3                  :std_logic_vector(31 downto 0);  -- Read Data 3
    rd_data_4                  :std_logic_vector(19 downto 0);  -- Read Data 4
  end record MPL_PL_MEM_PL_MEM_MON_t;
  type MPL_PL_MEM_PL_MEM_MON_t_ARRAY is array(0 to 4) of MPL_PL_MEM_PL_MEM_MON_t;

  type MPL_PL_MEM_PL_MEM_CTRL_t is record
    wr_req                     :std_logic;     -- Write Enable
    rd_ack                     :std_logic;     -- Read Ack
    wr_addr                    :std_logic_vector( 9 downto 0);  -- wr_Address
    rd_addr                    :std_logic_vector( 9 downto 0);  -- rd_Address
    wr_data_0                  :std_logic_vector(31 downto 0);  -- Write Data 0
    wr_data_1                  :std_logic_vector(31 downto 0);  -- Write Data 1
    wr_data_2                  :std_logic_vector(31 downto 0);  -- Write Data 2
    wr_data_3                  :std_logic_vector(31 downto 0);  -- Write Data 3
    wr_data_4                  :std_logic_vector(19 downto 0);  -- Write Data 4
  end record MPL_PL_MEM_PL_MEM_CTRL_t;
  type MPL_PL_MEM_PL_MEM_CTRL_t_ARRAY is array(0 to 4) of MPL_PL_MEM_PL_MEM_CTRL_t;

  constant DEFAULT_MPL_PL_MEM_PL_MEM_CTRL_t : MPL_PL_MEM_PL_MEM_CTRL_t := (
                                                                           wr_req => '0',
                                                                           wr_addr => (others => '0'),
                                                                           wr_data_3 => (others => '0'),
                                                                           rd_ack => '0',
                                                                           wr_data_1 => (others => '0'),
                                                                           wr_data_4 => (others => '0'),
                                                                           wr_data_2 => (others => '0'),
                                                                           rd_addr => (others => '0'),
                                                                           wr_data_0 => (others => '0')
                                                                          );
  type MPL_PL_MEM_MON_t is record
    PL_MEM                     :MPL_PL_MEM_PL_MEM_MON_t_ARRAY;
  end record MPL_PL_MEM_MON_t;


  type MPL_PL_MEM_CTRL_t is record
    PL_MEM                     :MPL_PL_MEM_PL_MEM_CTRL_t_ARRAY;
  end record MPL_PL_MEM_CTRL_t;


  constant DEFAULT_MPL_PL_MEM_CTRL_t : MPL_PL_MEM_CTRL_t := (
                                                             PL_MEM => (others => DEFAULT_MPL_PL_MEM_PL_MEM_CTRL_t )
                                                            );
  type MPL_MON_t is record
    STATUS                     :MPL_STATUS_MON_t;
    PL_MEM                     :MPL_PL_MEM_MON_t;
  end record MPL_MON_t;


  type MPL_CTRL_t is record
    ACTIONS                    :MPL_ACTIONS_CTRL_t;
    CONFIGS                    :MPL_CONFIGS_CTRL_t;
    PL_MEM                     :MPL_PL_MEM_CTRL_t; 
  end record MPL_CTRL_t;


  constant DEFAULT_MPL_CTRL_t : MPL_CTRL_t := (
                                               PL_MEM => DEFAULT_MPL_PL_MEM_CTRL_t,
                                               CONFIGS => DEFAULT_MPL_CONFIGS_CTRL_t,
                                               ACTIONS => DEFAULT_MPL_ACTIONS_CTRL_t
                                              );


end package MPL_CTRL;
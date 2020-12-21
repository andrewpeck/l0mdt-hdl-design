--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package UCM_CTRL is
  type UCM_ACTIONS_CTRL_t is record
    RESET                      :std_logic;   
    ENABLE                     :std_logic;   
    DISABLE                    :std_logic;   
    THREADS                    :std_logic_vector( 3 downto 0);
  end record UCM_ACTIONS_CTRL_t;


  constant DEFAULT_UCM_ACTIONS_CTRL_t : UCM_ACTIONS_CTRL_t := (
                                                               RESET => '0',
                                                               DISABLE => '0',
                                                               ENABLE => '0',
                                                               THREADS => (others => '0')
                                                              );
  type UCM_STATUS_MON_t is record
    STATUS_ENABLED             :std_logic;   
    STATUS_READY               :std_logic;   
    STATUS_ERROR               :std_logic;   
  end record UCM_STATUS_MON_t;


  type UCM_MON_t is record
    STATUS                     :UCM_STATUS_MON_t;
  end record UCM_MON_t;


  type UCM_CTRL_t is record
    ACTIONS                    :UCM_ACTIONS_CTRL_t;
    PHICENTER0                 :std_logic_vector(31 downto 0);  -- Phi to Center of chamber
    PHICENTER1                 :std_logic_vector(31 downto 0);  -- Phi to Center of chamber
    PHICENTER2                 :std_logic_vector(31 downto 0);  -- Phi to Center of chamber
    PHICENTER3                 :std_logic_vector(31 downto 0);  -- Phi to Center of chamber
    PHICENTER4                 :std_logic_vector(31 downto 0);  -- Phi to Center of chamber
    PHICENTER5                 :std_logic_vector(31 downto 0);  -- Phi to Center of chamber
    PHICENTER6                 :std_logic_vector(31 downto 0);  -- Phi to Center of chamber
    PHICENTER7                 :std_logic_vector(31 downto 0);  -- Phi to Center of chamber
    MODE                       :std_logic_vector(15 downto 0);  -- Module 16 bit mode
  end record UCM_CTRL_t;


  constant DEFAULT_UCM_CTRL_t : UCM_CTRL_t := (
                                               PHICENTER4 => (others => '0'),
                                               PHICENTER5 => (others => '0'),
                                               PHICENTER6 => (others => '0'),
                                               PHICENTER7 => (others => '0'),
                                               PHICENTER0 => (others => '0'),
                                               ACTIONS => DEFAULT_UCM_ACTIONS_CTRL_t,
                                               PHICENTER2 => (others => '0'),
                                               PHICENTER3 => (others => '0'),
                                               PHICENTER1 => (others => '0'),
                                               MODE => (others => '0')
                                              );


end package UCM_CTRL;
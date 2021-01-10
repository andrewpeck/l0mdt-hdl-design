--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package UCM_CTRL is
  type UCM_ACTIONS_CTRL_t is record
    RESET                      :std_logic;   
    ENABLE                     :std_logic;   
    DISABLE                    :std_logic;   
  end record UCM_ACTIONS_CTRL_t;


  constant DEFAULT_UCM_ACTIONS_CTRL_t : UCM_ACTIONS_CTRL_t := (
                                                               RESET => '0',
                                                               DISABLE => '0',
                                                               ENABLE => '0'
                                                              );
  type UCM_CONFIGS_CTRL_t is record
    THREADS                    :std_logic_vector( 3 downto 0);
    INPUT_EN                   :std_logic;                    
    OUTPUT_EN                  :std_logic;                    
  end record UCM_CONFIGS_CTRL_t;


  constant DEFAULT_UCM_CONFIGS_CTRL_t : UCM_CONFIGS_CTRL_t := (
                                                               INPUT_EN => '1',
                                                               THREADS => x"3",
                                                               OUTPUT_EN => '1'
                                                              );
  type UCM_STATUS_MON_t is record
    MAIN_ENABLED               :std_logic;   
    MAIN_READY                 :std_logic;   
    MAIN_ERROR                 :std_logic;   
  end record UCM_STATUS_MON_t;


  type UCM_SECTOR_PHI_CTRL_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- Phi to Center of chamber
    OVERRIDE                   :std_logic;                      -- Phi to Center of chamber
  end record UCM_SECTOR_PHI_CTRL_t;


  constant DEFAULT_UCM_SECTOR_PHI_CTRL_t : UCM_SECTOR_PHI_CTRL_t := (
                                                                     OVERRIDE => '0',
                                                                     VALUE => x"0000"
                                                                    );
  type UCM_IETA_CALC_WR_CTRL_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- Phi to Center of chamber
    ADDR                       :std_logic_vector( 7 downto 0);  -- Phi to Center of chamber
    WR_EN                      :std_logic;                      -- Phi to Center of chamber
  end record UCM_IETA_CALC_WR_CTRL_t;


  constant DEFAULT_UCM_IETA_CALC_WR_CTRL_t : UCM_IETA_CALC_WR_CTRL_t := (
                                                                         WR_EN => '0',
                                                                         ADDR => (others => '0'),
                                                                         VALUE => (others => '0')
                                                                        );
  type UCM_IETA_CALC_RD_MON_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- Phi to Center of chamber
    RST_REQ                    :std_logic;                      -- Phi to Center of chamber
  end record UCM_IETA_CALC_RD_MON_t;


  type UCM_MON_t is record
    STATUS                     :UCM_STATUS_MON_t;
    IETA_CALC_RD               :UCM_IETA_CALC_RD_MON_t;
  end record UCM_MON_t;


  type UCM_CTRL_t is record
    ACTIONS                    :UCM_ACTIONS_CTRL_t;
    CONFIGS                    :UCM_CONFIGS_CTRL_t;
    SECTOR_PHI                 :UCM_SECTOR_PHI_CTRL_t;
    IETA_CALC_WR               :UCM_IETA_CALC_WR_CTRL_t;
  end record UCM_CTRL_t;


  constant DEFAULT_UCM_CTRL_t : UCM_CTRL_t := (
                                               CONFIGS => DEFAULT_UCM_CONFIGS_CTRL_t,
                                               IETA_CALC_WR => DEFAULT_UCM_IETA_CALC_WR_CTRL_t,
                                               SECTOR_PHI => DEFAULT_UCM_SECTOR_PHI_CTRL_t,
                                               ACTIONS => DEFAULT_UCM_ACTIONS_CTRL_t
                                              );


end package UCM_CTRL;
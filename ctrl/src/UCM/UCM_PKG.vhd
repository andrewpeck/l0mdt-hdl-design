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
  type UCM_CHAMBER_Z0_INN_CALC_WR_CTRL_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- New value to write
    ADDR                       :std_logic_vector( 7 downto 0);  -- position or chamber to r/w value
    WR_EN                      :std_logic;                      -- Write Enable
  end record UCM_CHAMBER_Z0_INN_CALC_WR_CTRL_t;


  constant DEFAULT_UCM_CHAMBER_Z0_INN_CALC_WR_CTRL_t : UCM_CHAMBER_Z0_INN_CALC_WR_CTRL_t := (
                                                                                             WR_EN => '0',
                                                                                             ADDR => (others => '0'),
                                                                                             VALUE => (others => '0')
                                                                                            );
  type UCM_CHAMBER_Z0_INN_CALC_RD_MON_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- Read Value id position selected
    RST_REQ                    :std_logic;                      -- Reset request after changes in the mem
  end record UCM_CHAMBER_Z0_INN_CALC_RD_MON_t;


  type UCM_CHAMBER_Z0_INN_MON_t is record
    CALC_RD                    :UCM_CHAMBER_Z0_INN_CALC_RD_MON_t;
  end record UCM_CHAMBER_Z0_INN_MON_t;


  type UCM_CHAMBER_Z0_INN_CTRL_t is record
    CALC_WR                    :UCM_CHAMBER_Z0_INN_CALC_WR_CTRL_t;
  end record UCM_CHAMBER_Z0_INN_CTRL_t;


  constant DEFAULT_UCM_CHAMBER_Z0_INN_CTRL_t : UCM_CHAMBER_Z0_INN_CTRL_t := (
                                                                             CALC_WR => DEFAULT_UCM_CHAMBER_Z0_INN_CALC_WR_CTRL_t
                                                                            );
  type UCM_CHAMBER_Z0_MID_CALC_WR_CTRL_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- New value to write
    ADDR                       :std_logic_vector( 7 downto 0);  -- position or chamber to r/w value
    WR_EN                      :std_logic;                      -- Write Enable
  end record UCM_CHAMBER_Z0_MID_CALC_WR_CTRL_t;


  constant DEFAULT_UCM_CHAMBER_Z0_MID_CALC_WR_CTRL_t : UCM_CHAMBER_Z0_MID_CALC_WR_CTRL_t := (
                                                                                             WR_EN => '0',
                                                                                             ADDR => (others => '0'),
                                                                                             VALUE => (others => '0')
                                                                                            );
  type UCM_CHAMBER_Z0_MID_CALC_RD_MON_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- Read Value id position selected
    RST_REQ                    :std_logic;                      -- Reset request after changes in the mem
  end record UCM_CHAMBER_Z0_MID_CALC_RD_MON_t;


  type UCM_CHAMBER_Z0_MID_MON_t is record
    CALC_RD                    :UCM_CHAMBER_Z0_MID_CALC_RD_MON_t;
  end record UCM_CHAMBER_Z0_MID_MON_t;


  type UCM_CHAMBER_Z0_MID_CTRL_t is record
    CALC_WR                    :UCM_CHAMBER_Z0_MID_CALC_WR_CTRL_t;
  end record UCM_CHAMBER_Z0_MID_CTRL_t;


  constant DEFAULT_UCM_CHAMBER_Z0_MID_CTRL_t : UCM_CHAMBER_Z0_MID_CTRL_t := (
                                                                             CALC_WR => DEFAULT_UCM_CHAMBER_Z0_MID_CALC_WR_CTRL_t
                                                                            );
  type UCM_CHAMBER_Z0_OUT_CALC_WR_CTRL_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- New value to write
    ADDR                       :std_logic_vector( 7 downto 0);  -- position or chamber to r/w value
    WR_EN                      :std_logic;                      -- Write Enable
  end record UCM_CHAMBER_Z0_OUT_CALC_WR_CTRL_t;


  constant DEFAULT_UCM_CHAMBER_Z0_OUT_CALC_WR_CTRL_t : UCM_CHAMBER_Z0_OUT_CALC_WR_CTRL_t := (
                                                                                             WR_EN => '0',
                                                                                             ADDR => (others => '0'),
                                                                                             VALUE => (others => '0')
                                                                                            );
  type UCM_CHAMBER_Z0_OUT_CALC_RD_MON_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- Read Value id position selected
    RST_REQ                    :std_logic;                      -- Reset request after changes in the mem
  end record UCM_CHAMBER_Z0_OUT_CALC_RD_MON_t;


  type UCM_CHAMBER_Z0_OUT_MON_t is record
    CALC_RD                    :UCM_CHAMBER_Z0_OUT_CALC_RD_MON_t;
  end record UCM_CHAMBER_Z0_OUT_MON_t;


  type UCM_CHAMBER_Z0_OUT_CTRL_t is record
    CALC_WR                    :UCM_CHAMBER_Z0_OUT_CALC_WR_CTRL_t;
  end record UCM_CHAMBER_Z0_OUT_CTRL_t;


  constant DEFAULT_UCM_CHAMBER_Z0_OUT_CTRL_t : UCM_CHAMBER_Z0_OUT_CTRL_t := (
                                                                             CALC_WR => DEFAULT_UCM_CHAMBER_Z0_OUT_CALC_WR_CTRL_t
                                                                            );
  type UCM_CHAMBER_Z0_EXT_CALC_WR_CTRL_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- New value to write
    ADDR                       :std_logic_vector( 7 downto 0);  -- position or chamber to r/w value
    WR_EN                      :std_logic;                      -- Write Enable
  end record UCM_CHAMBER_Z0_EXT_CALC_WR_CTRL_t;


  constant DEFAULT_UCM_CHAMBER_Z0_EXT_CALC_WR_CTRL_t : UCM_CHAMBER_Z0_EXT_CALC_WR_CTRL_t := (
                                                                                             WR_EN => '0',
                                                                                             ADDR => (others => '0'),
                                                                                             VALUE => (others => '0')
                                                                                            );
  type UCM_CHAMBER_Z0_EXT_CALC_RD_MON_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- Read Value id position selected
    RST_REQ                    :std_logic;                      -- Reset request after changes in the mem
  end record UCM_CHAMBER_Z0_EXT_CALC_RD_MON_t;


  type UCM_CHAMBER_Z0_EXT_MON_t is record
    CALC_RD                    :UCM_CHAMBER_Z0_EXT_CALC_RD_MON_t;
  end record UCM_CHAMBER_Z0_EXT_MON_t;


  type UCM_CHAMBER_Z0_EXT_CTRL_t is record
    CALC_WR                    :UCM_CHAMBER_Z0_EXT_CALC_WR_CTRL_t;
  end record UCM_CHAMBER_Z0_EXT_CTRL_t;


  constant DEFAULT_UCM_CHAMBER_Z0_EXT_CTRL_t : UCM_CHAMBER_Z0_EXT_CTRL_t := (
                                                                             CALC_WR => DEFAULT_UCM_CHAMBER_Z0_EXT_CALC_WR_CTRL_t
                                                                            );
  type UCM_CHAMBER_Z0_MON_t is record
    INN                        :UCM_CHAMBER_Z0_INN_MON_t;
    MID                        :UCM_CHAMBER_Z0_MID_MON_t;
    OUT                        :UCM_CHAMBER_Z0_OUT_MON_t;
    EXT                        :UCM_CHAMBER_Z0_EXT_MON_t;
  end record UCM_CHAMBER_Z0_MON_t;


  type UCM_CHAMBER_Z0_CTRL_t is record
    INN                        :UCM_CHAMBER_Z0_INN_CTRL_t;
    MID                        :UCM_CHAMBER_Z0_MID_CTRL_t;
    OUT                        :UCM_CHAMBER_Z0_OUT_CTRL_t;
    EXT                        :UCM_CHAMBER_Z0_EXT_CTRL_t;
  end record UCM_CHAMBER_Z0_CTRL_t;


  constant DEFAULT_UCM_CHAMBER_Z0_CTRL_t : UCM_CHAMBER_Z0_CTRL_t := (
                                                                     INN => DEFAULT_UCM_CHAMBER_Z0_INN_CTRL_t,
                                                                     EXT => DEFAULT_UCM_CHAMBER_Z0_EXT_CTRL_t,
                                                                     MID => DEFAULT_UCM_CHAMBER_Z0_MID_CTRL_t,
                                                                     OUT => DEFAULT_UCM_CHAMBER_Z0_OUT_CTRL_t
                                                                    );
  type UCM_MON_t is record
    STATUS                     :UCM_STATUS_MON_t;
    CHAMBER_Z0                 :UCM_CHAMBER_Z0_MON_t;
  end record UCM_MON_t;


  type UCM_CTRL_t is record
    ACTIONS                    :UCM_ACTIONS_CTRL_t;
    CONFIGS                    :UCM_CONFIGS_CTRL_t;
    SECTOR_PHI                 :UCM_SECTOR_PHI_CTRL_t;
    CHAMBER_Z0                 :UCM_CHAMBER_Z0_CTRL_t;
  end record UCM_CTRL_t;


  constant DEFAULT_UCM_CTRL_t : UCM_CTRL_t := (
                                               CONFIGS => DEFAULT_UCM_CONFIGS_CTRL_t,
                                               SECTOR_PHI => DEFAULT_UCM_SECTOR_PHI_CTRL_t,
                                               CHAMBER_Z0 => DEFAULT_UCM_CHAMBER_Z0_CTRL_t,
                                               ACTIONS => DEFAULT_UCM_ACTIONS_CTRL_t
                                              );


end package UCM_CTRL;
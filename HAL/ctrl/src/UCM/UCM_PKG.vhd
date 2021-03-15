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


  type UCM_SECTOR_PHI_CTRL_CTRL_t is record
    VALUE                      :std_logic_vector(11 downto 0);  -- Phi to Center of chamber
    READ                       :std_logic;                      -- Phi to Center of chamber
    WRITE                      :std_logic;                      -- Phi to Center of chamber
  end record UCM_SECTOR_PHI_CTRL_CTRL_t;


  constant DEFAULT_UCM_SECTOR_PHI_CTRL_CTRL_t : UCM_SECTOR_PHI_CTRL_CTRL_t := (
                                                                               READ => '0',
                                                                               WRITE => '0',
                                                                               VALUE => (others => '0')
                                                                              );
  type UCM_SECTOR_PHI_MON_MON_t is record
    VALUE                      :std_logic_vector(11 downto 0);  -- Phi to Center of chamber
  end record UCM_SECTOR_PHI_MON_MON_t;


  type UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_WR_CTRL_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- New value to write
    ADDR                       :std_logic_vector( 7 downto 0);  -- position or chamber to r/w value
    WR_EN                      :std_logic;                      -- Write Enable
  end record UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_WR_CTRL_t;


  constant DEFAULT_UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_WR_CTRL_t : UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_WR_CTRL_t := (
                                                                                                         WR_EN => '0',
                                                                                                         ADDR => (others => '0'),
                                                                                                         VALUE => (others => '0')
                                                                                                        );
  type UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_RD_MON_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- Read Value id position selected
    RST_REQ                    :std_logic;                      -- Reset request after changes in the mem
  end record UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_RD_MON_t;


  type UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t is record
    RD                         :UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_RD_MON_t;
  end record UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t;
  type UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t_ARRAY is array(0 to 3) of UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t;

  type UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t is record
    WR                         :UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_WR_CTRL_t;
  end record UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t;
  type UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t_ARRAY is array(0 to 3) of UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t;

  constant DEFAULT_UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t : UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t := (
                                                                                                   WR => DEFAULT_UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_WR_CTRL_t
                                                                                                  );
  type UCM_CDE_CHAMB_Z0_MON_t is record
    CDE_CHAMB_Z0               :UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t_ARRAY;
  end record UCM_CDE_CHAMB_Z0_MON_t;


  type UCM_CDE_CHAMB_Z0_CTRL_t is record
    CDE_CHAMB_Z0               :UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t_ARRAY;
  end record UCM_CDE_CHAMB_Z0_CTRL_t;


  constant DEFAULT_UCM_CDE_CHAMB_Z0_CTRL_t : UCM_CDE_CHAMB_Z0_CTRL_t := (
                                                                         CDE_CHAMB_Z0 => (others => DEFAULT_UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t )
                                                                        );
  type UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_WR_CTRL_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- New value to write
    ADDR                       :std_logic_vector( 7 downto 0);  -- position or chamber to r/w value
    WR_EN                      :std_logic;                      -- Write Enable
  end record UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_WR_CTRL_t;


  constant DEFAULT_UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_WR_CTRL_t : UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_WR_CTRL_t := (
                                                                                                         WR_EN => '0',
                                                                                                         ADDR => (others => '0'),
                                                                                                         VALUE => (others => '0')
                                                                                                        );
  type UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_RD_MON_t is record
    VALUE                      :std_logic_vector(15 downto 0);  -- Read Value id position selected
    RST_REQ                    :std_logic;                      -- Reset request after changes in the mem
  end record UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_RD_MON_t;


  type UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t is record
    RD                         :UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_RD_MON_t;
  end record UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t;
  type UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t_ARRAY is array(0 to 3) of UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t;

  type UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t is record
    WR                         :UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_WR_CTRL_t;
  end record UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t;
  type UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t_ARRAY is array(0 to 3) of UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t;

  constant DEFAULT_UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t : UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t := (
                                                                                                   WR => DEFAULT_UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_WR_CTRL_t
                                                                                                  );
  type UCM_CVP_CHAMB_Z0_MON_t is record
    CVP_CHAMB_Z0               :UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t_ARRAY;
  end record UCM_CVP_CHAMB_Z0_MON_t;


  type UCM_CVP_CHAMB_Z0_CTRL_t is record
    CVP_CHAMB_Z0               :UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t_ARRAY;
  end record UCM_CVP_CHAMB_Z0_CTRL_t;


  constant DEFAULT_UCM_CVP_CHAMB_Z0_CTRL_t : UCM_CVP_CHAMB_Z0_CTRL_t := (
                                                                         CVP_CHAMB_Z0 => (others => DEFAULT_UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t )
                                                                        );
  type UCM_MON_t is record
    STATUS                     :UCM_STATUS_MON_t;
    SECTOR_PHI_MON             :UCM_SECTOR_PHI_MON_MON_t;
    CDE_CHAMB_Z0               :UCM_CDE_CHAMB_Z0_MON_t;  
    CVP_CHAMB_Z0               :UCM_CVP_CHAMB_Z0_MON_t;  
  end record UCM_MON_t;


  type UCM_CTRL_t is record
    ACTIONS                    :UCM_ACTIONS_CTRL_t;
    CONFIGS                    :UCM_CONFIGS_CTRL_t;
    SECTOR_PHI_CTRL            :UCM_SECTOR_PHI_CTRL_CTRL_t;
    CDE_CHAMB_Z0               :UCM_CDE_CHAMB_Z0_CTRL_t;   
    CVP_CHAMB_Z0               :UCM_CVP_CHAMB_Z0_CTRL_t;   
  end record UCM_CTRL_t;


  constant DEFAULT_UCM_CTRL_t : UCM_CTRL_t := (
                                               CDE_CHAMB_Z0 => DEFAULT_UCM_CDE_CHAMB_Z0_CTRL_t,
                                               CONFIGS => DEFAULT_UCM_CONFIGS_CTRL_t,
                                               CVP_CHAMB_Z0 => DEFAULT_UCM_CVP_CHAMB_Z0_CTRL_t,
                                               SECTOR_PHI_CTRL => DEFAULT_UCM_SECTOR_PHI_CTRL_CTRL_t,
                                               ACTIONS => DEFAULT_UCM_ACTIONS_CTRL_t
                                              );


end package UCM_CTRL;
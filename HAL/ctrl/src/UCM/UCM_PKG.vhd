--This file was auto-generated.
--Modifications might be lost.
-- Created : 2021-04-03 16:04:08.392621.
library IEEE;
use IEEE.std_logic_1164.all;

library shared_lib;
use shared_lib.common_ieee.all;


package UCM_CTRL is
  type UCM_ACTIONS_CTRL_t is record
    RESET                      :std_logic;   
    ENABLE                     :std_logic;   
    DISABLE                    :std_logic;   
    FREEZE                     :std_logic;   
  end record UCM_ACTIONS_CTRL_t;


  constant DEFAULT_UCM_ACTIONS_CTRL_t : UCM_ACTIONS_CTRL_t := (
                                                               RESET => '0',
                                                               DISABLE => '0',
                                                               ENABLE => '0',
                                                               FREEZE => '0'
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
    ENABLED                    :std_logic_vector( 7 downto 0);
    READY                      :std_logic_vector( 7 downto 0);
    ERROR                      :std_logic_vector( 7 downto 0);
  end record UCM_STATUS_MON_t;


  type UCM_SECTOR_PHI_MON_t is record
    rd_data                    :std_logic_vector( 9 downto 0);  -- Read Data
  end record UCM_SECTOR_PHI_MON_t;


  type UCM_SECTOR_PHI_CTRL_t is record
    wr_req                     :std_logic;     -- Write Enable
    rd_req                     :std_logic;     -- Write Enable
    wr_data                    :std_logic_vector( 9 downto 0);  -- Write Data
  end record UCM_SECTOR_PHI_CTRL_t;


  constant DEFAULT_UCM_SECTOR_PHI_CTRL_t : UCM_SECTOR_PHI_CTRL_t := (
                                                                     wr_req => '0',
                                                                     rd_req => '0',
                                                                     wr_data => (others => '0')
                                                                    );
  type UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t is record
    rd_rdy                     :std_logic;     -- Read ready
    rd_data                    :std_logic_vector(15 downto 0);  -- Read Data
  end record UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t;
  type UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t_ARRAY is array(0 to 3) of UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t;

  type UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t is record
    wr_req                     :std_logic;     -- Write Request
    rd_req                     :std_logic;     -- Read Request
    wr_addr                    :std_logic_vector( 7 downto 0);  -- Write Address
    rd_addr                    :std_logic_vector( 7 downto 0);  -- Read Address
    wr_data                    :std_logic_vector(15 downto 0);  -- Write Data
  end record UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t;
  type UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t_ARRAY is array(0 to 3) of UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t;

  constant DEFAULT_UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t : UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t := (
                                                                                                   wr_addr => (others => '0'),
                                                                                                   rd_addr => (others => '0'),
                                                                                                   wr_req => '0',
                                                                                                   rd_req => '0',
                                                                                                   wr_data => (others => '0')
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
  type UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t is record
    rd_rdy                     :std_logic;     -- Read ready
    rd_data                    :std_logic_vector(15 downto 0);  -- Read Data
  end record UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t;
  type UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t_ARRAY is array(0 to 3) of UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t;

  type UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t is record
    wr_req                     :std_logic;     -- Write Request
    rd_req                     :std_logic;     -- Read Request
    wr_addr                    :std_logic_vector( 7 downto 0);  -- Write Address
    rd_addr                    :std_logic_vector( 7 downto 0);  -- Read Address
    wr_data                    :std_logic_vector(15 downto 0);  -- Write Data
  end record UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t;
  type UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t_ARRAY is array(0 to 3) of UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t;

  constant DEFAULT_UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t : UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t := (
                                                                                                   wr_addr => (others => '0'),
                                                                                                   rd_addr => (others => '0'),
                                                                                                   wr_req => '0',
                                                                                                   rd_req => '0',
                                                                                                   wr_data => (others => '0')
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
    SECTOR_PHI                 :UCM_SECTOR_PHI_MON_t;
    CDE_CHAMB_Z0               :UCM_CDE_CHAMB_Z0_MON_t;
    CVP_CHAMB_Z0               :UCM_CVP_CHAMB_Z0_MON_t;
  end record UCM_MON_t;


  type UCM_CTRL_t is record
    ACTIONS                    :UCM_ACTIONS_CTRL_t;
    CONFIGS                    :UCM_CONFIGS_CTRL_t;
    SECTOR_PHI                 :UCM_SECTOR_PHI_CTRL_t;
    CDE_CHAMB_Z0               :UCM_CDE_CHAMB_Z0_CTRL_t;
    CVP_CHAMB_Z0               :UCM_CVP_CHAMB_Z0_CTRL_t;
  end record UCM_CTRL_t;


  constant DEFAULT_UCM_CTRL_t : UCM_CTRL_t := (
                                               CVP_CHAMB_Z0 => DEFAULT_UCM_CVP_CHAMB_Z0_CTRL_t,
                                               CDE_CHAMB_Z0 => DEFAULT_UCM_CDE_CHAMB_Z0_CTRL_t,
                                               CONFIGS => DEFAULT_UCM_CONFIGS_CTRL_t,
                                               SECTOR_PHI => DEFAULT_UCM_SECTOR_PHI_CTRL_t,
                                               ACTIONS => DEFAULT_UCM_ACTIONS_CTRL_t
                                              );


end package UCM_CTRL;
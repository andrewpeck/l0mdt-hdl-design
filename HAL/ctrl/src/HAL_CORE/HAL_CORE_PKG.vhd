--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package HAL_CORE_CTRL is
  type HAL_CORE_CLOCKING_MON_t is record
    MMCM_LOCKED                :std_logic;   
  end record HAL_CORE_CLOCKING_MON_t;


  type HAL_CORE_CLOCKING_CTRL_t is record
    RESET_MMCM                 :std_logic;   
  end record HAL_CORE_CLOCKING_CTRL_t;


  constant DEFAULT_HAL_CORE_CLOCKING_CTRL_t : HAL_CORE_CLOCKING_CTRL_t := (
                                                                           RESET_MMCM => '0'
                                                                          );
  type HAL_CORE_MGT_MGT_STATUS_MON_t is record
    rxcdr_stable               :std_logic;   
    powergood                  :std_logic;   
    txready                    :std_logic;   
    rxready                    :std_logic;   
    rx_pma_reset_done          :std_logic;   
    tx_pma_reset_done          :std_logic;   
    tx_reset_done              :std_logic;   
    rx_reset_done              :std_logic;   
    buffbypass_tx_done_out     :std_logic;   
    buffbypass_tx_error_out    :std_logic;   
    buffbypass_rx_done_out     :std_logic;   
    buffbypass_rx_error_out    :std_logic;   
  end record HAL_CORE_MGT_MGT_STATUS_MON_t;


  type HAL_CORE_MGT_MGT_DRP_MON_t is record
    rd_rdy                     :std_logic;     -- DRP Enable
    rd_data                    :std_logic_vector(15 downto 0);  -- DRP Read Data
  end record HAL_CORE_MGT_MGT_DRP_MON_t;


  type HAL_CORE_MGT_MGT_DRP_CTRL_t is record
    wr_en                      :std_logic;     -- DRP Write Enable
    wr_addr                    :std_logic_vector( 9 downto 0);  -- DRP Address
    en                         :std_logic;                      -- DRP Enable
    wr_data                    :std_logic_vector(15 downto 0);  -- DRP Write Data
  end record HAL_CORE_MGT_MGT_DRP_CTRL_t;


  constant DEFAULT_HAL_CORE_MGT_MGT_DRP_CTRL_t : HAL_CORE_MGT_MGT_DRP_CTRL_t := (
                                                                                 wr_en => '0',
                                                                                 wr_addr => (others => '0'),
                                                                                 en => '0',
                                                                                 wr_data => (others => '0')
                                                                                );
  type HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t is record
    reset                      :std_logic;   
    reset_pll_and_datapath     :std_logic;   
    reset_datapath             :std_logic;   
    reset_bufbypass            :std_logic;   
  end record HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t;


  constant DEFAULT_HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t : HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t := (
                                                                                             reset => '0',
                                                                                             reset_pll_and_datapath => '0',
                                                                                             reset_datapath => '0',
                                                                                             reset_bufbypass => '0'
                                                                                            );
  type HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t is record
    reset                      :std_logic;   
    reset_pll_and_datapath     :std_logic;   
    reset_datapath             :std_logic;   
    reset_bufbypass            :std_logic;   
  end record HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t;


  constant DEFAULT_HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t : HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t := (
                                                                                             reset => '0',
                                                                                             reset_pll_and_datapath => '0',
                                                                                             reset_datapath => '0',
                                                                                             reset_bufbypass => '0'
                                                                                            );
  type HAL_CORE_MGT_MGT_MON_t is record
    STATUS                     :HAL_CORE_MGT_MGT_STATUS_MON_t;
    DRP                        :HAL_CORE_MGT_MGT_DRP_MON_t;   
  end record HAL_CORE_MGT_MGT_MON_t;
  type HAL_CORE_MGT_MGT_MON_t_ARRAY is array(0 to 127) of HAL_CORE_MGT_MGT_MON_t;

  type HAL_CORE_MGT_MGT_CTRL_t is record
    DRP                        :HAL_CORE_MGT_MGT_DRP_CTRL_t;
    TX_RESETS                  :HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t;
    RX_RESETS                  :HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t;
  end record HAL_CORE_MGT_MGT_CTRL_t;
  type HAL_CORE_MGT_MGT_CTRL_t_ARRAY is array(0 to 127) of HAL_CORE_MGT_MGT_CTRL_t;

  constant DEFAULT_HAL_CORE_MGT_MGT_CTRL_t : HAL_CORE_MGT_MGT_CTRL_t := (
                                                                         DRP => DEFAULT_HAL_CORE_MGT_MGT_DRP_CTRL_t,
                                                                         TX_RESETS => DEFAULT_HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t,
                                                                         RX_RESETS => DEFAULT_HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t
                                                                        );
  type HAL_CORE_MGT_MON_t is record
    MGT                        :HAL_CORE_MGT_MGT_MON_t_ARRAY;
  end record HAL_CORE_MGT_MON_t;


  type HAL_CORE_MGT_CTRL_t is record
    MGT                        :HAL_CORE_MGT_MGT_CTRL_t_ARRAY;
  end record HAL_CORE_MGT_CTRL_t;


  constant DEFAULT_HAL_CORE_MGT_CTRL_t : HAL_CORE_MGT_CTRL_t := (
                                                                 MGT => (others => DEFAULT_HAL_CORE_MGT_MGT_CTRL_t )
                                                                );
  type HAL_CORE_MON_t is record
    CLOCKING                   :HAL_CORE_CLOCKING_MON_t;
    MGT                        :HAL_CORE_MGT_MON_t;     
  end record HAL_CORE_MON_t;


  type HAL_CORE_CTRL_t is record
    CLOCKING                   :HAL_CORE_CLOCKING_CTRL_t;
    MGT                        :HAL_CORE_MGT_CTRL_t;     
  end record HAL_CORE_CTRL_t;


  constant DEFAULT_HAL_CORE_CTRL_t : HAL_CORE_CTRL_t := (
                                                         CLOCKING => DEFAULT_HAL_CORE_CLOCKING_CTRL_t,
                                                         MGT => DEFAULT_HAL_CORE_MGT_CTRL_t
                                                        );


end package HAL_CORE_CTRL;
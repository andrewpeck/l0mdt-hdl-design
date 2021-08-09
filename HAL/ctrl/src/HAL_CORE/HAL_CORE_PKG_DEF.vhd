--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.HAL_CORE_CTRL.all;


package HAL_CORE_CTRL_DEF is
  constant DEFAULT_HAL_CORE_CLOCKING_CTRL_t : HAL_CORE_CLOCKING_CTRL_t := (
                                                                           RESET_MMCM => '0',
                                                                           SELECT_FELIX_CLK => '0'
                                                                          );
  constant DEFAULT_HAL_CORE_MGT_MGT_DRP_CTRL_t : HAL_CORE_MGT_MGT_DRP_CTRL_t := (
                                                                                 wr_en => '0',
                                                                                 wr_addr => (others => '0'),
                                                                                 en => '0',
                                                                                 wr_data => (others => '0')
                                                                                );
  constant DEFAULT_HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t : HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t := (
                                                                                             reset => '0',
                                                                                             reset_pll_and_datapath => '0',
                                                                                             reset_datapath => '0',
                                                                                             reset_bufbypass => '0'
                                                                                            );
  constant DEFAULT_HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t : HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t := (
                                                                                             reset => '0',
                                                                                             reset_pll_and_datapath => '0',
                                                                                             reset_datapath => '0',
                                                                                             reset_bufbypass => '0'
                                                                                            );
  constant DEFAULT_HAL_CORE_MGT_MGT_CTRL_t : HAL_CORE_MGT_MGT_CTRL_t := (
                                                                         DRP => DEFAULT_HAL_CORE_MGT_MGT_DRP_CTRL_t,
                                                                         TX_RESETS => DEFAULT_HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t,
                                                                         RX_RESETS => DEFAULT_HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t
                                                                        );
  constant DEFAULT_HAL_CORE_MGT_CTRL_t : HAL_CORE_MGT_CTRL_t := (
                                                                 MGT => (others => DEFAULT_HAL_CORE_MGT_MGT_CTRL_t )
                                                                );
  constant DEFAULT_HAL_CORE_CTRL_t : HAL_CORE_CTRL_t := (
                                                         CLOCKING => DEFAULT_HAL_CORE_CLOCKING_CTRL_t,
                                                         MGT => DEFAULT_HAL_CORE_MGT_CTRL_t
                                                        );

end package HAL_CORE_CTRL_DEF;

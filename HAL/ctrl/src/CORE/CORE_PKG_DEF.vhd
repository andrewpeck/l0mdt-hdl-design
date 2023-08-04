--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.CORE_CTRL.all;


package CORE_CTRL_DEF is
  constant DEFAULT_CORE_CLOCKING_CTRL_t : CORE_CLOCKING_CTRL_t := (
                                                                   RESET_MMCM => '0'
                                                                  );
  constant DEFAULT_CORE_MGT_MGT_DRP_CTRL_t : CORE_MGT_MGT_DRP_CTRL_t := (
                                                                         wr_en => '0',
                                                                         wr_addr => (others => '0'),
                                                                         en => '0',
                                                                         wr_data => (others => '0')
                                                                        );
  constant DEFAULT_CORE_MGT_MGT_TX_RESETS_CTRL_t : CORE_MGT_MGT_TX_RESETS_CTRL_t := (
                                                                                     reset_pll_and_datapath => '0',
                                                                                     reset_datapath => '0',
                                                                                     reset_bufbypass => '0'
                                                                                    );
  constant DEFAULT_CORE_MGT_MGT_RX_RESETS_CTRL_t : CORE_MGT_MGT_RX_RESETS_CTRL_t := (
                                                                                     reset_pll_and_datapath => '0',
                                                                                     reset_datapath => '0',
                                                                                     reset_bufbypass => '0'
                                                                                    );
  constant DEFAULT_CORE_MGT_MGT_CTRL_t : CORE_MGT_MGT_CTRL_t := (
                                                                 RESET_ALL => '0',
                                                                 DRP => DEFAULT_CORE_MGT_MGT_DRP_CTRL_t,
                                                                 TX_RESETS => DEFAULT_CORE_MGT_MGT_TX_RESETS_CTRL_t,
                                                                 RX_RESETS => DEFAULT_CORE_MGT_MGT_RX_RESETS_CTRL_t
                                                                );
  constant DEFAULT_CORE_MGT_CTRL_t : CORE_MGT_CTRL_t := (
                                                         MGT => (others => DEFAULT_CORE_MGT_MGT_CTRL_t )
                                                        );
  constant DEFAULT_CORE_CTRL_t : CORE_CTRL_t := (
                                                 CLOCKING => DEFAULT_CORE_CLOCKING_CTRL_t,
                                                 MGT => DEFAULT_CORE_MGT_CTRL_t
                                                );

end package CORE_CTRL_DEF;

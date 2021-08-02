--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.HAL_CTRL.all;


package HAL_CTRL_DEF is
  constant DEFAULT_HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_CTRL_t : HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_CTRL_t := (
                                                                                                       RESET => '0'
                                                                                                      );
  constant DEFAULT_HAL_CSM_CSM_LPGBT_UPLINK_CTRL_t : HAL_CSM_CSM_LPGBT_UPLINK_CTRL_t := (
                                                                                         UPLINK => (others => DEFAULT_HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_CTRL_t )
                                                                                        );
  constant DEFAULT_HAL_CSM_CSM_LPGBT_DOWNLINK_CTRL_t : HAL_CSM_CSM_LPGBT_DOWNLINK_CTRL_t := (
                                                                                             RESET => '0'
                                                                                            );
  constant DEFAULT_HAL_CSM_CSM_LPGBT_CTRL_t : HAL_CSM_CSM_LPGBT_CTRL_t := (
                                                                           UPLINK => DEFAULT_HAL_CSM_CSM_LPGBT_UPLINK_CTRL_t,
                                                                           DOWNLINK => DEFAULT_HAL_CSM_CSM_LPGBT_DOWNLINK_CTRL_t
                                                                          );
  constant DEFAULT_HAL_CSM_CSM_SC_MASTER_CTRL_t : HAL_CSM_CSM_SC_MASTER_CTRL_t := (
                                                                                   TX_RESET => '0',
                                                                                   RX_RESET => '0',
                                                                                   TX_START_WRITE => '0',
                                                                                   TX_START_READ => '0',
                                                                                   TX_GBTX_ADDR => (others => '0'),
                                                                                   TX_REGISTER_ADDR => (others => '0'),
                                                                                   TX_NUM_BYTES_TO_READ => (others => '0'),
                                                                                   TX_DATA_TO_GBTX => (others => '0'),
                                                                                   TX_WR => '0',
                                                                                   RX_RD => '0',
                                                                                   TX_CMD => (others => '0'),
                                                                                   TX_ADDRESS => (others => '0'),
                                                                                   TX_TRANSID => (others => '0'),
                                                                                   TX_CHANNEL => (others => '0'),
                                                                                   TX_DATA => (others => '0'),
                                                                                   SCA_ENABLE => "111",
                                                                                   START_RESET => '0',
                                                                                   START_CONNECT => '0',
                                                                                   START_COMMAND => '0',
                                                                                   INJ_CRC_ERR => '0'
                                                                                  );
  constant DEFAULT_HAL_CSM_CSM_SC_SLAVE_CTRL_t : HAL_CSM_CSM_SC_SLAVE_CTRL_t := (
                                                                                 TX_RESET => '0',
                                                                                 RX_RESET => '0',
                                                                                 TX_START_WRITE => '0',
                                                                                 TX_START_READ => '0',
                                                                                 TX_GBTX_ADDR => (others => '0'),
                                                                                 TX_REGISTER_ADDR => (others => '0'),
                                                                                 TX_NUM_BYTES_TO_READ => (others => '0'),
                                                                                 TX_DATA_TO_GBTX => (others => '0'),
                                                                                 TX_WR => '0',
                                                                                 RX_RD => '0'
                                                                                );
  constant DEFAULT_HAL_CSM_CSM_SC_CTRL_t : HAL_CSM_CSM_SC_CTRL_t := (
                                                                     MASTER => DEFAULT_HAL_CSM_CSM_SC_MASTER_CTRL_t,
                                                                     SLAVE => DEFAULT_HAL_CSM_CSM_SC_SLAVE_CTRL_t
                                                                    );
  constant DEFAULT_HAL_CSM_CSM_CTRL_t : HAL_CSM_CSM_CTRL_t := (
                                                               LPGBT => DEFAULT_HAL_CSM_CSM_LPGBT_CTRL_t,
                                                               SC => DEFAULT_HAL_CSM_CSM_SC_CTRL_t
                                                              );
  constant DEFAULT_HAL_CSM_CTRL_t : HAL_CSM_CTRL_t := (
                                                       CSM => (others => DEFAULT_HAL_CSM_CSM_CTRL_t )
                                                      );
  constant DEFAULT_HAL_CTRL_t : HAL_CTRL_t := (
                                               RESET_DOWNLINKS => '0',
                                               RESET_UPLINKS => '0',
                                               RESET_COUNTERS => '0',
                                               CSM => DEFAULT_HAL_CSM_CTRL_t
                                              );

end package HAL_CTRL_DEF;

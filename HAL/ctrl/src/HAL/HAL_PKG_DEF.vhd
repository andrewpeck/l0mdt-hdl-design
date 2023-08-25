--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.HAL_CTRL.all;


package HAL_CTRL_DEF is
  constant DEFAULT_HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_CTRL_t : HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_CTRL_t := (
                                                                                                       RESET => '1'
                                                                                                      );
  constant DEFAULT_HAL_CSM_CSM_LPGBT_UPLINK_CTRL_t : HAL_CSM_CSM_LPGBT_UPLINK_CTRL_t := (
                                                                                         UPLINK => (others => DEFAULT_HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_CTRL_t )
                                                                                        );
  constant DEFAULT_HAL_CSM_CSM_LPGBT_DOWNLINK_CTRL_t : HAL_CSM_CSM_LPGBT_DOWNLINK_CTRL_t := (
                                                                                             RESET => '1'
                                                                                            );
  constant DEFAULT_HAL_CSM_CSM_LPGBT_CTRL_t : HAL_CSM_CSM_LPGBT_CTRL_t := (
                                                                           UPLINK => DEFAULT_HAL_CSM_CSM_LPGBT_UPLINK_CTRL_t,
                                                                           DOWNLINK => DEFAULT_HAL_CSM_CSM_LPGBT_DOWNLINK_CTRL_t
                                                                          );
  constant DEFAULT_HAL_CSM_CSM_SC_MASTER_IC_CTRL_t : HAL_CSM_CSM_SC_MASTER_IC_CTRL_t := (
                                                                                         TX_START_WRITE => '0',
                                                                                         TX_START_READ => '0',
                                                                                         TX_REGISTER_ADDR => x"0000",
                                                                                         TX_NUM_BYTES_TO_READ => x"0000",
                                                                                         TX_DATA_TO_GBTX => x"00",
                                                                                         TX_GBTX_ADDR => x"00",
                                                                                         TX_WR => '0'
                                                                                        );
  constant DEFAULT_HAL_CSM_CSM_SC_MASTER_CTRL_t : HAL_CSM_CSM_SC_MASTER_CTRL_t := (
                                                                                   TX_RESET => '0',
                                                                                   RX_RESET => '0',
                                                                                   IC => DEFAULT_HAL_CSM_CSM_SC_MASTER_IC_CTRL_t,
                                                                                   TX_CMD => x"00",
                                                                                   TX_ADDRESS => x"00",
                                                                                   TX_TRANSID => x"00",
                                                                                   TX_CHANNEL => x"00",
                                                                                   TX_DATA => x"00000000",
                                                                                   SCA_ENABLE => "111",
                                                                                   START_RESET => '0',
                                                                                   START_CONNECT => '0',
                                                                                   START_COMMAND => '0',
                                                                                   INJ_CRC_ERR => '0'
                                                                                  );
  constant DEFAULT_HAL_CSM_CSM_SC_SLAVE_IC_CTRL_t : HAL_CSM_CSM_SC_SLAVE_IC_CTRL_t := (
                                                                                       TX_START_WRITE => '0',
                                                                                       TX_START_READ => '0',
                                                                                       TX_REGISTER_ADDR => x"0000",
                                                                                       TX_NUM_BYTES_TO_READ => x"0000",
                                                                                       TX_DATA_TO_GBTX => x"00",
                                                                                       TX_GBTX_ADDR => x"00",
                                                                                       TX_WR => '0'
                                                                                      );
  constant DEFAULT_HAL_CSM_CSM_SC_SLAVE_CTRL_t : HAL_CSM_CSM_SC_SLAVE_CTRL_t := (
                                                                                 TX_RESET => '0',
                                                                                 RX_RESET => '0',
                                                                                 IC => DEFAULT_HAL_CSM_CSM_SC_SLAVE_IC_CTRL_t
                                                                                );
  constant DEFAULT_HAL_CSM_CSM_SC_CTRL_t : HAL_CSM_CSM_SC_CTRL_t := (
                                                                     MASTER => DEFAULT_HAL_CSM_CSM_SC_MASTER_CTRL_t,
                                                                     FRAME_FORMAT => '0',
                                                                     SLAVE => DEFAULT_HAL_CSM_CSM_SC_SLAVE_CTRL_t
                                                                    );
  constant DEFAULT_HAL_CSM_CSM_CTRL_t : HAL_CSM_CSM_CTRL_t := (
                                                               LPGBT => DEFAULT_HAL_CSM_CSM_LPGBT_CTRL_t,
                                                               SC => DEFAULT_HAL_CSM_CSM_SC_CTRL_t
                                                              );
  constant DEFAULT_HAL_CSM_CTRL_t : HAL_CSM_CTRL_t := (
                                                       CSM => (others => DEFAULT_HAL_CSM_CSM_CTRL_t )
                                                      );
  constant DEFAULT_HAL_SL_RESET_CTRL_t : HAL_SL_RESET_CTRL_t := (
                                                                 rx_comma => '0',
                                                                 rx_packet_former => '0',
                                                                 rx_counter => '0'
                                                                );
  constant DEFAULT_HAL_SL_CTRL_t : HAL_SL_CTRL_t := (
                                                     TX_ENA_TEST_PATTERN => x"00000000",
                                                     RESET => DEFAULT_HAL_SL_RESET_CTRL_t
                                                    );
  constant DEFAULT_HAL_CTRL_t : HAL_CTRL_t := (
                                               RESET_DOWNLINKS => '0',
                                               RESET_UPLINKS => '0',
                                               RESET_COUNTERS => '0',
                                               CSM => DEFAULT_HAL_CSM_CTRL_t,
                                               SL => DEFAULT_HAL_SL_CTRL_t
                                              );

end package HAL_CTRL_DEF;

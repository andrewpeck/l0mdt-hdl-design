--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.C2C_INTF_CTRL.all;


package C2C_INTF_CTRL_DEF is
  constant Default_C2C_INTF_DRP_MOSI_t : C2C_INTF_C2C_DRP_MOSI_t := ( 
                                                     clk       => '0',
                                                     enable    => '0',
                                                     wr_enable => '0',
                                                     address   => (others => '0'),
                                                     wr_data   => (others => '0')
  );
  constant DEFAULT_C2C_INTF_STATUS_CTRL_t : C2C_INTF_C2C_STATUS_CTRL_t := (
                                                                       INITIALIZE => '0'
                                                                      );
  constant DEFAULT_C2C_INTF_DEBUG_RX_CTRL_t : C2C_INTF_C2C_DEBUG_RX_CTRL_t := (
                                                                           BUF_RESET => '0',
                                                                           CDR_HOLD => '0',
                                                                           DFE_LPM_RESET => '0',
                                                                           LPM_EN => '1',
                                                                           PCS_RESET => '0',
                                                                           PMA_RESET => '0',
                                                                           PRBS_CNT_RST => '0',
                                                                           PRBS_SEL => (others => '0'),
                                                                           RATE => (others => '0')
                                                                          );
  constant DEFAULT_C2C_INTF_DEBUG_TX_CTRL_t : C2C_INTF_C2C_DEBUG_TX_CTRL_t := (
                                                                           INHIBIT => '0',
                                                                           PCS_RESET => '0',
                                                                           PMA_RESET => '0',
                                                                           POLARITY => '0',
                                                                           POST_CURSOR => (others => '0'),
                                                                           PRBS_FORCE_ERR => '0',
                                                                           PRE_CURSOR => (others => '0'),
                                                                           PRBS_SEL => (others => '0'),
                                                                           DIFF_CTRL => (others => '0')
                                                                          );
  constant DEFAULT_C2C_INTF_DEBUG_CTRL_t : C2C_INTF_C2C_DEBUG_CTRL_t := (
                                                                     EYESCAN_RESET => '0',
                                                                     EYESCAN_TRIGGER => '0',
                                                                     PCS_RSV_DIN => (others => '0'),
                                                                     RX => DEFAULT_C2C_INTF_DEBUG_RX_CTRL_t,
                                                                     TX => DEFAULT_C2C_INTF_DEBUG_TX_CTRL_t
                                                                    );
  constant DEFAULT_C2C_INTF_COUNTERS_CTRL_t : C2C_INTF_C2C_COUNTERS_CTRL_t := (
                                                                           RESET_COUNTERS => '0'
                                                                          );
  constant DEFAULT_C2C_INTF_CTRL_t : C2C_INTF_C2C_CTRL_t := (
                                                         DRP => Default_C2C_INTF_DRP_MOSI_t,
                                                         STATUS => DEFAULT_C2C_INTF_STATUS_CTRL_t,
                                                         DEBUG => DEFAULT_C2C_INTF_DEBUG_CTRL_t,
                                                         COUNTERS => DEFAULT_C2C_INTF_COUNTERS_CTRL_t,
                                                         PHY_READ_TIME => x"4c4b40",
                                                         ENABLE_PHY_CTRL => '1',
                                                         PHY_LANE_STABLE => x"000ff",
                                                         PHY_LANE_ERRORS_TO_RESET => x"ff",
                                                         PHY_MAX_SINGLE_BIT_ERROR_RATE => x"0000ffff",
                                                         PHY_MAX_MULTI_BIT_ERROR_RATE => x"0000ffff"
                                                        );

end package C2C_INTF_CTRL_DEF;

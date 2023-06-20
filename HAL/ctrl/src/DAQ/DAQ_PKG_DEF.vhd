--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.DAQ_CTRL.all;


package DAQ_CTRL_DEF is
  constant DEFAULT_DAQ_action_CTRL_t : DAQ_action_CTRL_t := (
                                                             RESET => '0',
                                                             WR_EN => '0'
                                                            );
  constant DEFAULT_DAQ_wr_CTRL_t : DAQ_wr_CTRL_t := (
                                                     opening_offset => (others => '0'),
                                                     request_offset => (others => '0'),
                                                     closing_offset => (others => '0'),
                                                     window_timeout => (others => '0'),
                                                     busy_threshold => (others => '0')
                                                    );
  constant DEFAULT_DAQ_CTRL_t : DAQ_CTRL_t := (
                                               action => DEFAULT_DAQ_action_CTRL_t,
                                               wr => DEFAULT_DAQ_wr_CTRL_t
                                              );

end package DAQ_CTRL_DEF;

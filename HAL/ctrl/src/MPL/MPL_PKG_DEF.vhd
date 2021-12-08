--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;


package MPL_CTRL_DEF is
  constant DEFAULT_MPL_ACTIONS_CTRL_t : MPL_ACTIONS_CTRL_t := (
                                                               RESET => '0',
                                                               ENABLE => '0',
                                                               DISABLE => '0',
                                                               FREEZE => '0'
                                                              );
  constant DEFAULT_MPL_CONFIGS_CTRL_t : MPL_CONFIGS_CTRL_t := (
                                                               THREADS => x"3",
                                                               INPUT_EN => '1',
                                                               OUTPUT_EN => '1',
                                                               FLUSH_MEM_RESET => '1'
                                                              );
  constant DEFAULT_MPL_PL_MEM_PL_MEM_SIGNALS_CTRL_t : MPL_PL_MEM_PL_MEM_SIGNALS_CTRL_t := (
                                                                                           wr_req => '0',
                                                                                           wr_ack => '0',
                                                                                           rd_req => '0',
                                                                                           rd_ack => '0',
                                                                                           flush_req => '0',
                                                                                           freeze_req => '0',
                                                                                           mem_sel => "000"
                                                                                          );
  constant DEFAULT_MPL_PL_MEM_PL_MEM_wr_data_CTRL_t : MPL_PL_MEM_PL_MEM_wr_data_CTRL_t := (
                                                                                           wr_data_0 => (others => '0'),
                                                                                           wr_data_1 => (others => '0'),
                                                                                           wr_data_2 => (others => '0'),
                                                                                           wr_data_3 => (others => '0'),
                                                                                           wr_data_4 => (others => '0')
                                                                                          );
  constant DEFAULT_MPL_PL_MEM_PL_MEM_CTRL_t : MPL_PL_MEM_PL_MEM_CTRL_t := (
                                                                           SIGNALS => DEFAULT_MPL_PL_MEM_PL_MEM_SIGNALS_CTRL_t,
                                                                           wr_addr => (others => '0'),
                                                                           rd_addr => (others => '0'),
                                                                           wr_data => DEFAULT_MPL_PL_MEM_PL_MEM_wr_data_CTRL_t
                                                                          );
  constant DEFAULT_MPL_PL_MEM_CTRL_t : MPL_PL_MEM_CTRL_t := (
                                                             PL_MEM => (others => DEFAULT_MPL_PL_MEM_PL_MEM_CTRL_t )
                                                            );
  constant DEFAULT_MPL_CTRL_t : MPL_CTRL_t := (
                                               ACTIONS => DEFAULT_MPL_ACTIONS_CTRL_t,
                                               CONFIGS => DEFAULT_MPL_CONFIGS_CTRL_t,
                                               PL_MEM => DEFAULT_MPL_PL_MEM_CTRL_t
                                              );

end package MPL_CTRL_DEF;

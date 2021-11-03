--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.TAR_CTRL.all;


package TAR_CTRL_DEF is
  constant DEFAULT_TAR_ACTIONS_CTRL_t : TAR_ACTIONS_CTRL_t := (
                                                               RESET => '0',
                                                               ENABLE => '0',
                                                               DISABLE => '0',
                                                               FREEZE => '0'
                                                              );
  constant DEFAULT_TAR_CONFIGS_CTRL_t : TAR_CONFIGS_CTRL_t := (
                                                               INPUT_EN => '1',
                                                               OUTPUT_EN => '1',
                                                               FLUSH_MEM_RESET => '1'
                                                              );
  constant DEFAULT_TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_SIGNALS_CTRL_t : TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_SIGNALS_CTRL_t := (
                                                                                                                           wr_req => '0',
                                                                                                                           wr_ack => '0',
                                                                                                                           rd_req => '0',
                                                                                                                           rd_ack => '0',
                                                                                                                           flush_req => '0'
                                                                                                                          );
  constant DEFAULT_TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_wr_data_CTRL_t : TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_wr_data_CTRL_t := (
                                                                                                                           wr_data_0 => (others => '0'),
                                                                                                                           wr_data_1 => (others => '0')
                                                                                                                          );
  constant DEFAULT_TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_CTRL_t : TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_CTRL_t := (
                                                                                                           SIGNALS => DEFAULT_TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_SIGNALS_CTRL_t,
                                                                                                           wr_addr => (others => '0'),
                                                                                                           rd_addr => (others => '0'),
                                                                                                           wr_data => DEFAULT_TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_wr_data_CTRL_t
                                                                                                          );
  constant DEFAULT_TAR_PL_ST_PL_ST_PL_CHAMBER_CTRL_t : TAR_PL_ST_PL_ST_PL_CHAMBER_CTRL_t := (
                                                                                             PL_MEM => (others => DEFAULT_TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_CTRL_t )
                                                                                            );
  constant DEFAULT_TAR_PL_ST_PL_ST_CTRL_t : TAR_PL_ST_PL_ST_CTRL_t := (
                                                                       PL_CHAMBER => DEFAULT_TAR_PL_ST_PL_ST_PL_CHAMBER_CTRL_t
                                                                      );
  constant DEFAULT_TAR_PL_ST_CTRL_t : TAR_PL_ST_CTRL_t := (
                                                           PL_ST => (others => DEFAULT_TAR_PL_ST_PL_ST_CTRL_t )
                                                          );
  constant DEFAULT_TAR_CTRL_t : TAR_CTRL_t := (
                                               ACTIONS => DEFAULT_TAR_ACTIONS_CTRL_t,
                                               CONFIGS => DEFAULT_TAR_CONFIGS_CTRL_t,
                                               PL_ST => DEFAULT_TAR_PL_ST_CTRL_t
                                              );

end package TAR_CTRL_DEF;

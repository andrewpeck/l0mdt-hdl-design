--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.MEM_INT_12A148D_CTRL.all;


package MEM_INT_12A148D_CTRL_DEF is
  constant DEFAULT_MEM_INT_12A148D_SIGNALS_CTRL_t : MEM_INT_12A148D_SIGNALS_CTRL_t := (
                                                                                       wr_req => '0',
                                                                                       wr_ack => '0',
                                                                                       rd_req => '0',
                                                                                       rd_ack => '0',
                                                                                       flush_req => '0'
                                                                                      );
  constant DEFAULT_MEM_INT_12A148D_wr_data_CTRL_t : MEM_INT_12A148D_wr_data_CTRL_t := (
                                                                                       wr_data_0 => (others => '0'),
                                                                                       wr_data_1 => (others => '0'),
                                                                                       wr_data_2 => (others => '0'),
                                                                                       wr_data_3 => (others => '0'),
                                                                                       wr_data_4 => (others => '0')
                                                                                      );
  constant DEFAULT_MEM_INT_12A148D_CTRL_t : MEM_INT_12A148D_CTRL_t := (
                                                                       SIGNALS => DEFAULT_MEM_INT_12A148D_SIGNALS_CTRL_t,
                                                                       wr_addr => (others => '0'),
                                                                       rd_addr => (others => '0'),
                                                                       wr_data => DEFAULT_MEM_INT_12A148D_wr_data_CTRL_t
                                                                      );

end package MEM_INT_12A148D_CTRL_DEF;

--This file was auto-generated.
--Modifications might be lost.
-- Created : 2021-07-21 11:45:59.675565.
library IEEE;
use IEEE.std_logic_1164.all;

library ctrl_lib;
use ctrl_lib.MEM_INT_4A17D_CTRL.all;


package MEM_INT_4A17D_CTRL_DEF is
  constant DEFAULT_MEM_INT_4A17D_wr_data_CTRL_t : MEM_INT_4A17D_wr_data_CTRL_t := (
                                                                                   wr_data_0 => (others => '0')
                                                                                  );
  constant DEFAULT_MEM_INT_4A17D_CTRL_t : MEM_INT_4A17D_CTRL_t := (
                                                                   flush_req => '0',
                                                                   wr_req => '0',
                                                                   wr_ack => '0',
                                                                   wr_addr => (others => '0'),
                                                                   rd_ack => '0',
                                                                   rd_req => '0',
                                                                   rd_addr => (others => '0'),
                                                                   wr_data => DEFAULT_MEM_INT_4A17D_wr_data_CTRL_t
                                                                  );


end package MEM_INT_4A17D_CTRL_DEF;
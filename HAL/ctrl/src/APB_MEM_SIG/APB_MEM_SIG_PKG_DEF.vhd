--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.APB_MEM_SIG_CTRL.all;


package APB_MEM_SIG_CTRL_DEF is
  constant DEFAULT_APB_MEM_SIG_CTRL_t : APB_MEM_SIG_CTRL_t := (
                                                               wr_req => '0',
                                                               wr_ack => '0',
                                                               rd_req => '0',
                                                               rd_ack => '0',
                                                               flush_req => '0',
                                                               freeze_req => '0',
                                                               mem_sel => "000"
                                                              );

end package APB_MEM_SIG_CTRL_DEF;

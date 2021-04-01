--This file was auto-generated.
--Modifications might be lost.
-- Created : 2021-04-01 21:30:45.355338.
library IEEE;
use IEEE.std_logic_1164.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;


package H2S_CTRL_DEF is
  constant DEFAULT_H2S_HPS_LSF_LSF_CTRL_t : H2S_HPS_LSF_LSF_CTRL_t := (
                                                                       RESET => '0',
                                                                       sb_lsf_mdt_hits_re => '0',
                                                                       HBA_MAX_CLOCKS => "0010000000",
                                                                       sb_lsf_mdt_hits_raddr => (others => '0'),
                                                                       sb_lsf_mdt_hits_freeze => '0'
                                                                      );
  constant DEFAULT_H2S_HPS_LSF_CTRL_t : H2S_HPS_LSF_CTRL_t := (
                                                               LSF => (others => DEFAULT_H2S_HPS_LSF_LSF_CTRL_t )
                                                              );
  constant DEFAULT_H2S_HPS_CSF_CSF_CTRL_t : H2S_HPS_CSF_CSF_CTRL_t := (
                                                                       RESET => '0'
                                                                      );
  constant DEFAULT_H2S_HPS_CSF_CTRL_t : H2S_HPS_CSF_CTRL_t := (
                                                               CSF => (others => DEFAULT_H2S_HPS_CSF_CSF_CTRL_t )
                                                              );
  constant DEFAULT_H2S_HPS_CTRL_t : H2S_HPS_CTRL_t := (
                                                       RESET => '0',
                                                       LSF => DEFAULT_H2S_HPS_LSF_CTRL_t,
                                                       CSF => DEFAULT_H2S_HPS_CSF_CTRL_t
                                                      );
  constant DEFAULT_H2S_CTRL_t : H2S_CTRL_t := (
                                               HPS => (others => DEFAULT_H2S_HPS_CTRL_t )
                                              );


end package H2S_CTRL_DEF;
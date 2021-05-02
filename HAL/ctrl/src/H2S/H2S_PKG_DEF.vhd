--This file was auto-generated.
--Modifications might be lost.
-- Created : 2021-05-02 23:06:55.013260.
library IEEE;
use IEEE.std_logic_1164.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;


package H2S_CTRL_DEF is
  constant DEFAULT_H2S_HPS_ACTIONS_CTRL_t : H2S_HPS_ACTIONS_CTRL_t := (
                                                                       RESET => '0',
                                                                       DISABLE => '0',
                                                                       ENABLE => '0',
                                                                       FREEZE => '0'
                                                                      );
  constant DEFAULT_H2S_HPS_CONFIGS_CTRL_t : H2S_HPS_CONFIGS_CTRL_t := (
                                                                       INPUT_EN => '1',
                                                                       THREADS => x"3",
                                                                       OUTPUT_EN => '1',
                                                                       FLUSH_MEM_RESET => '1'
                                                                      );
  constant DEFAULT_H2S_HPS_MDT_TC_MDT_TC_wr_data_CTRL_t : H2S_HPS_MDT_TC_MDT_TC_wr_data_CTRL_t := (
                                                                                                   wr_data_0 => (others => '0')
                                                                                                  );
  constant DEFAULT_H2S_HPS_MDT_TC_MDT_TC_CTRL_t : H2S_HPS_MDT_TC_MDT_TC_CTRL_t := (
                                                                                   flush_req => '0',
                                                                                   wr_req => '0',
                                                                                   wr_ack => '0',
                                                                                   wr_addr => (others => '0'),
                                                                                   rd_ack => '0',
                                                                                   rd_req => '0',
                                                                                   rd_addr => (others => '0'),
                                                                                   wr_data => DEFAULT_H2S_HPS_MDT_TC_MDT_TC_wr_data_CTRL_t
                                                                                  );
  constant DEFAULT_H2S_HPS_MDT_TC_CTRL_t : H2S_HPS_MDT_TC_CTRL_t := (
                                                                     MDT_TC => (others => DEFAULT_H2S_HPS_MDT_TC_MDT_TC_CTRL_t )
                                                                    );
  constant DEFAULT_H2S_HPS_MDT_T0_MDT_T0_wr_data_CTRL_t : H2S_HPS_MDT_T0_MDT_T0_wr_data_CTRL_t := (
                                                                                                   wr_data_0 => (others => '0')
                                                                                                  );
  constant DEFAULT_H2S_HPS_MDT_T0_MDT_T0_CTRL_t : H2S_HPS_MDT_T0_MDT_T0_CTRL_t := (
                                                                                   flush_req => '0',
                                                                                   wr_req => '0',
                                                                                   wr_ack => '0',
                                                                                   wr_addr => (others => '0'),
                                                                                   rd_ack => '0',
                                                                                   rd_req => '0',
                                                                                   rd_addr => (others => '0'),
                                                                                   wr_data => DEFAULT_H2S_HPS_MDT_T0_MDT_T0_wr_data_CTRL_t
                                                                                  );
  constant DEFAULT_H2S_HPS_MDT_T0_CTRL_t : H2S_HPS_MDT_T0_CTRL_t := (
                                                                     MDT_T0 => (others => DEFAULT_H2S_HPS_MDT_T0_MDT_T0_CTRL_t )
                                                                    );
  constant DEFAULT_H2S_HPS_HEG_HEG_ACTIONS_CTRL_t : H2S_HPS_HEG_HEG_ACTIONS_CTRL_t := (
                                                                                       RESET => '0',
                                                                                       DISABLE => '0',
                                                                                       ENABLE => '0',
                                                                                       FREEZE => '0'
                                                                                      );
  constant DEFAULT_H2S_HPS_HEG_HEG_CONFIGS_CTRL_t : H2S_HPS_HEG_HEG_CONFIGS_CTRL_t := (
                                                                                       INPUT_EN => '1',
                                                                                       OUTPUT_EN => '1',
                                                                                       FLUSH_MEM_RESET => '1'
                                                                                      );
  constant DEFAULT_H2S_HPS_HEG_HEG_COUNTERS_CTRL_t : H2S_HPS_HEG_HEG_COUNTERS_CTRL_t := (
                                                                                         READY => (others => '0'),
                                                                                         ENABLED => (others => '0'),
                                                                                         ERROR => (others => '0')
                                                                                        );
  constant DEFAULT_H2S_HPS_HEG_HEG_HP_HP_ACTIONS_CTRL_t : H2S_HPS_HEG_HEG_HP_HP_ACTIONS_CTRL_t := (
                                                                                                   RESET => '0',
                                                                                                   DISABLE => '0',
                                                                                                   ENABLE => '0',
                                                                                                   FREEZE => '0'
                                                                                                  );
  constant DEFAULT_H2S_HPS_HEG_HEG_HP_HP_CONFIGS_CTRL_t : H2S_HPS_HEG_HEG_HP_HP_CONFIGS_CTRL_t := (
                                                                                                   INPUT_EN => '1',
                                                                                                   OUTPUT_EN => '1',
                                                                                                   FLUSH_MEM_RESET => '1'
                                                                                                  );
  constant DEFAULT_H2S_HPS_HEG_HEG_HP_HP_CTRL_t : H2S_HPS_HEG_HEG_HP_HP_CTRL_t := (
                                                                                   CONFIGS => DEFAULT_H2S_HPS_HEG_HEG_HP_HP_CONFIGS_CTRL_t,
                                                                                   ACTIONS => DEFAULT_H2S_HPS_HEG_HEG_HP_HP_ACTIONS_CTRL_t
                                                                                  );
  constant DEFAULT_H2S_HPS_HEG_HEG_HP_CTRL_t : H2S_HPS_HEG_HEG_HP_CTRL_t := (
                                                                             HP => (others => DEFAULT_H2S_HPS_HEG_HEG_HP_HP_CTRL_t )
                                                                            );
  constant DEFAULT_H2S_HPS_HEG_HEG_CTRL_t : H2S_HPS_HEG_HEG_CTRL_t := (
                                                                       CONFIGS => DEFAULT_H2S_HPS_HEG_HEG_CONFIGS_CTRL_t,
                                                                       HP => DEFAULT_H2S_HPS_HEG_HEG_HP_CTRL_t,
                                                                       ACTIONS => DEFAULT_H2S_HPS_HEG_HEG_ACTIONS_CTRL_t,
                                                                       COUNTERS => DEFAULT_H2S_HPS_HEG_HEG_COUNTERS_CTRL_t
                                                                      );
  constant DEFAULT_H2S_HPS_HEG_CTRL_t : H2S_HPS_HEG_CTRL_t := (
                                                               HEG => (others => DEFAULT_H2S_HPS_HEG_HEG_CTRL_t )
                                                              );
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
                                                       LSF => DEFAULT_H2S_HPS_LSF_CTRL_t,
                                                       MDT_TC => DEFAULT_H2S_HPS_MDT_TC_CTRL_t,
                                                       CSF => DEFAULT_H2S_HPS_CSF_CTRL_t,
                                                       ACTIONS => DEFAULT_H2S_HPS_ACTIONS_CTRL_t,
                                                       MDT_T0 => DEFAULT_H2S_HPS_MDT_T0_CTRL_t,
                                                       HEG => DEFAULT_H2S_HPS_HEG_CTRL_t,
                                                       CONFIGS => DEFAULT_H2S_HPS_CONFIGS_CTRL_t
                                                      );
  constant DEFAULT_H2S_CTRL_t : H2S_CTRL_t := (
                                               HPS => (others => DEFAULT_H2S_HPS_CTRL_t )
                                              );


end package H2S_CTRL_DEF;
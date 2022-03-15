--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.HEG_CTRL.all;


package HEG_CTRL_DEF is
  constant DEFAULT_HEG_SUPER_ACTIONS_CTRL_t : HEG_SUPER_ACTIONS_CTRL_t := (
                                                                           RESET => '0',
                                                                           ENABLE => '0',
                                                                           DISABLE => '0',
                                                                           FREEZE => '0'
                                                                          );
  constant DEFAULT_HEG_SUPER_CONFIGS_CTRL_t : HEG_SUPER_CONFIGS_CTRL_t := (
                                                                           INPUT_EN => '1',
                                                                           OUTPUT_EN => '1',
                                                                           FLUSH_MEM_RESET => '1'
                                                                          );
  constant DEFAULT_HEG_SUPER_CTRL_t : HEG_SUPER_CTRL_t := (
                                                           ACTIONS => DEFAULT_HEG_SUPER_ACTIONS_CTRL_t,
                                                           CONFIGS => DEFAULT_HEG_SUPER_CONFIGS_CTRL_t
                                                          );
  constant DEFAULT_HEG_CTRL_ROI_TC_SIGNALS_CTRL_t : HEG_CTRL_ROI_TC_SIGNALS_CTRL_t := (
                                                                                       wr_req => '0',
                                                                                       wr_ack => '0',
                                                                                       rd_req => '0',
                                                                                       rd_ack => '0',
                                                                                       flush_req => '0',
                                                                                       freeze_req => '0',
                                                                                       mem_sel => "000"
                                                                                      );
  constant DEFAULT_HEG_CTRL_ROI_TC_wr_data_CTRL_t : HEG_CTRL_ROI_TC_wr_data_CTRL_t := (
                                                                                       wr_data_0 => (others => '0'),
                                                                                       wr_data_1 => (others => '0')
                                                                                      );
  constant DEFAULT_HEG_CTRL_ROI_TC_CTRL_t : HEG_CTRL_ROI_TC_CTRL_t := (
                                                                       SIGNALS => DEFAULT_HEG_CTRL_ROI_TC_SIGNALS_CTRL_t,
                                                                       wr_addr => (others => '0'),
                                                                       rd_addr => (others => '0'),
                                                                       wr_data => DEFAULT_HEG_CTRL_ROI_TC_wr_data_CTRL_t
                                                                      );
  constant DEFAULT_HEG_CTRL_CTRL_t : HEG_CTRL_CTRL_t := (
                                                         ROI_TC => DEFAULT_HEG_CTRL_ROI_TC_CTRL_t
                                                        );
  constant DEFAULT_HEG_HP_HP_ACTIONS_CTRL_t : HEG_HP_HP_ACTIONS_CTRL_t := (
                                                                           RESET => '0',
                                                                           ENABLE => '0',
                                                                           DISABLE => '0',
                                                                           FREEZE => '0'
                                                                          );
  constant DEFAULT_HEG_HP_HP_CONFIGS_CTRL_t : HEG_HP_HP_CONFIGS_CTRL_t := (
                                                                           INPUT_EN => '1',
                                                                           OUTPUT_EN => '1',
                                                                           FLUSH_MEM_RESET => '1'
                                                                          );
  constant DEFAULT_HEG_HP_HP_MDT_DT2R_SIGNALS_CTRL_t : HEG_HP_HP_MDT_DT2R_SIGNALS_CTRL_t := (
                                                                                             wr_req => '0',
                                                                                             wr_ack => '0',
                                                                                             rd_req => '0',
                                                                                             rd_ack => '0',
                                                                                             flush_req => '0',
                                                                                             freeze_req => '0',
                                                                                             mem_sel => "000"
                                                                                            );
  constant DEFAULT_HEG_HP_HP_MDT_DT2R_wr_data_CTRL_t : HEG_HP_HP_MDT_DT2R_wr_data_CTRL_t := (
                                                                                             wr_data_0 => (others => '0')
                                                                                            );
  constant DEFAULT_HEG_HP_HP_MDT_DT2R_CTRL_t : HEG_HP_HP_MDT_DT2R_CTRL_t := (
                                                                             SIGNALS => DEFAULT_HEG_HP_HP_MDT_DT2R_SIGNALS_CTRL_t,
                                                                             wr_addr => '0',
                                                                             rd_addr => '0',
                                                                             wr_data => DEFAULT_HEG_HP_HP_MDT_DT2R_wr_data_CTRL_t
                                                                            );
  constant DEFAULT_HEG_HP_HP_CTRL_t : HEG_HP_HP_CTRL_t := (
                                                           ACTIONS => DEFAULT_HEG_HP_HP_ACTIONS_CTRL_t,
                                                           CONFIGS => DEFAULT_HEG_HP_HP_CONFIGS_CTRL_t,
                                                           MDT_DT2R => DEFAULT_HEG_HP_HP_MDT_DT2R_CTRL_t
                                                          );
  constant DEFAULT_HEG_HP_CTRL_t : HEG_HP_CTRL_t := (
                                                     HP => (others => DEFAULT_HEG_HP_HP_CTRL_t )
                                                    );
  constant DEFAULT_HEG_CTRL_t : HEG_CTRL_t := (
                                               SUPER => DEFAULT_HEG_SUPER_CTRL_t,
                                               CTRL => DEFAULT_HEG_CTRL_CTRL_t,
                                               HP => DEFAULT_HEG_HP_CTRL_t
                                              );

end package HEG_CTRL_DEF;

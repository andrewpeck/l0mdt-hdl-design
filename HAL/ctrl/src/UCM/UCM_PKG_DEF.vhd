--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;
library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;


package UCM_CTRL_DEF is
  constant DEFAULT_UCM_SUPER_ACTIONS_CTRL_t : UCM_SUPER_ACTIONS_CTRL_t := (
                                                                           RESET => '0',
                                                                           ENABLE => '0',
                                                                           DISABLE => '0',
                                                                           FREEZE => '0'
                                                                          );
  constant DEFAULT_UCM_SUPER_CONFIGS_CTRL_t : UCM_SUPER_CONFIGS_CTRL_t := (
                                                                           THREADS => x"3",
                                                                           INPUT_EN => '1',
                                                                           OUTPUT_EN => '1'
                                                                          );
  constant DEFAULT_UCM_SUPER_SECTOR_PHI_CTRL_t : UCM_SUPER_SECTOR_PHI_CTRL_t := (
                                                                                 wr_req => '0',
                                                                                 rd_req => '0',
                                                                                 wr_data => (others => '0')
                                                                                );
  constant DEFAULT_UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t : UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t := (
                                                                                                               wr_req => '0',
                                                                                                               rd_req => '0',
                                                                                                               wr_addr => (others => '0'),
                                                                                                               rd_addr => (others => '0'),
                                                                                                               wr_data => (others => '0')
                                                                                                              );
  constant DEFAULT_UCM_SUPER_CDE_CHAMB_Z0_CTRL_t : UCM_SUPER_CDE_CHAMB_Z0_CTRL_t := (
                                                                                     CDE_CHAMB_Z0 => (others => DEFAULT_UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t )
                                                                                    );
  constant DEFAULT_UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t : UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t := (
                                                                                                               wr_req => '0',
                                                                                                               rd_req => '0',
                                                                                                               wr_addr => (others => '0'),
                                                                                                               rd_addr => (others => '0'),
                                                                                                               wr_data => (others => '0')
                                                                                                              );
  constant DEFAULT_UCM_SUPER_CVP_CHAMB_Z0_CTRL_t : UCM_SUPER_CVP_CHAMB_Z0_CTRL_t := (
                                                                                     CVP_CHAMB_Z0 => (others => DEFAULT_UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t )
                                                                                    );
  constant DEFAULT_UCM_SUPER_CTRL_t : UCM_SUPER_CTRL_t := (
                                                           ACTIONS => DEFAULT_UCM_SUPER_ACTIONS_CTRL_t,
                                                           CONFIGS => DEFAULT_UCM_SUPER_CONFIGS_CTRL_t,
                                                           SECTOR_PHI => DEFAULT_UCM_SUPER_SECTOR_PHI_CTRL_t,
                                                           CDE_CHAMB_Z0 => DEFAULT_UCM_SUPER_CDE_CHAMB_Z0_CTRL_t,
                                                           CVP_CHAMB_Z0 => DEFAULT_UCM_SUPER_CVP_CHAMB_Z0_CTRL_t
                                                          );
  constant DEFAULT_UCM_R_PHI_COMP_RPC_MEM_INTERFACE_CTRL_t : UCM_R_PHI_COMP_RPC_MEM_INTERFACE_CTRL_t := (
                                                                                                         wr_req => '0',
                                                                                                         rd_req => '0',
                                                                                                         wr_addr => (others => '0'),
                                                                                                         rd_addr => (others => '0'),
                                                                                                         wr_data => (others => '0')
                                                                                                        );
  constant DEFAULT_UCM_R_PHI_COMP_RPC_CTRL_t : UCM_R_PHI_COMP_RPC_CTRL_t := (
                                                                             sel_thread => x"0",
                                                                             sel_station => x"0",
                                                                             sel_layer => x"0",
                                                                             ext_ctrl => '0',
                                                                             MEM_INTERFACE => DEFAULT_UCM_R_PHI_COMP_RPC_MEM_INTERFACE_CTRL_t
                                                                            );
  constant DEFAULT_UCM_R_PHI_COMP_MDT_MEM_INTERFACE_CTRL_t : UCM_R_PHI_COMP_MDT_MEM_INTERFACE_CTRL_t := (
                                                                                                         wr_req => '0',
                                                                                                         rd_req => '0',
                                                                                                         wr_addr => (others => '0'),
                                                                                                         rd_addr => (others => '0'),
                                                                                                         wr_data => (others => '0')
                                                                                                        );
  constant DEFAULT_UCM_R_PHI_COMP_MDT_CTRL_t : UCM_R_PHI_COMP_MDT_CTRL_t := (
                                                                             sel_thread => x"0",
                                                                             sel_station => x"0",
                                                                             sel_layer => x"0",
                                                                             ext_ctrl => '0',
                                                                             MEM_INTERFACE => DEFAULT_UCM_R_PHI_COMP_MDT_MEM_INTERFACE_CTRL_t
                                                                            );
  constant DEFAULT_UCM_R_PHI_COMP_CTRL_t : UCM_R_PHI_COMP_CTRL_t := (
                                                                     RPC => DEFAULT_UCM_R_PHI_COMP_RPC_CTRL_t,
                                                                     MDT => DEFAULT_UCM_R_PHI_COMP_MDT_CTRL_t
                                                                    );
  constant DEFAULT_UCM_CTRL_t : UCM_CTRL_t := (
                                               SUPER => DEFAULT_UCM_SUPER_CTRL_t,
                                               R_PHI_COMP => DEFAULT_UCM_R_PHI_COMP_CTRL_t
                                              );

end package UCM_CTRL_DEF;

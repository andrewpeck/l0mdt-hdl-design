--This file was auto-generated.
--Modifications might be lost.
-- Created : 2021-04-03 16:04:08.392889.
library IEEE;
use IEEE.std_logic_1164.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;


package UCM_CTRL_DEF is
  constant DEFAULT_UCM_ACTIONS_CTRL_t : UCM_ACTIONS_CTRL_t := (
                                                               RESET => '0',
                                                               DISABLE => '0',
                                                               ENABLE => '0',
                                                               FREEZE => '0'
                                                              );
  constant DEFAULT_UCM_CONFIGS_CTRL_t : UCM_CONFIGS_CTRL_t := (
                                                               INPUT_EN => '1',
                                                               THREADS => x"3",
                                                               OUTPUT_EN => '1'
                                                              );
  constant DEFAULT_UCM_SECTOR_PHI_CTRL_t : UCM_SECTOR_PHI_CTRL_t := (
                                                                     wr_req => '0',
                                                                     rd_req => '0',
                                                                     wr_data => (others => '0')
                                                                    );
  constant DEFAULT_UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t : UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t := (
                                                                                                   wr_addr => (others => '0'),
                                                                                                   rd_addr => (others => '0'),
                                                                                                   wr_req => '0',
                                                                                                   rd_req => '0',
                                                                                                   wr_data => (others => '0')
                                                                                                  );
  constant DEFAULT_UCM_CDE_CHAMB_Z0_CTRL_t : UCM_CDE_CHAMB_Z0_CTRL_t := (
                                                                         CDE_CHAMB_Z0 => (others => DEFAULT_UCM_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t )
                                                                        );
  constant DEFAULT_UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t : UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t := (
                                                                                                   wr_addr => (others => '0'),
                                                                                                   rd_addr => (others => '0'),
                                                                                                   wr_req => '0',
                                                                                                   rd_req => '0',
                                                                                                   wr_data => (others => '0')
                                                                                                  );
  constant DEFAULT_UCM_CVP_CHAMB_Z0_CTRL_t : UCM_CVP_CHAMB_Z0_CTRL_t := (
                                                                         CVP_CHAMB_Z0 => (others => DEFAULT_UCM_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t )
                                                                        );
  constant DEFAULT_UCM_CTRL_t : UCM_CTRL_t := (
                                               CVP_CHAMB_Z0 => DEFAULT_UCM_CVP_CHAMB_Z0_CTRL_t,
                                               CDE_CHAMB_Z0 => DEFAULT_UCM_CDE_CHAMB_Z0_CTRL_t,
                                               CONFIGS => DEFAULT_UCM_CONFIGS_CTRL_t,
                                               SECTOR_PHI => DEFAULT_UCM_SECTOR_PHI_CTRL_t,
                                               ACTIONS => DEFAULT_UCM_ACTIONS_CTRL_t
                                              );


end package UCM_CTRL_DEF;
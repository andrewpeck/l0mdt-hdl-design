--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_top.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_top.vhd
-- -----
-- File Created: Thursday, 16th November 2023 9:39:07 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 16th November 2023 9:39:28 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

-- use shared_lib.fct_barrel_chamb_z2origin_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

-- library ctrl_lib;
-- use ctrl_lib.UCM_CTRL.all;

-- library vamc_lib;

entity ucm_top is
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    glob_en                 : in std_logic;
    ttc_commands            : in l0mdt_ttc_rt;
    -- configuration, control & Monitoring
    ctrl_v              : in  std_logic_vector;--UCM_CTRL_t;
    mon_v               : out std_logic_vector;--UCM_MON_t;
    -- SLc in
    i_slc_data_mainA_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_mainB_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_neighborA_v  : in slc_rx_vt;
    i_slc_data_neighborB_v  : in slc_rx_vt;
    -- to TAR
    o_uCM2tar_inn_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_mid_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_out_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_ext_av        : out ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    -- to hps
    o_uCM2hps_inn_av        : out ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2hps_mid_av        : out ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2hps_out_av        : out ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2hps_ext_av        : out ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    -- pipeline
    o_uCM2pl_av             : out ucm2pl_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity ucm_top;

architecture beh of ucm_top is

begin

  ver : if <conditional> generate
    UCM : entity ucm_lib.ucm
      port map(
        clk                     => clk,
        rst                     => rst,
        glob_en                 => glob_en,
        ttc_commands            => ttc_commands, 
        -- configuration, control & Monitoring
        ctrl_v                    => ctrl_v,
        mon_v                     => mon_v,
        -- SLc in
        i_slc_data_mainA_av     => i_slc_data_mainA_av,
        i_slc_data_mainB_av     => i_slc_data_mainB_av,
        i_slc_data_neighborA_v  => i_slc_data_neighborA_v,
        i_slc_data_neighborB_v  => i_slc_data_neighborB_v,
        -- pam out
        o_uCM2tar_inn_av        => o_uCM2tar_inn_av,
        o_uCM2tar_mid_av        => o_uCM2tar_mid_av,
        o_uCM2tar_out_av        => o_uCM2tar_out_av,
        o_uCM2tar_ext_av        => o_uCM2tar_ext_av,
        -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
        o_uCM2hps_inn_av        => o_uCM2hps_inn_av,
        o_uCM2hps_mid_av        => o_uCM2hps_mid_av,
        o_uCM2hps_out_av        => o_uCM2hps_out_av,
        o_uCM2hps_ext_av        => o_uCM2hps_ext_av,
        -- MDT hit
        o_uCM2pl_av             => o_uCM2pl_av
      );
      end generate;

  

end architecture;
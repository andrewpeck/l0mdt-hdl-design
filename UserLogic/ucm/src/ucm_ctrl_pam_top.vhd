--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_ctrl_pam_top.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_ctrl_pam_top.vhd
-- -----
-- File Created: Sunday, 19th November 2023 9:05:23 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Sunday, 19th November 2023 9:05:40 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;

library  vamc_lib;


entity ucm_ctrl_pam_top is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    -- Ctrl
    i_num_cand          : in unsigned(3 downto 0);
    i_pam_update        : in std_logic;
    o_proc_info_av      : out ucm_proc_info_avt(c_MAX_NUM_SL -1 downto 0);
    o_cvp_rst           : out std_logic_vector(c_NUM_ACCEPTS -1 downto 0);
    o_cvp_ctrl          : out std_logic_vector(c_NUM_ACCEPTS -1 downto 0);
    -- Data
    i_data              : in  ucm_cde_avt(c_NUM_ACCEPTS -1 downto 0);
    o_data              : out ucm_cde_avt(c_NUM_ACCEPTS -1 downto 0)
    
  );
end entity;

architecture rtl of ucm_ctrl_pam_top is
  signal pam_CSW_control      : ucm_pam_control_art(c_NUM_ACCEPTS -1 downto 0);
  signal pam_CSW_control_dv  : std_logic;

begin

  PAM_CTRL : entity ucm_lib.ucm_ctrl_pam_main
  port map(
    clk                 => clk,
    rst                 => rst,
    ena                 => ena,
    --
    i_num_cand          => i_num_cand,
    i_pam_update        => i_pam_update,
    --
    o_pam_ctrl          => pam_CSW_control,
    o_pam_ctrl_dv       => pam_CSW_control_dv,
    o_proc_info_av      => o_proc_info_av,
    --
    o_cvp_rst           => o_cvp_rst,
    o_cvp_ctrl          => o_cvp_ctrl
  );

  SLC_PAM_CSW : entity ucm_lib.ucm_ctrl_pam_csw
    port map(
      clk         => clk,
      rst         => rst,
      glob_en     => ena,
      
      i_control   => pam_CSW_control,
      -- data
      i_data      => i_data,
      o_data      => o_data
    );

end architecture;
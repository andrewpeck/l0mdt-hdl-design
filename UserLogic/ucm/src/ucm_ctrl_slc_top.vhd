--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_csw_main_top.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_csw_main_top.vhd
-- -----
-- File Created: Sunday, 19th November 2023 7:34:00 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Sunday, 19th November 2023 7:34:05 pm
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

entity ucm_ctrl_slc_top is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av       : in slc_rx_avt(c_MAX_NUM_SL -1 downto 0);
    --
    o_num_cand          : out unsigned(3 downto 0);
    o_pam_update        : out std_logic;
    --
    o_data_av           : out slc_rx_avt(c_MAX_NUM_SL -1 downto 0);
    o_dv                : out std_logic
    
  );
end entity;

architecture beh of ucm_ctrl_slc_top is

  signal i_slc_data_ar        : slc_rx_art(c_MAX_NUM_SL -1 downto 0);

  signal prepro2ctrl_av       : ucm_prepro2ctrl_avt(c_MAX_NUM_SL -1 downto 0);
  signal prepro2ctrl_ar       : ucm_prepro2ctrl_art(c_MAX_NUM_SL -1 downto 0);

  signal csw_ctrl_av    : ucm_csw_control_avt(c_MAX_NUM_SL -1 downto 0);
  signal csw_ctrl_dv    : std_logic;

  signal csw_main_in_av       : slc_rx_avt(c_MAX_NUM_SL -1 downto 0);
  signal csw_main_in_adv      : std_logic_vector(c_MAX_NUM_SL -1 downto 0);
  signal csw_main_in_dv       : std_logic;

begin

  I_SLC_CONV: for sl_i in 0 to c_MAX_NUM_SL - 1 generate
    i_slc_data_ar(sl_i)<= convert(i_slc_data_av(sl_i),i_slc_data_ar(sl_i));
    prepro2ctrl_ar(sl_i).data_valid <= i_slc_data_ar(sl_i).data_valid;
    prepro2ctrl_av(sl_i)<= convert(prepro2ctrl_ar(sl_i),prepro2ctrl_av(sl_i));

  end generate;

  MAIN_CTRL : entity ucm_lib.ucm_ctrl_slc_main
  port map(
    clk                 => clk,
    rst                 => rst,
    ena                 => ena,
    -- DATA
    i_data              => prepro2ctrl_av,
    o_csw_ctrl_av       => csw_ctrl_av,
    o_csw_ctrl_dv       => csw_ctrl_dv,
    -- PAM
    o_num_cand          => o_num_cand,
    o_pam_update        => o_pam_update
  );

  SLC_PP_A : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    PL_slope : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES    => 2,
      g_PIPELINE_WIDTH  => i_slc_data_av(sl_i)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      i_data      => i_slc_data_av(sl_i),
      i_dv        => i_slc_data_ar(sl_i).data_valid,
      o_data      => csw_main_in_av(sl_i),
      o_dv        => csw_main_in_adv(sl_i)
    );
    -- SLC_PP : entity ucm_lib.ucm_prepro
    -- generic map(
    --   g_DELAY_CYCLES  => 2
    -- )
    -- port map(
    --   clk               => clk,
    --   rst               => local_rst,
    --   ena               => local_en,
    --   --                =>
    --   i_slc_data_v      => i_slc_data_av(sl_i),
    --   o_prepro2ctrl_v   => prepro2ctrl_av(sl_i),
    --   o_prepro_data_v   => csw_main_in_av(sl_i)
    -- );
  end generate;

    csw_main_in_dv <= or_reduce(csw_main_in_adv);

  SLC_CSW : entity ucm_lib.ucm_ctrl_slc_csw
    port map(
      clk         => clk,
      rst         => rst,
      glob_en     => ena,
      
      i_control_av   => csw_ctrl_av,
      -- data
      i_data_av   => csw_main_in_av,--csw_main_in_av,
      i_dv        => csw_main_in_dv,
      o_data_av   => o_data_av,
      o_dv        => o_dv
    );

end architecture;







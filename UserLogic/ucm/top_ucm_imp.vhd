--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ucm
-- File: top_ucm_imp.vhd
-- Module: <<moduleName>>
-- File PATH: /top_ucm_imp.vhd
-- -----
-- File Created: Wednesday, 24th May 2023 8:11:53 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 24th May 2023 4:57:26 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.cfg_display_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;


entity top_ucm is
  generic (
    g_MAINDIVTYPE : string := "IP"
  );
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    glob_en                 : in std_logic;
    ttc_commands            : in l0mdt_ttc_rt;
    -- i_debug                 : in std_logic;
    -- -- configuration, control & Monitoring
    ctrl_b                    : in  std_logic;
    mon_b                     : out std_logic;
    -- -- SLc in
    i_slc_data_mainA_ab     : in std_logic_vector(2 downto 0);
    i_slc_data_mainB_ab     : in std_logic_vector(2 downto 0);
    i_slc_data_neighborA_b  : in std_logic;
    i_slc_data_neighborB_b  : in std_logic;
    -- -- to tar
    o_uCM2tar_inn_ab        : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    o_uCM2tar_mid_ab        : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    o_uCM2tar_out_ab        : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    o_uCM2tar_ext_ab        : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    -- -- to hps
    o_uCM2hps_inn_ab        : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_mid_ab        : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_out_ab        : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_ext_ab        : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    -- -- pipeline
    o_uCM2pl_ab             : out std_logic_vector(c_MAX_NUM_SL -1 downto 0)
    -- o_sump                      :  out std_logic
  );
end entity top_ucm;

architecture beh of top_ucm is

  signal ctrl_r            : UCM_CTRL_t;
  signal mon_r             : UCM_MON_t;
  -- constant  c_CTRL_LEN :  integer := len(ctrl_r);--394;
  -- constant c_MON_LEN : integer := len(mon_r);--184;
  signal ctrl_v            : std_logic_vector(UCM_CTRL_t'w -1 downto 0);
  signal mon_v             : std_logic_vector(UCM_MON_t'w -1 downto 0);

  signal i_slc_data_mainA_av     : slc_rx_avt(2 downto 0);
  signal i_slc_data_mainB_av     : slc_rx_avt(2 downto 0);
  signal i_slc_data_neighborA_v  : slc_rx_vt;
  signal i_slc_data_neighborB_v  : slc_rx_vt;
  signal o_uCM2tar_inn_av        : ucm2tar_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2tar_mid_av        : ucm2tar_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2tar_out_av        : ucm2tar_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2tar_ext_av        : ucm2tar_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_inn_av        : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_mid_av        : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_out_av        : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_ext_av        : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2pl_av             : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);

  

begin

  report_cfg(true);

  ctrl : entity shared_lib.vhdl_utils_deserializer 
  generic map (g_DATA_WIDTH => UCM_CTRL_t'w) 
    port map(clk => clk, rst => rst, i_data => ctrl_b, o_data => ctrl_v);
  mon_b <= xor_reduce(mon_v);
  --------------------------------------------------------------
  slc_mp: for i_h in 2 downto 0 generate
    des : entity shared_lib.vhdl_utils_deserializer 
    generic map (g_DATA_WIDTH => i_slc_data_mainA_av(i_h)'length)
      port map(
        clk => clk,
        rst  => rst,
        i_data => i_slc_data_mainA_ab(i_h),
        o_data => i_slc_data_mainA_av(i_h));
    -- i_slc_data_mainA(i_h) <= i_slc_data_mainA_av(i_h);
  end generate;

  slc_ms: for i_h in 2 downto 0  generate
    des : entity shared_lib.vhdl_utils_deserializer 
    generic map (g_DATA_WIDTH => i_slc_data_mainB_av(i_h)'length)
      port map(clk => clk,rst  => rst,i_data => i_slc_data_mainB_ab(i_h),o_data => i_slc_data_mainB_av(i_h));
    -- i_slc_data_mainB(i_h) <= i_slc_data_mainB_av(i_h);
  end generate;

  des_p : entity shared_lib.vhdl_utils_deserializer 
  generic map (g_DATA_WIDTH => i_slc_data_neighborA_v'length)
    port map(clk => clk,rst  => rst,i_data => i_slc_data_neighborA_b,o_data => i_slc_data_neighborA_v);
  des_m : entity shared_lib.vhdl_utils_deserializer 
  generic map (g_DATA_WIDTH => i_slc_data_neighborB_v'length)
    port map(clk => clk,rst  => rst,i_data => i_slc_data_neighborB_b,o_data => i_slc_data_neighborB_v );
  --------------------------------------------------------------
  HPS_INN: for i_th in c_NUM_THREADS - 1 downto 0 generate
    o_uCM2hps_inn_ab(i_th) <= xor_reduce(o_uCM2hps_inn_av(i_th));
    o_uCM2tar_inn_ab(i_th) <= xor_reduce(o_uCM2tar_inn_av(i_th));
  end generate;
  HPS_mid: for i_th in c_NUM_THREADS - 1 downto 0 generate
    o_uCM2hps_mid_ab(i_th) <= xor_reduce(o_uCM2hps_mid_av(i_th));
    o_uCM2tar_mid_ab(i_th) <= xor_reduce(o_uCM2tar_mid_av(i_th));
  end generate;
  HPS_out: for i_th in c_NUM_THREADS - 1 downto 0 generate
    o_uCM2hps_out_ab(i_th) <= xor_reduce(o_uCM2hps_out_av(i_th));
    o_uCM2tar_out_ab(i_th) <= xor_reduce(o_uCM2tar_out_av(i_th));
  end generate;
  HPS_ext: for i_th in c_NUM_THREADS - 1 downto 0 generate
    o_uCM2hps_ext_ab(i_th) <= xor_reduce(o_uCM2hps_ext_av(i_th));
    o_uCM2tar_ext_ab(i_th) <= xor_reduce(o_uCM2tar_ext_av(i_th));
  end generate;

  MPL: for i_th in c_MAX_NUM_SL - 1 downto 0 generate
    o_uCM2pl_ab(i_th) <= xor_reduce(o_uCM2pl_av(i_th));
  end generate;
  --------------------------------------------------------------

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






end beh;

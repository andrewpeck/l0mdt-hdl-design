--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module:
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--
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

library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;


entity ucm_top_tb is
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    glob_en                 : in std_logic;


    -- SLc in
    i_slc_data_mainA_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_mainB_av     : in slc_rx_avt(2 downto 0);
    i_slc_data_neighborA_v  : in slc_rx_vt;
    i_slc_data_neighborB_v  : in slc_rx_vt;
    -- to hps
    o_uCM2hps_inn_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_mid_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_out_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_uCM2hps_ext_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    -- pipeline
    o_uCM2pl_av             : out ucm2pl_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity ucm_top_tb;

architecture beh of ucm_top_tb is
   signal ctrl_r : UCM_CTRL_t;
   signal mon_r  : UCM_MON_t;
   signal ttc_commands            : l0mdt_ttc_rt;
   signal ctrl_len : natural;
   signal ctrl_v : std_logic_vector(width(ctrl_r)-1 downto 0) := (others => '0');
   signal mon_v  : std_logic_vector(width(mon_r)-1 downto 0);
  -- signal o_uCM2hps_inn_av      : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  -- signal o_uCM2hps_mid_av      : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  -- signal o_uCM2hps_out_av      : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  -- signal o_uCM2hps_ext_av      : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  -- -- pipeline
  -- signal o_uCM2pl_av           : ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0);

begin
   --ctrl_len <= width(ctrl_r);
   --ctrl_v(width(ctrl_r)-1 downto width(ctrl_r)-12 ) <= x"03e";
   --ttc_commands.bcr <= '0'
    --ocr : std_logic;
    --ecr : std_logic;
    --l0a : std_logic;
    --l1a : std_logic;
    --bcid : bcid_t;
    --evid : evid_t;
    --orid : orid_t;

  
  ttc_commands <= zero(ttc_commands);
  ctrl_r <= zero(ctrl_r);
  ctrl_v <= convert(ctrl_r,ctrl_v);
  mon_r <= convert(mon_v,mon_r);
  
  
  
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
    i_slc_data_neighborA_v => i_slc_data_neighborA_v,
    i_slc_data_neighborB_v => i_slc_data_neighborB_v,
    -- pam out
    -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_inn_av        => o_uCM2hps_inn_av,
    o_uCM2hps_mid_av        => o_uCM2hps_mid_av,
    o_uCM2hps_out_av        => o_uCM2hps_out_av,
    o_uCM2hps_ext_av        => o_uCM2hps_ext_av,
    -- MDT hit
    o_uCM2pl_av             => o_uCM2pl_av
  );






end beh;

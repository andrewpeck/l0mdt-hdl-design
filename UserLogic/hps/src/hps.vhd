--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

entity hps is
  generic(
    g_STATION_RADIUS : integer := 0;    --station
    g_HPS_NUM_MDT_CH : integer := 6
    );
  port (
    clk     : in std_logic;
    rst     : in std_logic;
    glob_en : in std_logic;

    -- control
    ctrl_v  : in std_logic_vector;-- H2S_HPS_CTRL_t;
    mon_v   : out std_logic_vector;--H2S_HPS_MON_t;

    -- SLc
    i_uCM2hps_av : in  ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
    -- MDT hit
    i_mdt_tar_av : in  tar2hps_bus_avt(g_HPS_NUM_MDT_CH -1 downto 0);
    -- to pt calc
    o_sf2pt_av   : out sf2pt_bus_avt(c_NUM_THREADS -1 downto 0)
    );
end entity hps;

architecture beh of hps is

  signal ctrl_r : H2S_HPS_CTRL_t;
  signal mon_r : H2S_HPS_MON_t;

  constant CSF_CTRL_LEN : integer := len(ctrl_r.csf.csf(0));
  constant CSF_MON_LEN  : integer := len(mon_r.csf.csf(0));
  constant LSF_CTRL_LEN : integer := len(ctrl_r.lsf.lsf(0));
  constant LSF_MON_LEN  : integer := len(mon_r.lsf.lsf(0));

  type csf_ctrl_avt is array (integer range <>) of std_logic_vector(CSF_CTRL_LEN -1 downto 0); 
  type csf_mon_avt  is array (integer range <>) of std_logic_vector(CSF_MON_LEN  -1 downto 0); 
  type lsf_ctrl_avt is array (integer range <>) of std_logic_vector(LSF_CTRL_LEN -1 downto 0); 
  type lsf_mon_avt  is array (integer range <>) of std_logic_vector(LSF_MON_LEN  -1 downto 0); 

  signal csf_ctrl_av : csf_ctrl_avt(c_NUM_THREADS -1 downto 0 );
  signal csf_mon_av  : csf_mon_avt (c_NUM_THREADS -1 downto 0 );
  signal lsf_ctrl_av : lsf_ctrl_avt(c_NUM_THREADS -1 downto 0 );
  signal lsf_mon_av  : lsf_mon_avt (c_NUM_THREADS -1 downto 0 );
  
  signal pc_t0_ctrl_v  : std_logic_vector(len(ctrl_r.MDT_T0.MDT_T0)-1 downto 0);
  signal pc_tc_ctrl_v  : std_logic_vector(len(ctrl_r.MDT_TC.MDT_TC)-1 downto 0);
  signal pc_t0_mon_v  : std_logic_vector(len(mon_r.MDT_T0.MDT_T0)-1 downto 0);
  signal pc_tc_mon_v  : std_logic_vector(len(mon_r.MDT_TC.MDT_TC)-1 downto 0);

  -- type heg_ctrl_at is array (0 to 3 ) of  H2S_HPS_HEG_HEG_CTRL_t;
  -- type heg_mon_at is array (0 to 3 ) of  H2S_HPS_HEG_HEG_MON_t;
  type heg_ctrl_avt is array (0 to c_NUM_THREADS -1 ) of  std_logic_vector(len(ctrl_r.heg.heg(0))-1 downto 0);
  type heg_mon_avt is array (0 to c_NUM_THREADS -1 ) of  std_logic_vector(len(mon_r.heg.heg(0))-1 downto 0);

  signal heg_ctrl_av : heg_ctrl_avt;
  signal heg_mon_av : heg_mon_avt;

  signal int_rst : std_logic;
  signal int_ena : std_logic;

  signal mdt_full_data_av : heg_pc2heg_avt(g_HPS_NUM_MDT_CH-1 downto 0);

  -- signal int_uCM_data : ucm2heg_slc_avt(c_NUM_THREADS -1 downto 0);
  -- signal control_enable(c_NUM_THREADS -1 downto 0);

  signal heg2sf_ctrl_av : hps_ctrl2sf_avt(c_NUM_THREADS -1 downto 0);
  signal heg2sfslc_av   : heg2sfslc_bus_avt(c_NUM_THREADS -1 downto 0);
  signal heg2sfhit_av   : heg2sfhit_bus_avt(c_NUM_THREADS -1 downto 0);

begin

  ctrl_r <= structify(ctrl_v,ctrl_r);
  mon_v <= vectorify(mon_r,mon_v);

  pc_t0_ctrl_v <= vectorify(ctrl_r.MDT_T0.MDT_T0,pc_t0_ctrl_v);
  pc_tc_ctrl_v <= vectorify(ctrl_r.MDT_TC.MDT_TC,pc_tc_ctrl_v);
  mon_r.MDT_T0.MDT_T0 <= structify(pc_t0_mon_v,mon_r.MDT_T0.MDT_T0);
  mon_r.MDT_TC.MDT_TC <= structify(pc_tc_mon_v,mon_r.MDT_TC.MDT_TC);

  CM_for_gen: for th_i in c_NUM_THREADS -1 downto 0 generate
    csf_ctrl_av(th_i)   <= convert(ctrl_r.csf.csf(th_i),csf_ctrl_av(th_i));
    mon_r.csf.csf(th_i) <= convert(csf_mon_av(th_i),mon_r.csf.csf(th_i));
    lsf_ctrl_av(th_i)   <= convert(ctrl_r.lsf.lsf(th_i),lsf_ctrl_av(th_i));
    mon_r.lsf.lsf(th_i) <= convert(lsf_mon_av(th_i),mon_r.lsf.lsf(th_i));
  end generate CM_for_gen;

  SUPER : entity hps_lib.hps_supervisor
  generic map(
    g_STATION_RADIUS => g_STATION_RADIUS
  )
  port map(
    clk         => clk,
    rst         => rst,
    glob_en     => glob_en,
    --
    i_actions   => ctrl_r.actions,
    i_configs   => ctrl_r.configs,
    o_status    => mon_r.status,
    --
    o_local_rst => int_rst,
    o_local_en  => int_ena

  );


  PC : entity hps_lib.hps_pc_top
    generic map(
      g_HPS_NUM_MDT_CH => g_HPS_NUM_MDT_CH,
      g_STATION_RADIUS  => g_STATION_RADIUS
    )
    port map(
      clk         => clk,
      rst         => int_rst,
      ena         => int_ena,
      --
      i_ctrl_tc_v   => pc_tc_ctrl_v,--ctrl_r.MDT_TC.MDT_TC,--(hp_i),
      o_mon_tc_v    => pc_tc_mon_v,--mon_r.MDT_TC.MDT_TC,--(hp_i),
      i_ctrl_t0_v   => pc_t0_ctrl_v,--ctrl_r.MDT_T0.MDT_T0,--(hp_i),
      o_mon_t0_v    => pc_t0_mon_v,--mon_r.MDT_T0.MDT_T0,--(hp_i),
      --
      i_mdt_tar_v       => i_mdt_tar_av,--(hp_i),
      o_mdt_full_data_v => mdt_full_data_av--(hp_i)
  );

  heg_gen : for th_i in c_NUM_THREADS -1 downto 0 generate

    heg_ctrl_av(th_i) <= vectorify(ctrl_r.heg.heg(th_i),heg_ctrl_av(th_i));
    mon_r.heg.heg(th_i) <= structify(heg_mon_av(th_i),mon_r.heg.heg(th_i));
    
    HEG : entity heg_lib.heg
      generic map(
        g_STATION_RADIUS => g_STATION_RADIUS,
        g_HPS_NUM_MDT_CH => g_HPS_NUM_MDT_CH
        )
      port map(
        clk                => clk,
        rst                => int_rst, 
        glob_en            => int_ena,
        --        
        ctrl_v             => heg_ctrl_av(th_i),
        mon_v              => heg_mon_av(th_i),
        --
        i_uCM_data_v       => i_uCM2hps_av(th_i),
        -- MDT hit
        i_mdt_full_data_av => mdt_full_data_av,
        -- to Segment finder
        o_sf_control_v     => heg2sf_ctrl_av(th_i),
        o_sf_slc_data_v    => heg2sfslc_av(th_i),
        o_sf_mdt_data_v    => heg2sfhit_av(th_i)
        );

    SF : entity hps_lib.hps_sf_wrap
      generic map(
        g_STATION_RADIUS => g_STATION_RADIUS
        )
      port map(
        clk           => clk,
        rst           => int_rst,
        glob_en       => int_ena,

        lsf_ctrl_v => lsf_ctrl_av(th_i),--ctrl_r.lsf.lsf(th_i),
        lsf_mon_v  => lsf_mon_av(th_i),--mon_r.lsf.lsf(th_i),

        csf_ctrl_v => csf_ctrl_av(th_i),--ctrl_r.csf.csf(th_i),
        csf_mon_v  => csf_mon_av(th_i),--mon_r.csf.csf(th_i),

        -- to Segment finder
        i_control_v   => heg2sf_ctrl_av(th_i),
        i_slc_data_v  => heg2sfslc_av(th_i),
        i_mdt_data_v  => heg2sfhit_av(th_i),
        --
        o_sf_data_v   => o_sf2pt_av(th_i)
        );

  end generate;


end beh;

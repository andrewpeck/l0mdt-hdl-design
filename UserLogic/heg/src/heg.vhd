--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: L0MDT
-- File: heg.vhd
-- Module: <<moduleName>>
-- File PATH: /heg.vhd
-- -----
-- File Created: Tuesday, 4th October 2022 3:07:25 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 20th October 2022 10:49:55 am
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
-- use shared_lib.common_types_vectors_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
-- use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
-- use hp_lib.hp_custom_pkg.all;

library heg_lib;
use heg_lib.heg_pkg.all;
-- use heg_lib.heg_custom_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

entity heg is
  generic(
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH     : integer := 6 
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';
    -- control
    ctrl_v              : in  std_logic_vector; -- HPS_HEG_HEG_CTRL_t;
    mon_v               : out std_logic_vector; -- HPS_HEG_HEG_MON_t;
    -- configuration
    i_freeze            : in std_logic := '0';
    -- SLc
    i_uCM_data_v        : in ucm2hps_vt;
    -- MDT hit
    i_mdt_full_data_av  : in heg_pc2heg_avt(c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS)-1 downto 0);
    -- to Segment finder
    o_sf_control_v      : out heg_ctrl2sf_vt;
    o_sf_slc_data_v     : out heg2sfslc_vt;
    o_sf_mdt_data_v     : out heg2sfhit_vt
  );
end entity heg;

architecture beh of heg is
  signal ctrl_r           : HPS_HEG_HEG_CTRL_t;
  signal mon_r            : HPS_HEG_HEG_MON_t;
  
  -- constant SUPER_CTRL_LEN : integer := len(ctrl_r.super); 
  -- constant SUPER_MON_LEN  : integer := len(mon_r.super);
  signal ctrl_super_v : std_logic_vector(HPS_HEG_HEG_SUPER_CTRL_t'w -1 downto 0);
  signal mon_super_v  : std_logic_vector(HPS_HEG_HEG_SUPER_MON_t'w -1 downto 0);

  signal heg_ctrl_ctrl_r  : HPS_HEG_HEG_CTRL_CTRL_t;
  signal heg_ctrl_mon_r   : HPS_HEG_HEG_CTRL_MON_t;
  signal heg_ctrl_ctrl_v  : std_logic_vector(HPS_HEG_HEG_CTRL_CTRL_t'w-1 downto 0);
  signal heg_ctrl_mon_v   : std_logic_vector(HPS_HEG_HEG_CTRL_MON_t'w-1 downto 0);

  signal ctrl_hp_ar : HPS_HEG_HEG_HP_HP_CTRL_t_ARRAY ;
  signal mon_hp_ar  : HPS_HEG_HEG_HP_HP_MON_t_ARRAY ;

  type ctrl_hp_avt is array (c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS) -1 downto 0) of std_logic_vector(width(ctrl_hp_ar(0))-1 downto 0);
  type mon_hp_avt is array (c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS) -1 downto 0) of std_logic_vector(width(mon_hp_ar(0))-1 downto 0);

  signal ctrl_hp_av : ctrl_hp_avt;
  signal mon_hp_av  : mon_hp_avt;

  --------------------------------------------
  signal i_uCM_data_r       : ucm2hps_rt;
  signal i_mdt_full_data_ar : heg_pc2heg_art(c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS)-1 downto 0);

  --------------------------------------------

  -- signal heg_uCM_data       : ucm2heg_slc_rt;
  signal roi_b_Window       : hp_win_tubes_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  signal hegC2hp_uCM_data   : hp_heg2hp_slc_vt;
  
  -- signal heg_Sf_control : heg_ctrl2sf_rt;
  signal hegC_control : heg_ctrl2hp_art(c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS) -1 downto 0);

  signal hp2bm_ar : heg_hp2bm_art(c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS)-1 downto 0);
  signal hp2bm_av : heg_hp2bm_avt(c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS)-1 downto 0);

  -- signal time_offset  : unsigned(7 downto 0);
  signal int_freeze : std_logic; 
  signal int_rst : std_logic;
  signal int_ena : std_logic; 

  signal count_slcs_in_trig : std_logic_vector(0 downto 0);
  signal count_hits_in_trig : std_logic_vector(c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS) -1 downto 0);
  signal count_hits_ok_trig : std_logic_vector(c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS) -1 downto 0);
  signal count_errors_trig  : std_logic_vector(c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS) -1 downto 0);

begin

  ctrl_r <= convert(ctrl_v,ctrl_r);
  mon_v <= convert(mon_r,mon_v);

  ctrl_super_v <= convert(ctrl_r.super,ctrl_super_v);
  mon_r.super <= convert(mon_super_v,mon_r.super);

  heg_ctrl_ctrl_r <= ctrl_r.ctrl;
  mon_r.ctrl <= heg_ctrl_mon_r;
  
  heg_ctrl_mon_r <= convert(heg_ctrl_mon_v,heg_ctrl_mon_r);
  heg_ctrl_ctrl_v <= convert(heg_ctrl_ctrl_r,heg_ctrl_ctrl_v);

  ctrl_hp_ar <= ctrl_r.HP.HP;
  mon_r.HP.HP <= mon_hp_ar;

  -------------------------------------------
  i_uCM_data_r <= convert(i_uCM_data_v,i_uCM_data_r);
  count_slcs_in_trig(0) <= i_uCM_data_r.data_valid;


  SUPER : entity heg_lib.heg_supervisor
  generic map(
    g_STATION_RADIUS    => g_STATION_RADIUS,
    g_HPS_NUM_MDT_CH    => c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS)
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    glob_en             => glob_en,
    --
    ctrl_v              => ctrl_super_v,
    mon_v               => mon_super_v,
    --
    i_freeze            => i_freeze,
    o_freeze            => int_freeze,
    --
    o_local_rst         => int_rst,
    o_local_en          => int_ena,
    -- inputs
    i_slcs_in           => count_slcs_in_trig,
    i_hits_in           => count_hits_in_trig,
    i_hits_ok           => count_hits_ok_trig,
    i_errors            => count_errors_trig
    
  );

  -- cnt_loop: for iteration generate
    
  -- end generate cnt_loop;

  Heg_Control : entity heg_lib.heg_ctrl_top
  generic map(
    g_STATION_RADIUS    => g_STATION_RADIUS,
    g_HPS_NUM_MDT_CH    => c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS)
  )
  port map(
    clk                 => clk,
    rst                 => int_rst,
    glob_en             => int_ena,
    --
    ctrl_v              => heg_ctrl_ctrl_v,
    mon_v               => heg_ctrl_mon_v,
    --
    i_uCM_data_v        => i_uCM_data_v,
    --
    o_uCM2sf_data_v     => o_sf_slc_data_v,
    o_uCM2hp_data_v     => hegC2hp_uCM_data,
    o_SLC_Window_v      => roi_b_Window,
    o_sf_control_v      => o_sf_control_v,
    o_hp_control_r      => hegC_control
  );



  hp_gen: for hp_i in c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS)-1 downto 0 generate

    i_mdt_full_data_ar(hp_i) <= convert(i_mdt_full_data_av(hp_i),i_mdt_full_data_ar(hp_i));
    hp2bm_ar(hp_i) <= convert(hp2bm_av(hp_i),hp2bm_ar(hp_i));

    count_hits_in_trig(hp_i) <= i_mdt_full_data_ar(hp_i).data_valid;
    count_hits_ok_trig(hp_i) <= hp2bm_ar(hp_i).data_valid;
    count_errors_trig(hp_i)  <= '0';

    ctrl_hp_av(hp_i) <= convert(ctrl_hp_ar(hp_i),ctrl_hp_av(hp_i));
    mon_hp_ar(hp_i) <= convert(mon_hp_av(hp_i),mon_hp_ar(hp_i));

    hp_en : if c_HP_SECTOR_STATION(g_STATION_RADIUS)(hp_i) = '1' generate
      Hit_Processor : entity hp_lib.hit_processor
      generic map(
        g_STATION_RADIUS    => g_STATION_RADIUS
      )
      port map(
        clk                 => clk,
        rst                 => int_rst OR hegC_control(hp_i).rst ,
        ena                 => int_ena AND hegC_control(hp_i).enable,
        --
        ctrl_v              => ctrl_hp_av(hp_i),
        mon_v               => mon_hp_av(hp_i) , 
        -- configuration
        -- local_rst           => hegC_control(hp_i).rst,
        -- local_en            => hegC_control(hp_i).enable,
        -- time_offset         => to_unsigned(HP_BCID_OFFSET_TIME,8),
        -- SLc
        i_SLC_Window        => roi_b_Window,
        i_slc_data_v        => hegC2hp_uCM_data,
        -- MDT hit
        i_mdt_data_v          => i_mdt_full_data_av(hp_i),
        -- i_mdt_valid         => i_mdt_valid,
        -- i_mdt_time_real     => i_mdt_time_real,
        -- to Segment finder
        -- o_sf_slc_data_v       => o_sf_slc_data_v,
        o_hit_data_v       => hp2bm_av(hp_i)
      );
    end generate;
  end generate;

  Heg_buffer_mux : entity heg_lib.heg_buffermux
  generic map(
    g_HPS_NUM_MDT_CH    => c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS)
  )
  port map(
    clk                 => clk,
    
    rst                 => int_rst,
    glob_en             => int_ena,
    -- configuration
    i_control           =>hegC_control,
    -- MDT in
    i_mdt_hits_av       => hp2bm_av,
    -- MDT out
    o_mdt_hits_v        => o_sf_mdt_data_v
  );

end beh;




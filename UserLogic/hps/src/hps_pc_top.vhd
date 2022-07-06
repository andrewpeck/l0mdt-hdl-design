--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: HPS mdt parameters calculation
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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;
-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;
-- use hegtypes_lib.heg_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

entity hps_pc_top is
  generic(
    -- g_CHAMBER            : integer := 0;
    -- mdt type
    -- type mdt_type;
    g_SIM_nBUILD          : std_logic := '0';
    -- parameters
    g_HPS_NUM_MDT_CH      : integer := 6;
    g_STATION_RADIUS      : integer := 0  --station
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    ena                   : in std_logic;
    -- configuration & control
    i_ctrl_tc_v           : in  std_logic_vector; -- HPS_MDT_TC_MDT_TC_CTRL_t_ARRAY;  
    o_mon_tc_v            : out std_logic_vector; -- HPS_MDT_TC_MDT_TC_MON_t_ARRAY;
    i_ctrl_t0_v           : in  std_logic_vector; -- HPS_MDT_T0_MDT_T0_CTRL_t_ARRAY;  
    o_mon_t0_v            : out std_logic_vector; -- HPS_MDT_T0_MDT_T0_MON_t_ARRAY;   
    -- MDT hit
    i_mdt_tar_v           : in tar2hps_avt(g_HPS_NUM_MDT_CH - 1 downto 0);
    o_mdt_full_data_v     : out heg_pc2heg_avt(g_HPS_NUM_MDT_CH - 1 downto 0)
  );
end entity hps_pc_top;

architecture beh of hps_pc_top is

  signal i_ctrl_tc_r   : HPS_MDT_TC_MDT_TC_CTRL_t_ARRAY;  
  signal o_mon_tc_r    : HPS_MDT_TC_MDT_TC_MON_t_ARRAY;
  signal i_ctrl_t0_r   : HPS_MDT_T0_MDT_T0_CTRL_t_ARRAY;  
  signal o_mon_t0_r    : HPS_MDT_T0_MDT_T0_MON_t_ARRAY; 

  type ctrl_tc_avt is array (g_HPS_NUM_MDT_CH -1 downto 0 ) of std_logic_vector(width(i_ctrl_tc_r(0))-1 downto 0);
  type mon_tc_avt  is array (g_HPS_NUM_MDT_CH -1 downto 0 ) of std_logic_vector(width(o_mon_tc_r(0))-1 downto 0);
  type ctrl_t0_avt is array (g_HPS_NUM_MDT_CH -1 downto 0 ) of std_logic_vector(width(i_ctrl_t0_r(0))-1 downto 0);
  type mon_t0_avt  is array (g_HPS_NUM_MDT_CH -1 downto 0 ) of std_logic_vector(width(o_mon_t0_r(0))-1 downto 0);

  signal ctrl_tc_av : ctrl_tc_avt;
  signal mon_tc_av  : mon_tc_avt ;
  signal ctrl_t0_av : ctrl_t0_avt;
  signal mon_t0_av  : mon_t0_avt ;
  
begin

  o_mon_tc_v <= convert(o_mon_tc_r,o_mon_tc_v);
  o_mon_t0_v <= convert(o_mon_t0_r,o_mon_t0_v);
  i_ctrl_tc_r <= convert(i_ctrl_tc_v,i_ctrl_tc_r);
  i_ctrl_t0_r <= convert(i_ctrl_t0_v,i_ctrl_t0_r);

  ctrl_gen : for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 generate
    ctrl_tc_av(hp_i)  <= convert(i_ctrl_tc_r(hp_i),ctrl_tc_av(hp_i));
    ctrl_t0_av(hp_i)  <= convert(i_ctrl_t0_r(hp_i),ctrl_t0_av(hp_i));
    o_mon_tc_r(hp_i)  <= convert(mon_tc_av(hp_i),o_mon_tc_r(hp_i));
    o_mon_t0_r(hp_i)  <= convert(mon_t0_av(hp_i),o_mon_t0_r(hp_i));
  end generate;


   pc_gen : for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 generate
    pc_en : if c_HP_SECTOR_STATION(g_STATION_RADIUS)(hp_i) = '1' generate
      PC : entity hps_lib.hps_pc
      generic map(
        g_CHAMBER         => hp_i,
        g_STATION_RADIUS  => g_STATION_RADIUS
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_ctrl_tc_v   => ctrl_tc_av(hp_i),
        o_mon_tc_v    => mon_tc_av(hp_i),
        i_ctrl_t0_v   => ctrl_t0_av(hp_i),
        o_mon_t0_v    => mon_t0_av(hp_i),
        --
        i_mdt_tar_v       => i_mdt_tar_v(hp_i),
        o_mdt_full_data_v => o_mdt_full_data_v(hp_i)
      );
    end generate;
  end generate;

end beh;

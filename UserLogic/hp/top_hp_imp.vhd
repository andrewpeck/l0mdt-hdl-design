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
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity top_hp is
  generic(
    g_STATION_RADIUS    : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';
    --
    ctrl_b              : in std_logic;
    mon_b               : out std_logic;
    -- configuration
    local_rst           : in std_logic;
    local_en            : in std_logic;
    -- time_offset         : in unsigned(12 -1 downto 0);

    -- SLc
    i_SLC_Window_b        : in std_logic;-- hp_win_tubes_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);
    i_slc_data_b          : in std_logic;-- hp_heg2hp_slc_vt;
    -- MDT hit
    i_mdt_data_b          : in std_logic;-- hp_hpsPc2hp_vt;
    -- to Segment finder
    o_hit_data_b          : out std_logic-- hp_hp2bm_vt

  );
end entity top_hp;

architecture beh of top_hp is

  constant  c_CTRL_LEN :  integer := 1711;
  constant c_MON_LEN : integer := 1042;
  signal ctrl_r             : HPS_HEG_HEG_HP_HP_CTRL_t;
  signal mon_r              : HPS_HEG_HEG_HP_HP_MON_t;
  signal ctrl_v             : std_logic_vector(c_CTRL_LEN -1 downto 0);
  signal mon_v              : std_logic_vector(c_MON_LEN -1 downto 0);

  -- signal local_rst          : std_logic;
  -- signal local_en           : std_logic;

  signal hp_win_tubes_len : hp_win_tubes_rt;
  
  
  constant slc_win_len : integer := len(hp_win_tubes_len) * get_num_layers(g_STATION_RADIUS); -- HP_WIN_TUBES_LEN
  -- report "The value of 'slc_win_len' is " & integer'image(slc_win_len);
  signal i_SLC_Window_v   : std_logic_vector(slc_win_len - 1 downto 0);
  signal i_SLC_Window_ar  : hp_win_tubes_art(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  signal i_SLC_Window_av  : hp_win_tubes_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);

  signal hp_heg2hp_slc_len : hp_heg2hp_slc_rt;
  signal i_slc_data_v       : std_logic_vector(len(hp_heg2hp_slc_len) - 1 downto 0);
  signal i_slc_data_rv      : hp_heg2hp_slc_vt;
  -- signal i_slc_data_v       : hp_heg2hp_slc_vt;
  signal i_mdt_data_v       : hp_hpsPc2hp_vt;
  signal o_hit_data_v       : hp_hp2bm_vt;


begin
  -- report "slc_win_len";
  ctrl : entity shared_lib.vhdl_utils_deserializer generic map (c_CTRL_LEN) port map(clk,rst,ctrl_b,ctrl_v);
  mon_b <= xor_reduce(mon_v);
  --------------------------------------------------------------

  des1 : entity shared_lib.vhdl_utils_deserializer 
  generic map (g_DATA_WIDTH => slc_win_len)
  port map(clk => clk,rst  => rst,i_data => i_SLC_Window_b,o_data => i_SLC_Window_v);

  i_SLC_Window_ar <= structify(i_SLC_Window_v,i_SLC_Window_ar);

  gen_for : for il in (get_num_layers(g_STATION_RADIUS) -1) downto 0 generate
    i_SLC_Window_av(il) <= vectorify(i_SLC_Window_ar(il),i_SLC_Window_av(il));
  end generate ; -- gen_for
  -- i_SLC_Window_ar <= structify(i_SLC_Window_v);
  -- i_SLC_Window_av <= vectorify(i_SLC_Window_ar);

  des2 : entity shared_lib.vhdl_utils_deserializer 
  generic map (g_DATA_WIDTH => len(hp_heg2hp_slc_len) )
  port map(clk => clk,rst  => rst,i_data => i_slc_data_b,o_data => i_slc_data_v);
  i_slc_data_rv <= i_slc_data_v;

  des3 : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => i_mdt_data_v'length --HP_HPSPC2HP_LEN
    )port map(clk => clk,rst  => rst,i_data => i_mdt_data_b,o_data => i_mdt_data_v);

  o_hit_data_b <= xor_reduce(o_hit_data_v);

  -- tdc_mid: for i_h in c_HPS_MAX_HP_MiD - 1 downto 0 generate
  --   des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2hp_LEN)port map(clk => clk,rst  => rst,i_data => i_mid_tdc_hits_ab(i_h),o_data => i_mid_tdc_hits_av(i_h));
  --   o_mid_tdc_hits_ab(i_h) <= xor_reduce(o_mid_tdc_hits_av(i_h));
  --   o_mid_hp_hits_ab(i_h) <= xor_reduce(o_mid_hp_hits_av(i_h));
  -- end generate;
  -- tdc_out: for i_h in c_HPS_MAX_HP_OUT - 1 downto 0 generate
  --   des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2hp_LEN)port map(clk => clk,rst  => rst,i_data => i_out_tdc_hits_ab(i_h),o_data => i_out_tdc_hits_av(i_h));
  --   o_out_tdc_hits_ab(i_h) <= xor_reduce(o_out_tdc_hits_av(i_h));
  --   o_out_hp_hits_ab(i_h) <= xor_reduce(o_out_hp_hits_av(i_h));
  -- end generate;
  -- tdc_ext: for i_h in c_HPS_MAX_HP_EXT - 1 downto 0 generate
  --   des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2hp_LEN)port map(clk => clk,rst  => rst,i_data => i_ext_tdc_hits_ab(i_h),o_data => i_ext_tdc_hits_av(i_h));
  --   o_ext_tdc_hits_ab(i_h) <= xor_reduce(o_ext_tdc_hits_av(i_h));
  --   o_ext_hp_hits_ab(i_h) <= xor_reduce(o_ext_hp_hits_av(i_h));
  -- end generate;
  --------------------------------------------------------------

  Hit_Processor : entity hp_lib.hit_processor
  generic map(
    g_STATION_RADIUS    => g_STATION_RADIUS
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    glob_en             => glob_en,
    --
    ctrl_v              => ctrl_v,
    mon_v               => mon_v, 
    -- configuration
    local_rst           => local_rst,
    local_en            => local_en,
    -- time_offset         => to_unsigned(HP_BCID_OFFSET_TIME,8),

    -- SLc
    i_SLC_Window        => i_SLC_Window_av,
    i_slc_data_v        => i_slc_data_rv,
    -- MDT hit
    i_mdt_data_v          => i_mdt_data_v,
    -- i_mdt_valid         => i_mdt_valid,
    -- i_mdt_time_real     => i_mdt_time_real,
    -- to Segment finder
    -- o_sf_slc_data_v       => o_sf_slc_data_v,
    o_hit_data_v       => o_hit_data_v
  );






end beh;

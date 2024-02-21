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
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
-- use shared_lib.common_types_vectors_pkg.all;
use shared_lib.config_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
-- use hp_lib.hp_custom_pkg.all;

library heg_lib;
use heg_lib.heg_pkg.all;
-- use heg_lib.heg_custom_pkg.all;

-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;
-- use hegtypes_lib.heg_pkg.all;


entity heg_ctrl_roi is
  generic(
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH    : integer := 6
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_uCM_data_v        : in ucm2hps_vt;
    --
    o_SLC_Window_av      : out hp_win_tubes_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);
    o_Roi_win_valid      : out std_logic
    
  );
end entity heg_ctrl_roi;

architecture beh of heg_ctrl_roi is

  signal uCM_data_r : ucm2hps_rt;
  -- signal slc_b_data_r  : ucm_csf_barrel_rt;
  
  signal roi_center : heg_roi_center_aut(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  signal roi_edges : hp_win_tubes_limits_art(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  signal dv_z, dv_mbar : std_logic;
  -- signal slc_e_data : ucm_csf_endcap_rt;
  signal SLC_Window_ar : hp_win_tubes_art(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  
begin

  BARREL : if c_ST_nBARREL_ENDCAP = '0' generate

    uCM_data_r <= convert(i_uCM_data_v,uCM_data_r);
    -- slc_b_data_r <= convert(uCM_data_r.specific);
    for_gen_SW : for il in get_num_layers(g_STATION_RADIUS) -1 downto 0 generate
      o_SLC_Window_av(il) <= convert(SLC_Window_ar(il),o_SLC_Window_av(il));
    end generate ; -- identifier
    
    ROI_Z : entity heg_lib.b_z2roi
    generic map(
      g_STATION_RADIUS => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,
      --
      i_z                 => uCM_data_r.vec_pos,
      i_dv                => uCM_data_r.data_valid,
      --
      o_roi_center        => roi_center,
      o_dv                => dv_Z
    );

    SMALL_GEN: if g_STATION_RADIUS > 0 generate

      ROI_MBAR_6L : entity heg_lib.b_slope2roi_6l
      generic map(
        g_STATION_RADIUS => g_STATION_RADIUS
      )
      port map(
        clk                 => clk,
        rst                 => rst,
        glob_en             => glob_en,
        --
        i_ang               => std_logic_vector(uCM_data_r.vec_ang),
        i_dv                => uCM_data_r.data_valid,
        --
        o_roi_edges         => roi_edges,
        o_dv                => dv_mbar
      );

    end generate;

    
    LARGE_GEN: if g_STATION_RADIUS = 0 generate

      ROI_MBAR_8L : entity heg_lib.b_slope2roi_8l
      generic map(
        g_STATION_RADIUS => g_STATION_RADIUS
      )
      port map(
        clk                 => clk,
        rst                 => rst,
        glob_en             => glob_en,
        --
        i_ang               => std_logic_vector(uCM_data_r.vec_ang),
        i_dv                => uCM_data_r.data_valid,
        --
        o_roi_edges         => roi_edges,
        o_dv                => dv_mbar
      );

    end generate;

    WIN_GEN: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          SLC_Window_ar <= (others => (others => (others => '0')));
        else
          for l_i in get_num_layers(g_STATION_RADIUS)-1 downto 0 loop
            if to_integer(signed(roi_center(l_i)) + roi_edges(l_i).lo) >= 0 then
              SLC_Window_ar(l_i).lo <= unsigned(signed(roi_center(l_i)) + roi_edges(l_i).lo);
            else
              SLC_Window_ar(l_i).lo <= (others => '0');
            end if;
            if to_integer(signed(roi_center(l_i)) + roi_edges(l_i).hi) >= 0 then
              SLC_Window_ar(l_i).hi <= unsigned(signed(roi_center(l_i)) + roi_edges(l_i).hi);
            else
              SLC_Window_ar(l_i).hi <= (others => '0');
            end if;
          end loop;

        o_Roi_win_valid <= dv_z and dv_mbar;

        end if;
      end if;
    end process WIN_GEN;

    -- WIN_GEN : for l_i in get_num_layers(g_STATION_RADIUS)-1 downto 0 generate
    --   if (roi_center(l_i)) + roi_edges(l_i).lo > 0) then
    --     SLC_Window_ar(l_i).lo <= unsigned(signed(roi_center(l_i)) + roi_edges(l_i).lo);
    --   else
    --     SLC_Window_ar(l_i).lo <= (others => '0');
    --   end if;
    --   SLC_Window_ar(l_i).hi <= unsigned(signed(roi_center(l_i)) + roi_edges(l_i).hi);

      
    -- end generate;

   



  end generate;
  

  
end architecture beh;



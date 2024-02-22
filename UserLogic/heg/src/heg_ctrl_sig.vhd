--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: L0MDT
-- File: heg_ctrl_sig.vhd
-- Module: <<moduleName>>
-- File PATH: /heg_ctrl_sig.vhd
-- -----
-- File Created: Thursday, 14th April 2022 8:57:28 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 20th October 2022 10:59:34 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
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
-- use shared_lib.detector_param_pkg.all;

use shared_lib.fct_gtube2chamber_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
-- use hp_lib.hp_custom_pkg.all;

library heg_lib;
use heg_lib.heg_pkg.all;
-- use heg_lib.heg_custom_pkg.all;


entity heg_ctrl_sig is
  generic(
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH    : integer := 6
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_uCM_data_r        : in ucm2hps_rt;
    --
    i_Roi_win_origin    : in unsigned(MDT_TUBE_LEN-1 downto 0);
    i_Roi_win_valid     : in std_logic;
    --
    i_roi_global_x      : in unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    i_roi_global_z      : in unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    i_roi_global_dv   : in std_logic;
    --
    o_hp_control_r      : out heg_ctrl2hp_art(g_HPS_NUM_MDT_CH -1 downto 0);
    o_sf_control_r      : out heg_ctrl2sf_rt;
    --
    o_uCM2hp_data_v     : out hp_heg2hp_slc_vt;
    o_uCM2hp_data_dv    : out std_logic;
    o_uCM2sf_data_v     : out heg2sfslc_vt;
    o_uCM2sf_data_dv     : out std_logic
  );
end entity heg_ctrl_sig;

architecture beh of heg_ctrl_sig is

  -- signal heg_times : heg_times_rt := get_heg_times(0);

  type heg_ctrl_motor_t is ( IDLE, SET_WINDOW, HEG_BUSY );
  signal heg_ctrl_motor   : heg_ctrl_motor_t;
  
  signal heg_count_en     : std_logic;
  signal busy_count       : std_logic_vector(11 downto 0);
  signal enables_a        : std_logic_vector(g_HPS_NUM_MDT_CH -1 downto 0);

  signal o_uCM2sf_data_r  : heg2sfslc_rt;
  signal o_uCM2hp_data_r  : hp_heg2hp_slc_rt;
  signal b_data           : hp_heg2hp_slc_b_rt;

  -- signal holesize         : unsigned(MDT_GLOBAL_AXI_LEN - 1 downto 0);
  -- signal holesize_dv      : std_logic;
  -- signal z_win_org        : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  -- signal z_win_org_dv     : std_logic;

  signal csf_slope        : unsigned(CSF_SLOPE_LEN-1 downto 0);
  signal csf_slope_dv     : std_logic;

begin

  -- ZH : entity shared_lib.barrel_zholes
  -- generic map(
  --   g_STATION_RADIUS    => g_STATION_RADIUS
  -- )
  -- port map(
  --   clk                 => clk,
  --   rst                 => rst,
  --   glob_en             => glob_en,
  --   --
  --   i_chamber           => to_unsigned(get_b_chamber_from_tubes(c_SECTOR_ID,c_SECTOR_SIDE,g_STATION_RADIUS,to_integer(i_Roi_win_origin)),SLC_CHAMBER_LEN), 
  --   -- ojo no es corecto, ha de depender del tubo
  --   i_dv                => i_Roi_win_valid,
  --   o_spaces            => holesize,
  --   o_dv                => holesize_dv
  -- );

  TAN : entity shared_lib.roi_tan
  generic map(
    g_INPUT_LEN   => UCM2HPS_VEC_ANG_LEN,
    g_OUTPUT_LEN  => CSF_SLOPE_LEN
  )
  port map(
    clk           => clk,
    rst           => rst,
    glob_en       => glob_en,
    --
    i_mbar        => unsigned(i_uCM_data_r.vec_ang),
    i_dv          => i_uCM_data_r.data_valid,
    o_slope       => csf_slope,
    o_dv          => csf_slope_dv
  );

  o_uCM2sf_data_v <= convert(o_uCM2sf_data_r,o_uCM2sf_data_v);
  o_uCM2hp_data_v <= convert(o_uCM2hp_data_r,o_uCM2hp_data_v);

  CTRL_GEN : for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 generate
    enables_a(hp_i) <= o_hp_control_r(hp_i).enable;
    -- o_hp_control_r(hp_i).rst <= '1';
  end generate;

  BARREL_GEN: if c_ST_nBARREL_ENDCAP = '0' generate
    b_data.roi_x <= i_roi_global_x;--resize(i_roi_global_x,b_data.roi_x'length);
    b_data.roi_z <= i_roi_global_z;--resize(i_roi_global_z,b_data.roi_z'length);
  end generate BARREL_GEN;
  
  SLc_reg : process(rst,clk) begin
    if rising_edge(clk) then
      if(rst= '1') then

        heg_count_en <= '0';


        o_uCM2sf_data_r <= convert((width(o_uCM2sf_data_r) -1 downto 0 => '0'),o_uCM2sf_data_r);
        o_uCM2hp_data_r <= convert((width(o_uCM2hp_data_r) -1 downto 0 => '0'),o_uCM2hp_data_r);
        o_uCM2hp_data_dv <= '0';
        o_uCM2sf_data_dv <= '0';

        -- hp control resets
        o_sf_control_r.enable <= '0';
        o_sf_control_r.rst <= '0';
        o_sf_control_r.eof <= '0';
        -- o_sf_control_r.slope <= (others => '0');
        -- o_sf_control_r.window_valid <= '0';
        -- hp control reset
        -- b_data <= zero(b_data);

        for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
          o_hp_control_r(hp_i).enable <= '0';
          o_hp_control_r(hp_i).rst <= '0';
        end loop;
        busy_count <= (others => '0');

        heg_ctrl_motor <= IDLE;
      else
        -- windows origin calculator
        if c_ST_nBARREL_ENDCAP = '0' then -- barrel
          if i_roi_global_dv = '1' then
            -- if (i_uCM_data_r.mdtid.chamber_id = 2) 
            -- or (i_uCM_data_r.mdtid.chamber_id = 3) 
            -- or (i_uCM_data_r.mdtid.chamber_id = 5) then
            -- b_data.z_0 <= resize(holesize + i_Roi_win_origin * to_unsigned(960,10),b_data.z_0'length);
            -- b_data.roi_x <= i_roi_global_x;--resize(i_roi_global_x,b_data.roi_x'length);
            -- b_data.roi_z <= i_roi_global_z;--resize(i_roi_global_z,b_data.roi_z'length);
            -- o_uCM2hp_data_r.roi_x <= i_roi_global_x;
            -- o_uCM2hp_data_r.roi_z <= i_roi_global_z;
            o_uCM2sf_data_r.hewindow_pos  <= resize(unsigned(i_roi_global_z(i_roi_global_z'length -1 downto 5)),HEG2SFSLC_HEWINDOW_POS_LEN);
            
          else

          end if;
          -- z_win_org_dv <= holesize_dv;
        else
        -- endcap
        end if;

        -- time counter
        if heg_count_en = '1' then
          busy_count <= busy_count + '1';
        else
          busy_count <= (others => '0');
        end if;

        -- signal motor state machine
        case heg_ctrl_motor is
          when IDLE =>
            if( i_uCM_data_r.data_valid = '1') then  -- new slc
              -- HP
              o_uCM2hp_data_r.bcid <= i_uCM_data_r.muid.bcid;
              -- SF
              o_uCM2sf_data_r.muid        <= i_uCM_data_r.muid;
              o_uCM2sf_data_r.mdtseg_dest <= i_uCM_data_r.mdtseg_dest;
              o_uCM2sf_data_r.mdtid       <= i_uCM_data_r.mdtid;
              o_uCM2sf_data_r.vec_pos     <= unsigned(i_uCM_data_r.vec_pos);
              if c_SF_TYPE = '1' then
                o_uCM2sf_data_r.vec_ang     <= unsigned(i_uCM_data_r.vec_ang);
              end if;

              for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
                o_hp_control_r(hp_i).enable <= '0';
                o_hp_control_r(hp_i).rst <= '1';
              end loop;
              o_sf_control_r.enable <= '0';
              o_sf_control_r.rst <= '1';
              o_sf_control_r.eof <= '0';
              heg_ctrl_motor <= SET_WINDOW;
            else
              o_sf_control_r.enable <= '0';
              o_sf_control_r.rst <= '0';
              o_sf_control_r.eof <= '0';
            end if;

          when SET_WINDOW =>
            for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
              o_hp_control_r(hp_i).rst <= '0';
            end loop;
            -- if i_roi_global_dv = '1' then
            --   -- o_uCM2sf_data_r.hewindow_pos  <= resize(holesize + i_Roi_win_origin * to_unsigned(30,10),HEG2SFSLC_HEWINDOW_POS_LEN);
            --   o_uCM2sf_data_r.hewindow_pos  <= resize(i_roi_global_z,HEG2SFSLC_HEWINDOW_POS_LEN);
            -- end if;

            if csf_slope_dv = '1' then
              -- o_sf_control_r.slope <= csf_slope;
              if c_SF_TYPE = '0' then
                o_uCM2sf_data_r.vec_ang     <= csf_slope;
              end if;
            end if;

            if i_roi_global_dv = '1' then

              -- o_uCM2sf_data_r.hewindow_pos  <= resize(i_roi_global_z,HEG2SFSLC_HEWINDOW_POS_LEN);

              for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
                o_hp_control_r(hp_i).enable <= '1';
                o_hp_control_r(hp_i).rst <= '0';
              end loop;

              o_sf_control_r.enable <= '1';
              o_sf_control_r.rst <= '0';
              o_sf_control_r.eof <= '0';

              if c_ST_nBARREL_ENDCAP = '0' then -- barrel
                o_uCM2hp_data_r.specific <= convert(b_data,o_uCM2hp_data_r.specific);
              else --endcap

              end if;
              o_uCM2sf_data_r.data_valid <= '1';
              o_uCM2hp_data_r.data_valid <= '1';
              o_uCM2hp_data_dv <= '1';
              o_uCM2sf_data_dv <= '1';

              heg_count_en <= '1';
              heg_ctrl_motor <= HEG_BUSY;
            end if;

            -- if c_SF_TYPE = '0' then

            -- else

            -- end if;

          when HEG_BUSY =>
            o_uCM2sf_data_r.data_valid <= '0';
            o_uCM2hp_data_r.data_valid <= '0';
            o_uCM2hp_data_dv <= '0';
            o_uCM2sf_data_dv <= '0';
            -- for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
            --   o_hp_control_r(hp_i).rst <= '0';
            -- end loop;

            if to_integer(unsigned(busy_count)) < c_HEG_TIME_LOAD then
              -- WAITING SF TO LOAD
            elsif to_integer(unsigned(busy_count)) < c_HEG_TIME_BUSY then
              for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
                o_hp_control_r(hp_i).enable <= '1';
                -- o_hp_control_r(hp_i).rst <= '0';
              end loop;
              o_sf_control_r.enable <= '1';
              o_sf_control_r.rst    <= '0';
              o_sf_control_r.eof    <= '0';
            elsif to_integer(unsigned(busy_count)) = c_HEG_TIME_BUSY then
              for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
                o_hp_control_r(hp_i).enable <= '0';
                o_hp_control_r(hp_i).rst <= '0';
              end loop;
              o_sf_control_r.enable <= '0';
              o_sf_control_r.rst    <= '0';
              o_sf_control_r.eof    <= '1';
              -- busy_count <= (others => '0');
              -- heg_ctrl_motor <= IDLE;
            elsif to_integer(unsigned(busy_count)) < c_HEG_TIME_UNLOAD then
              o_sf_control_r.enable <= '0';
              o_sf_control_r.rst    <= '0';
              o_sf_control_r.eof    <= '0';
            else
              heg_count_en <= '0';
              heg_ctrl_motor <= IDLE;
            end if;

        end case;
      end if;

    end if;
  end process;

  
end architecture beh;

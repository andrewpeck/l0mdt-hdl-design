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
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

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

entity heg_ctrl_top is
  generic(
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH    : integer := 6
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    -- SLc in
    i_uCM_data_v        : in ucm2hps_rvt;
    -- SLc out
    o_uCM2sf_data_v     : out ucm2hps_rvt;
    o_uCM2hp_data_v     : out hp_heg2hp_slc_rvt;
    o_SLC_Window_v      : out hp_heg2hp_window_avt;

    o_sf_control        : out heg_ctrl2hp_rt;
    o_hp_control        : out heg_ctrl2hp_at(g_HPS_NUM_MDT_CH -1 downto 0)
  );
end entity heg_ctrl_top;

architecture beh of heg_ctrl_top is

  component ctrl_signals is
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
  
      o_hp_control        : out heg_ctrl2hp_at(g_HPS_NUM_MDT_CH -1 downto 0);
      o_uCM2sf_data_v     : out ucm2hps_rvt
    );
  end component ctrl_signals;

  signal uCM_data_r         : ucm2hps_rt;
  signal Roi_win_valid      : std_logic;
  signal o_uCM2hp_data_r    : hp_heg2hp_slc_rt;
  
begin

  HEG_CTRL : entity heg_lib.heg_ctrl_roi
  generic map(
    g_STATION_RADIUS => g_STATION_RADIUS,
    g_HPS_NUM_MDT_CH => g_HPS_NUM_MDT_CH
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    glob_en             => glob_en,
    -- configuration
    -- SLc in
    i_uCM_data_v          => i_uCM_data_v,
    -- SLc out
    o_SLC_Window_v        => o_SLC_Window_v,
    o_Roi_win_valid       => Roi_win_valid
  );

  -- o_uCM2sf_data_v <= int_uCM_data;
  -- o_uCM2hp_data_v.barrel.z <= int_uCM_data.barrel.z;

  uCM_data_r <= structify(i_uCM_data_v);
  o_uCM2hp_data_v <= vectorify(o_uCM2hp_data_r);

end beh;

--
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
use shared_lib.config_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

entity ctrl_signals is
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
    i_Roi_win_valid     : in std_logic;
    --
    o_hp_control        : out heg_ctrl2hp_at(g_HPS_NUM_MDT_CH -1 downto 0);
    o_uCM2sf_data_v     : out ucm2hps_rvt
  );
end entity ctrl_signals;

architecture beh of ctrl_signals is

  type heg_ctrl_motor_t is ( IDLE, SET_WINDOW, HEG_BUSY );
  signal heg_ctrl_motor     : heg_ctrl_motor_t;

  signal busy_count         : std_logic_vector(11 downto 0);
  signal enables_a          : std_logic_vector(g_HPS_NUM_MDT_CH -1 downto 0);

begin

  CTRL_GEN : for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 generate
    enables_a(hp_i) <= o_hp_control(hp_i).enable;
    -- o_hp_control(hp_i).rst <= '1';
  end generate;
  
  SLc_reg : process(rst,clk) begin
    if rising_edge(clk) then
      if(rst= '1') then

        o_uCM2sf_data_v <= nullify(o_uCM2sf_data_v);

        for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
          o_hp_control(hp_i).enable <= '0';
          o_hp_control(hp_i).rst <= '1';
        end loop;
        busy_count <= (others => '0');

        heg_ctrl_motor <= IDLE;
      else
        if or_reduce(enables_a) = '1' then
          busy_count <= busy_count + '1';
        else
          busy_count <= (others => '0');
        end if;

        case heg_ctrl_motor is
          when IDLE =>
            if( i_uCM_data_r.data_valid = '1') then
              -- o_uCM2sf_data_v <= i_uCM_data_v;
              for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
                o_hp_control(hp_i).enable <= '1';
                o_hp_control(hp_i).rst <= '0';
              end loop;
              heg_ctrl_motor <= SET_WINDOW;
            end if;

          when SET_WINDOW =>
            for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
              o_hp_control(hp_i).enable <= '1';
              o_hp_control(hp_i).rst <= '1';
            end loop;
            if i_Roi_win_valid = '1' then
              if c_ST_nBARREL_ENDCAP = '0' then -- barrel
                -- o_uCM2hp_data_r.specific.z_0 <= uCM_data_r.barrel.z;
              else --endcap

              end if;
              heg_ctrl_motor <= HEG_BUSY;
            end if;
          -- uCM_data_r <= ucm2heg_slc_f_std2rt(i_uCM_data_v);
          -- o_uCM_data <= int_uCM_data;
          -- o_hp_control.loc_enable <= '1';
          -- o_hp_control.enable <= (others => '1');
          -- o_hp_control.rst<= (others => '0');
          when HEG_BUSY =>
            if to_integer(unsigned(busy_count)) < HEG_BUSY_CLOCKS then
              for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
                o_hp_control(hp_i).enable <= '1';
                o_hp_control(hp_i).rst <= '1';
              end loop;
            else
              for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
                o_hp_control(hp_i).enable <= '0';
                o_hp_control(hp_i).rst <= '1';
              end loop;
              -- busy_count <= (others => '0');
              heg_ctrl_motor <= IDLE;
            end if;

        end case;
      end if;

    end if;
  end process;

  
end architecture beh;
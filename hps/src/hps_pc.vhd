--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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

entity hps_pc is
  generic(
    -- mdt type
    -- type mdt_type;
    g_SIM_nBUILD          : std_logic := '0';
    -- parameters
    g_STATION_RADIUS      : integer := 0  --station
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    glob_en               : in std_logic;
    -- configuration & control
    -- MDT hit
    i_mdt_tar_v           : in tar2hps_rvt;
    o_mdt_full_data_v     : out hp_hpsPc2hp_rvt
  );
end entity hps_pc;

architecture beh of hps_pc is

  constant c_HPS_PC_PL_LEN : integer := 4;
  signal dv_pl : std_logic_vector(c_HPS_PC_PL_LEN -1 downto 0);

  type mdt_tar_data_pl is array (c_HPS_PC_PL_LEN -1 downto 0) of tar2hps_rt;
  signal mdt_tar_data   : mdt_tar_data_pl;
  --t0
  signal t0_dv : std_logic;
  signal time_t0 : unsigned(MDT_TIME_LEN-1 downto 0);
  signal time_t0_pl : unsigned(MDT_TIME_LEN-1 downto 0);
  -- global position
  constant tubesize : unsigned(9 downto 0) := to_unsigned(integer(30.0 * MDT_GLOBAL_AXI_MULT),10); -- constant in 0.03125 mm resolution

  signal holesize : unsigned(MDT_GLOBAL_AXI_LEN - 1 downto 0);
  -- signal holesize_pl : unsigned(MDT_GLOBAL_AXI_LEN - 1 downto 0);
  signal r_pos : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  -- signal r_pos_pl : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal global_x : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal global_z : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  -- signal global_y_ph : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  -- signal global_z_ph : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal zh_dv : std_logic;
  signal r_dv : std_logic;
  -- to hp
  signal mdt_full_data_r  : hp_hpsPc2hp_rt;
  
  
begin

  mdt_tar_data(0) <= structify(i_mdt_tar_v);
  o_mdt_full_data_v <= vectorify(mdt_full_data_r);

  T0 : entity hps_lib.hps_pc_b_t0
    generic map(
      g_STATION_RADIUS    => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,
      --
      i_chamber           => mdt_tar_data(0).chamber_ieta,
      i_dv                => mdt_tar_data(0).data_valid,
      o_time_t0           => time_t0,
      o_dv                => t0_dv
    );

  ZH : entity hps_lib.hps_pc_b_zholes
    generic map(
      g_STATION_RADIUS    => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,
      --
      i_chamber           => mdt_tar_data(0).chamber_ieta,
      i_dv                => mdt_tar_data(0).data_valid,
      o_spaces            => holesize,
      o_dv                => zh_dv
    );

  TR : entity hps_lib.hps_pc_b_r
    generic map(
      g_STATION_RADIUS    => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,
      --
      i_layer             => mdt_tar_data(0).layer,
      i_dv                => mdt_tar_data(0).data_valid,
      o_r_pos             => r_pos,
      o_dv                => r_dv
    );

  dv_pl(0) <= mdt_tar_data(0).data_valid;


  COORD : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        -- reset
        global_z                    <= (others => '0');
        global_x                    <= (others => '0');
        time_t0_pl                  <= (others => '0');
        mdt_full_data_r.layer       <= (others => '0');
        mdt_full_data_r.tube        <= (others => '0');
        mdt_full_data_r.time_t0     <= (others => '0');
        mdt_full_data_r.global_z    <= (others => '0');
        mdt_full_data_r.global_x    <= (others => '0');
        mdt_full_data_r.data_valid  <= '0';
      else

        dv_pl(c_HPS_PC_PL_LEN -1 downto 1) <= dv_pl(c_HPS_PC_PL_LEN - 2 downto 0);

        mdt_tar_data(c_HPS_PC_PL_LEN -1 downto 1) <= mdt_tar_data(c_HPS_PC_PL_LEN - 2 downto 0);

        if dv_pl(1) = '1' then
          global_z <= mdt_tar_data(1).tube * tubesize; 
          global_x <= r_pos;

          time_t0_pl <= time_t0;
          
        else
          time_t0_pl <= (others => '0');
          global_z <= (others => '0');
          global_x <= (others => '0');
        end if;

        if dv_pl(2) = '1' then
          mdt_full_data_r.global_z <= global_z + holesize;
          mdt_full_data_r.global_x <= global_x;
          --
          mdt_full_data_r.time_t0 <= mdt_tar_data(2).time - time_t0_pl;
          --
          mdt_full_data_r.layer   <= mdt_tar_data(2).layer;
          mdt_full_data_r.tube    <= mdt_tar_data(2).tube;
          --
          mdt_full_data_r.data_valid <= '1';
        else
          mdt_full_data_r <= nullify(mdt_full_data_r);
          -- mdt_full_data_r.data_valid <= '0';
        end if;

      end if;

    end if;

  end process;


  -- o_mdt_full_data <= hp_hit_data_f_r2std(mdt_full_data_r);
  -- mdt_tar_data(0) <= tar2heg_mdt_f_std2rt(i_mdt_tar_data);

  -- mdt_full_data_r.layer   <= mdt_tar_data(0).layer;
  -- mdt_full_data_r.tube    <= mdt_tar_data(0).tube;

end beh;
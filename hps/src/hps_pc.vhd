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
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

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

  constant c_DV_PL_LEN : integer := 4;
  signal dv_pl : std_logic_vector(c_DV_PL_LEN -1 downto 0);

  signal mdt_tar_data   : tar2hps_rt;
  --t0
  signal t0_dv : std_logic;
  signal time_t0 : unsigned(MDT_TIME_LEN-1 downto 0);
  -- global position
  signal tubesize : unsigned(9 downto 0);
  signal holesize : unsigned(10 - 1 downto 0);
  signal global_y : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal global_z : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal global_y_ph : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal global_z_ph : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal zh_dv : std_logic;
  -- to hp
  signal mdt_full_data  : hp_hpsPc2hp_rt;
  
  
begin

  mdt_tar_data <= structify(i_mdt_tar_v);
  o_mdt_full_data_v <= vectorify(mdt_full_data);

  T0 : entity hps_lib.hps_pc_t0
    generic map(
      g_STATION_RADIUS    => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,
      --
      i_chamber           => mdt_tar_data.chamber_id,
      i_dv                => mdt_tar_data.data_valid,
      o_time_t0           => time_t0,
      o_dv                => t0_dv
      
    );

  ZH : entity hps_lib.hps_pc_zholes
    generic map(
      g_STATION_RADIUS    => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,
      --
      i_chamber           => mdt_tar_data.chamber_id,
      i_dv                => mdt_tar_data.data_valid,
      o_spaces            => holesize,
      o_dv                => zh_dv
      
    );

  dv_pl(0) <= mdt_tar_data.data_valid;

  tubesize <= to_unsigned(integer(30.0 * MDT_LOCAL_AXI_MULT),10);

  COORD : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        -- reset
        mdt_full_data.layer   <= (others => '0');
        mdt_full_data.tube    <= (others => '0');
        mdt_full_data.time_t0 <= (others => '0');
        mdt_full_data.global_z <= (others => '0');
        mdt_full_data.global_y <= (others => '0');
        mdt_full_data.data_valid <= '0';
      else

        for dv_i in 0 to c_DV_PL_LEN - 2 loop
          dv_pl(dv_i + 1) <= dv_pl(dv_i); 
        end loop;


        if dv_pl(0) = '1' then
          global_z <= mdt_tar_data.tube * tubesize; 

          -- write to out
          
        end if;

        if dv_pl(1) = '1' then
          mdt_full_data.global_z <= global_z + holesize;
          --
          mdt_full_data.time_t0 <= mdt_tar_data.time + time_t0;
          --
          mdt_full_data.layer   <= mdt_tar_data.layer;
          mdt_full_data.tube    <= mdt_tar_data.tube;
        end if;

      end if;

    end if;

  end process;


  -- o_mdt_full_data <= hp_hit_data_f_r2std(mdt_full_data);
  -- mdt_tar_data <= tar2heg_mdt_f_std2rt(i_mdt_tar_data);

  -- mdt_full_data.layer   <= mdt_tar_data.layer;
  -- mdt_full_data.tube    <= mdt_tar_data.tube;

end beh;
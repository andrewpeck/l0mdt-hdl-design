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

library vamc_lib;

--library hp_lib;
--use hp_lib.hp_pkg.all;
--library heg_lib;
--use heg_lib.heg_pkg.all;

library hegtypes_lib;
use hegtypes_lib.hp_pkg.all;
use hegtypes_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

entity hps_pc is
  generic(
    g_CHAMBER             : integer := 0;
    -- mdt type
    -- type mdt_type;
    g_SIM_nBUILD          : std_logic := '0';
    -- parameters
    g_STATION_RADIUS      : integer := 0  --station
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    ena                   : in std_logic;
    -- configuration & control
    i_ctrl_tc_v             : in  std_logic_vector;--HPS_MDT_TC_MDT_TC_CTRL_t;  
    o_mon_tc_v              : out std_logic_vector;-- HPS_MDT_TC_MDT_TC_MON_t;
    i_ctrl_t0_v             : in  std_logic_vector;--HPS_MDT_T0_MDT_T0_CTRL_t;  
    o_mon_t0_v              : out std_logic_vector;-- HPS_MDT_T0_MDT_T0_MON_t;   
    -- MDT hit
    i_mdt_tar_v           : in tar2hps_rvt;
    o_mdt_full_data_v     : out hp_hpsPc2hp_rvt
  );
end entity hps_pc;

architecture beh of hps_pc is
  signal i_mdt_tar_r : tar2hps_rt;
  signal pl_mdt_tar_v  : tar2hps_rvt;
  signal pl_mdt_tar_r  : tar2hps_rt;
  signal pl_mdt_tar_dv : std_logic;

  signal t0_ctrl_v : std_logic_vector(i_ctrl_t0_v'length - 1  downto 0);
  signal t0_mon_v : std_logic_vector(o_mon_t0_v'length - 1  downto 0);
  signal tc_ctrl_v : std_logic_vector(i_ctrl_tc_v'length - 1  downto 0);
  signal tc_mon_v : std_logic_vector(o_mon_tc_v'length - 1  downto 0);

  -- constant c_HPS_PC_PL_LEN : integer := 4;
  -- signal dv_pl : std_logic_vector(c_HPS_PC_PL_LEN -1 downto 0);

  
  -- type mdt_tar_data_pl_t is array (c_HPS_PC_PL_LEN -1 downto 0) of tar2hps_rt;
  -- signal mdt_tar_data_pl   : mdt_tar_data_pl_t;
  --t0
  signal t0_dv : std_logic;
  signal time_t0 : unsigned(MDT_TIME_LEN-1 downto 0);
  -- signal time_t0_pl : unsigned(MDT_TIME_LEN-1 downto 0);
  -- global position
  constant tubesize : unsigned(9 downto 0) := to_unsigned(integer(30.0 * MDT_GLOBAL_AXI_MULT),10); -- constant in 0.03125 mm resolution

  -- signal holesize : unsigned(MDT_GLOBAL_AXI_LEN - 1 downto 0);
  -- signal holesize_pl : unsigned(MDT_GLOBAL_AXI_LEN - 1 downto 0);
  -- signal r_pos : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  -- signal r_pos_pl : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal global_x : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal global_z : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  -- signal global_y_ph : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  -- signal global_z_ph : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  -- signal zh_dv : std_logic;
  signal r_dv : std_logic;
  -- to hp
  signal mdt_full_data_r  : hp_hpsPc2hp_rt;
  
  
begin

  tc_ctrl_v <= i_ctrl_tc_v ;
  o_mon_tc_v <= tc_mon_v; 
  t0_ctrl_v <= i_ctrl_t0_v;
  o_mon_t0_v  <= t0_mon_v;

  -- t0_ctrl_v <= vectorify(i_ctrl_t0,t0_ctrl_v);
  -- o_mon_t0 <= structify(t0_mon_v,o_mon_t0);

  -- tc_ctrl_v <= vectorify(i_ctrl_tc,tc_ctrl_v);
  -- o_mon_tc <= structify(tc_mon_v,o_mon_tc);

  i_mdt_tar_r  <= structify(i_mdt_tar_v);

  -- mdt_tar_data_pl(0) <= structify(i_mdt_tar_v);
  o_mdt_full_data_v <= vectorify(mdt_full_data_r);

  T0 : entity hps_lib.hps_pc_b_t0
    generic map(
      g_DELAY_CYCLES => 1,
      g_CHAMBER           => g_CHAMBER,
      g_STATION_RADIUS    => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      ena                 => ena,
      --
      ctrl_v                => t0_ctrl_v,
      mon_v                 => t0_mon_v,
      --
      i_chamber           => i_mdt_tar_r.chamber_ieta,
      i_dv                => i_mdt_tar_r.data_valid,
      o_time_t0           => time_t0,
      o_dv                => t0_dv
    );

  VC : entity hps_lib.hps_pc_mdt_tc
    generic map(
      g_CHAMBER           => g_CHAMBER,
      g_STATION_RADIUS    => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      ena                 => ena,
      --
      ctrl_v                => tc_ctrl_v,
      mon_v                 => tc_mon_v,
      --
      i_layer             => i_mdt_tar_r.layer,
      i_tube              => i_mdt_tar_r.tube,
      i_dv                => i_mdt_tar_r.data_valid,
      --
      o_global_x          => global_x,
      o_global_z          => global_z,
      o_dv                => r_dv
    );

    -- data_pl: process(clk)
    -- begin
    --   if rising_edge(clk) then
    --     if rst = '1' then
    --       for i in 0 to c_HPS_PC_PL_LEN - 2 loop
    --         dv_pl(i) <= '0';
    --         mdt_tar_data_pl(i) <= nullify(mdt_tar_data_pl(i));
    --       end loop;
    --     else
    --       dv_pl(0) <= i_mdt_tar_r.data_valid;
    --       mdt_tar_data_pl(0) <= i_mdt_tar_r;
    --       for i in 0 to c_HPS_PC_PL_LEN - 2 loop
    --         dv_pl(i + 1) <= dv_pl(i) ;
    --         mdt_tar_data_pl(i + 1) <= mdt_tar_data_pl(i);
    --       end loop;
          
    --     end if;
    --   end if;
    -- end process data_pl;

    PL_B : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES      => 2,
      g_PIPELINE_WIDTH    => i_mdt_tar_v'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      i_data      => i_mdt_tar_v,
      i_dv        => i_mdt_tar_r.data_valid,
      o_data      => pl_mdt_tar_v,
      o_dv        => pl_mdt_tar_dv
    );

    pl_mdt_tar_r  <= structify(pl_mdt_tar_v);
  

  COORD : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        -- reset
        -- global_z                    <= (others => '0');
        -- global_x                    <= (others => '0');
        -- time_t0_pl                  <= (others => '0');
        mdt_full_data_r.layer       <= (others => '0');
        mdt_full_data_r.tube        <= (others => '0');
        mdt_full_data_r.time_t0     <= (others => '0');
        mdt_full_data_r.global_z    <= (others => '0');
        mdt_full_data_r.global_x    <= (others => '0');
        mdt_full_data_r.data_valid  <= '0';
      else

        -- dv_pl(c_HPS_PC_PL_LEN -1 downto 1) <= dv_pl(c_HPS_PC_PL_LEN - 2 downto 0);

        -- mdt_tar_data_pl(c_HPS_PC_PL_LEN -1 downto 1) <= mdt_tar_data_pl(c_HPS_PC_PL_LEN - 2 downto 0);

        -- if dv_pl(1) = '1' then
        --   -- global_z <= mdt_tar_data_pl(1).tube * tubesize; 
        --   -- global_x <= r_pos;

        --   -- time_t0_pl <= time_t0;
          
        -- else
        --   -- time_t0_pl <= (others => '0');
        --   -- global_z <= (others => '0');
        --   -- global_x <= (others => '0');
        -- end if;

        if pl_mdt_tar_dv  = '1' then
          mdt_full_data_r.global_z <= global_z;-- + holesize;
          mdt_full_data_r.global_x <= global_x;
          --
          mdt_full_data_r.time_t0 <= pl_mdt_tar_r.time - time_t0;
          --
          mdt_full_data_r.layer   <= pl_mdt_tar_r.layer;
          mdt_full_data_r.tube    <= pl_mdt_tar_r.tube;
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
  -- mdt_tar_data_pl(0) <= tar2heg_mdt_f_std2rt(i_mdt_tar_data);

  -- mdt_full_data_r.layer   <= mdt_tar_data_pl(0).layer;
  -- mdt_full_data_r.tube    <= mdt_tar_data_pl(0).tube;

end beh;

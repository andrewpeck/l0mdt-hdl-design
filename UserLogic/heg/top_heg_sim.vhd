--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: heg
-- File: top_heg_sim.vhd
-- Module: <<moduleName>>
-- File PATH: /top_heg_sim.vhd
-- -----
-- File Created: Thursday, 14th April 2022 8:57:28 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Sunday, 2nd October 2022 9:05:46 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2022-10-02	GLdL	Update of old TB with new CSV pkg
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
  -- use shared_lib.detector_param_pkg.all;
  use shared_lib.detector_time_param_pkg.all;
  use shared_lib.l0mdt_sim_cstm_pkg.all;
  use shared_lib.vhdl_textio_csv_pkg.all;

  use shared_lib.heg_sim_cstm_pkg.all;

library hp_lib;
  use hp_lib.hp_pkg.all;
library heg_lib;
  use heg_lib.heg_pkg.all;

library ctrl_lib;
  use ctrl_lib.HPS_CTRL.all;
  use ctrl_lib.HPS_CTRL_DEF.all;

library vamc_lib;

entity heg_tb is
  generic(
    PRJ_INFO            : string  := "not defined";
    g_ST_ENABLE         : std_logic_vector(3 downto 0) := (others => '0');
    g_THREAD            : std_logic_vector(3 downto 0) := (others => '0');
    IN_HPS_PC_FILE      : string  := "not_defined.csv";
    IN_UCM_FILE         : string  := "not_defined.csv";
    IN_CTRL_FILE        : string  := "not_defined.csv";
    DUMMY               : boolean := false
  );
end entity heg_tb;

architecture beh of heg_tb is

  -- type ucm2heg_aavt is array (c_MAX_NUM_ST -1 downto 0) of ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  -- type pc2heg_aavt is array (c_MAX_NUM_ST -1 downto 0) of heg_pc2heg_avt(c_TOTAL_MAX_NUM_HP -1 downto 0);

  -- type heg_ctrl2sf_avt is array(integer range <>) of heg_ctrl2sf_vt;
  -- type heg2sf_control_aavt is array(c_MAX_NUM_ST -1 downto 0) of heg_ctrl2sf_avt(c_NUM_THREADS -1 downto 0);
  -- type heg2sf_slc_data_aavt is array(c_MAX_NUM_ST -1 downto 0) of heg2sfslc_avt(c_NUM_THREADS -1 downto 0);
  -- type heg2sf_mdt_data_aavt is array(c_MAX_NUM_ST -1 downto 0) of heg2sfhit_avt(c_NUM_THREADS -1 downto 0);
  -------------------------------------------------------------------------------------
  -- control signals
  -------------------------------------------------------------------------------------
    -- AXI clk & rst
    signal axi_rst      : std_logic;
    signal clk_axi      : std_logic;
    signal clk_axi_cnt  : integer;
    -- constant c_CLK_AXI_MULT : integer := 5; 
    -- clk
    constant clk_time_period : time := 1 ns;  -- 1Ghz
    signal clk_time : std_logic := '0';
    signal tb_curr_time : unsigned(63 downto 0) := (others => '0');
    -- clk 0.78
    constant clk_tdc_time_period : time := 0.78125 ns;  
    signal clk_tdc_time : std_logic := '0';
    signal tb_curr_tdc_time : unsigned(63 downto 0) := (others => '0');
    -- clk 100ps
    constant clk_sim_time_period : time := 100 ps;  
    signal clk_sim_time : std_logic := '0';
    signal tb_curr_sim_time : unsigned(63 downto 0) := (others => '0');
    -- clk
    constant clk_period : time := 3.125 ns;  -- 320Mhz
    signal clk : std_logic := '0';
    -- rest
    constant reset_init_cycles : integer := 3;
    signal rst: std_logic;

    signal glob_en : std_logic := '1';
    signal ena     : std_logic := '1';
    --
    signal i_freeze             : std_logic := '0';
    signal bx : std_logic := '0'; 

    signal ucm2heg_file_ok    : std_logic;
    signal ucm2heg_file_ts    : string(1 to LINE_LENGTH_MAX);
    signal pc2heg_file_ok    : std_logic;
    signal pc2heg_file_ts    : string(1 to LINE_LENGTH_MAX);
      --
    signal ucm2heg_slc_event_au : event_xaut(c_NUM_THREADS -1 downto 0);
    signal pl_ucm2heg_slc_event_au : event_xaut(c_NUM_THREADS -1 downto 0);
    signal pl_ucm2hps_slc_event_a : event_xat(c_NUM_THREADS -1 downto 0);
    signal pc2heg_mdt_event_au : event_tdc_aut;
    signal pc2heg_slc_event_au : event_tdc_aut;
  -------------------------------------------------------------------------------------
    type ctrl_art is array (c_NUM_THREADS -1 downto 0) of HPS_HEG_HEG_CTRL_t;
    type ctrl_aart is array (c_MAX_NUM_ST -1 downto 0) of ctrl_art;  
    type ctrl_avt is array (c_NUM_THREADS -1 downto 0) of std_logic_vector(HPS_HEG_HEG_CTRL_t'w -1 downto 0);
    type ctrl_aavt is array (c_MAX_NUM_ST -1 downto 0) of ctrl_avt;
    --
    type mon_art is array (c_NUM_THREADS -1 downto 0) of HPS_HEG_HEG_MON_t;
    type mon_aart is array (c_MAX_NUM_ST -1 downto 0) of mon_art;
    type mon_avt is array (c_NUM_THREADS -1 downto 0) of std_logic_vector(HPS_HEG_HEG_MON_t'w -1 downto 0);
    type mon_aavt is array (c_MAX_NUM_ST -1 downto 0) of mon_avt;
    --
    signal ctrl_aar               : ctrl_aart := (others => (others => DEFAULT_HPS_HEG_HEG_CTRL_t)) ;
    signal mon_aar                : mon_aart;
    signal ctrl_aav               : ctrl_aavt;
    signal mon_aav                : mon_aavt;
    -- signal ctrl_r               : HPS_HEG_HEG_CTRL_t := DEFAULT_HPS_HEG_HEG_CTRL_t ;
    -- signal mon_r                : HPS_HEG_HEG_MON_t;
    -- signal ctrl_v               : std_logic_vector(HPS_HEG_HEG_CTRL_t'w - 1 downto 0);
    -- signal mon_v                : std_logic_vector(HPS_HEG_HEG_MON_t'w - 1 downto 0);
  -------------------------------------------------------------------------------------
  -- SLc
  signal i_uCM_data_v         : ucm2hps_vt := (others => '0');
  -- MDT hit
  signal pc2heg_aav   : pc2heg_aavt;
  --heg_pc2heg_avt(c_HP_NUM_SECTOR_STATION(g_STATION_RADIUS)-1 downto 0) := (others => (others => '0'));
  -- to Segment finder
  signal o_sf_control_v       : heg_ctrl2sf_vt := (others => '0');
  signal o_sf_slc_data_v      : heg2sfslc_vt := (others => '0');
  signal o_sf_mdt_data_v      : heg2sfhit_vt := (others => '0');

  signal ucm2hps_aav        : ucm2heg_aavt;
  signal pl_ucm2hps_aav     : ucm2heg_aavt;

  signal ucm2heg_aav          : ucm2heg_aavt;
  signal heg2sf_control_aarv  : heg2sf_control_aavt; 
  signal heg2sf_slc_data_aav  : heg2sf_slc_data_aavt;
  signal heg2sf_mdt_data_aav  : heg2sf_mdt_data_aavt;

begin
  -------------------------------------------------------------------------------------
  -- control signals
  -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
    -- clock Generator
    -------------------------------------------------------------------------------------
    CLK_RT : process begin
      clk_time <= '0';
      wait for CLK_time_period/2;
      clk_time <= '1';
      wait for CLK_time_period/2;
    end process;
    -------------------------------------------------------------------------------------
    -- clock tdc Generator
    -------------------------------------------------------------------------------------
    CLK_TDC : process begin
      clk_tdc_time <= '0';
      wait for CLK_tdc_time_period/2;
      clk_tdc_time <= '1';
      wait for CLK_tdc_time_period/2;
    end process;
    -- clock_and_control.clk <= clk;
    -------------------------------------------------------------------------------------
    -- Main FPGA clock
    -------------------------------------------------------------------------------------
    CLK_MAIN : process begin
      clk <= '0';
      wait for CLK_period/2;
      clk <= '1';
      wait for CLK_period/2;
    end process;
    -- clk <= clk;
    -------------------------------------------------------------------------------------
    --    AXI CLK
    -------------------------------------------------------------------------------------
    axi_clk_proc : process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          clk_axi <= '0';
          clk_axi_cnt <= 0;
        else
          if clk_axi_cnt < c_CLK_AXI_MULT then
            clk_axi_cnt <= clk_axi_cnt + 1;
          else
            clk_axi_cnt <= 0;
            clk_axi <= not clk_axi;
          end if;
        end if;
      end if;
    end process axi_clk_proc;
    -------------------------------------------------------------------------------------
    -- AXI Reset Generator
    -------------------------------------------------------------------------------------
    axi_rst_process: process begin
      axi_rst<='0';
      wait for CLK_period*c_CLK_AXI_MULT;
      axi_rst<='1';
      wait for CLK_period*reset_init_cycles*c_CLK_AXI_MULT;
      axi_rst<= '0';
      wait;
    end process;
    -------------------------------------------------------------------------------------
    -- Reset Generator
    -------------------------------------------------------------------------------------
    rst_process: process begin
      rst<='0';
      report "current time = " & time'image(now);
      wait for CLK_period;
      rst<='1';
      wait for CLK_period*reset_init_cycles;
      rst<= '0';
      wait;
    end process;
    -- rst <= rst;
    -------------------------------------------------------------------------------------
    -- Test Bench time
    -------------------------------------------------------------------------------------
    ToA: process(clk_time) begin
      if rising_edge(clk_time) then
        tb_curr_time <= tb_curr_time + '1';
      end if;
    end process;
    -------------------------------------------------------------------------------------
    -- Test Bench tdc time
    -------------------------------------------------------------------------------------
    ToA_tdc: process(clk_tdc_time) begin
      if rising_edge(clk_tdc_time) then
        tb_curr_tdc_time <= tb_curr_tdc_time + '1';
      end if;
    end process;
    -------------------------------------------------------------------------------------
    -- clock Sim Generator
    -------------------------------------------------------------------------------------
    CLK_SIM : process begin
      clk_sim_time <= '0';
      wait for clk_sim_time_period/2;
      clk_sim_time <= '1';
      wait for clk_sim_time_period/2;
    end process;
    -------------------------------------------------------------------------------------
    -- Test Bench sim time
    -------------------------------------------------------------------------------------
    ToA_sim: process(clk_sim_time) begin
      if rising_edge(clk_sim_time) then
        tb_curr_sim_time <= tb_curr_sim_time + '1';
      end if;
    end process;
  -------------------------------------------------------------------------------------
	-- HPS PC IN
  -------------------------------------------------------------------------------------
  HPS_PC2HEG : entity shared_lib.csv_reader_hps_pc2heg 
  generic map (
   g_PRJ_INFO           => PRJ_INFO,
   g_ST_ENABLE          => g_ST_ENABLE,
   g_IN_HPS_PC_FILE    => IN_HPS_PC_FILE
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    ena                 => glob_en,
    --
    tb_curr_tdc_time    => tb_curr_tdc_time,
    --
    o_file_ok           => pc2heg_file_ok,
    o_file_ts           => pc2heg_file_ts, 
    --
    o_mdt_event_ai      => pc2heg_mdt_event_au,
    o_slc_event_ai      => pc2heg_slc_event_au,
    --
    o_pc2heg_inn_av   => pc2heg_aav(0),
    o_pc2heg_mid_av   => pc2heg_aav(1),
    o_pc2heg_out_av   => pc2heg_aav(2),
    o_pc2heg_ext_av   => pc2heg_aav(3)
  );
  -------------------------------------------------------------------------------------
	-- UCM IN
  -------------------------------------------------------------------------------------
  UCM2HPS : entity shared_lib.csv_reader_ucm2hps 
  generic map (
    g_PRJ_INFO        => PRJ_INFO,
    g_ST_ENABLE       => g_ST_ENABLE,
    g_IN_UCM2HPS_FILE => IN_UCM_FILE
  )
  port map(
    clk               => clk,
    rst               => rst,
    ena               => glob_en,
    --
    tb_curr_tdc_time  => tb_curr_tdc_time,
    --
    o_file_ok         => ucm2heg_file_ok,
    o_file_ts         => ucm2heg_file_ts, 
    --
    o_slc_event_ai    => ucm2heg_slc_event_au,
    -- TAR Hits for simulation
    o_ucm2hps_inn_av  => ucm2hps_aav(0),
    o_ucm2hps_mid_av  => ucm2hps_aav(1),
    o_ucm2hps_out_av  => ucm2hps_aav(2),
    o_ucm2hps_ext_av  => ucm2hps_aav(3)
  );
  STATION_GEN: for st_i in 0 to 3 generate
    TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
      C_PL : entity vamc_lib.vamc_spl
        generic map(
          -- pragma translate_off
          g_SIMULATION => '1',
          -- pragma translate_on
          -- g_PIPELINE_TYPE => "ring_buffer",
          g_DELAY_CYCLES  => 12,
          g_PIPELINE_WIDTH    => ucm2hps_vt'w
        )
        port map(
          clk         => clk,
          rst         => rst,
          ena         => '1',
          --
          i_data      => ucm2hps_aav(st_i)(th_i),
          o_data      => pl_ucm2hps_aav(st_i)(th_i)
      );
    end generate TH_GEN;

  end generate STATION_GEN;
  TH_ID_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
    C_PL : entity vamc_lib.vamc_spl
      generic map(
        -- pragma translate_off
        g_SIMULATION => '1',
        -- pragma translate_on
        -- g_PIPELINE_TYPE => "ring_buffer",
        g_DELAY_CYCLES  => 12,
        g_PIPELINE_WIDTH    => 32
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => '1',
        --
        i_data      => std_logic_vector(ucm2heg_slc_event_au(th_i)),
        o_data      => pl_ucm2hps_slc_event_a(th_i)
    );
    pl_ucm2heg_slc_event_au(th_i) <= unsigned(pl_ucm2hps_slc_event_a(th_i));
  end generate TH_ID_GEN;
  -------------------------------------------------------------------------------------
	-- HEGs
  -------------------------------------------------------------------------------------
  ST_FOR: for st_i in 0 to c_MAX_NUM_ST-1 generate
    ST_IG: if g_ST_ENABLE(st_i) generate
      TH_FOR: for th_i in 0 to c_NUM_THREADS-1 generate
        TH_IF: if g_THREAD(th_i) generate
          ctrl_aav(st_i)(th_i) <= convert(ctrl_aar(st_i)(th_i),ctrl_aav(st_i)(th_i));
          mon_aar(st_i)(th_i) <= convert(mon_aav(st_i)(th_i),mon_aar(st_i)(th_i));
          -------------------------------------------------------
          HEG : entity heg_lib.heg
            generic map(
              g_STATION_RADIUS      => st_i,
              g_HPS_NUM_MDT_CH      => c_HP_NUM_SECTOR_STATION(st_i)
            )
            port map(
              clk                   => CLK,
              rst                   => rst,
              glob_en               => glob_en,
              -- configuration+
              ctrl_v                => ctrl_aav(st_i)(th_i),
              mon_v                 => mon_aav(st_i)(th_i),
              -- SLc
              i_uCM_data_v          => pl_ucm2hps_aav(st_i)(th_i),
              -- MDT hit
              i_mdt_full_data_av    => pc2heg_aav(st_i),
              -- to Segment finder
              o_sf_control_v        => heg2sf_control_aarv(st_i)(th_i),
              o_sf_slc_data_v       => heg2sf_slc_data_aav(st_i)(th_i),
              o_sf_mdt_data_v       => heg2sf_mdt_data_aav(st_i)(th_i)
          );
        end generate TH_IF;
      end generate TH_FOR;
    end generate ST_IG;    
  end generate ST_FOR;
  -------------------------------------------------------------------------------------
	-- 
  -------------------------------------------------------------------------------------
  HEGINTOUT : entity shared_lib.csv_writer_heg_int
    generic map (
      g_PRJ_INFO        => PRJ_INFO,
      g_ST_ENABLE       => g_ST_ENABLE
    )
    port map(
      clk                     => clk,
      rst                     => rst,
      enable                  => glob_en,
      --
      tb_curr_sim_time        => tb_curr_sim_time,
      tb_curr_tdc_time        => tb_curr_tdc_time,
      --
      i_ucm2heg_file_ok       => ucm2heg_file_ok,
      i_ucm2heg_file_ts       => ucm2heg_file_ts,
      i_pc2heg_file_ok        => pc2heg_file_ok,
      i_pc2heg_file_ts        => pc2heg_file_ts,
      -- --
      i_ucm2heg_slc_event_au  => pl_ucm2heg_slc_event_au,
      i_pc2heg_mdt_event_au  => pc2heg_mdt_event_au,
      i_pc2heg_slc_event_au  => pc2heg_slc_event_au
  );
  -------------------------------------------------------------------------------------
	-- 
  -------------------------------------------------------------------------------------
  HEG2SF_OUT : entity shared_lib.csv_writer_heg
  generic map (
    g_PRJ_INFO        => PRJ_INFO,
    g_ST_ENABLE       => g_ST_ENABLE
  )
  port map(
    clk                     => clk,
    rst                     => rst,
    enable                  => glob_en,
    --
    tb_curr_sim_time        => tb_curr_sim_time,
    tb_curr_tdc_time        => tb_curr_tdc_time,
    --
    i_ucm2heg_file_ok       => ucm2heg_file_ok,
    i_ucm2heg_file_ts       => ucm2heg_file_ts,
    i_pc2heg_file_ok        => pc2heg_file_ok,
    i_pc2heg_file_ts        => pc2heg_file_ts,
    -- --
    i_ucm2heg_slc_event_au  => pl_ucm2heg_slc_event_au,
    i_pc2heg_mdt_event_au   => pc2heg_mdt_event_au,
    i_pc2heg_slc_event_au   => pc2heg_slc_event_au,
    --
    i_sf_control_aav        => heg2sf_control_aarv,
    i_sf_slc_data_aav       => heg2sf_slc_data_aav,
    i_sf_mdt_data_aav       => heg2sf_mdt_data_aav
);
  -------------------------------------------------------------------------------------
	-- 
  -------------------------------------------------------------------------------------
end beh;


    -- HPS: if g_ST_ENABLE(st_i)='1' generate
    --   signal ctrl_r             : HPS_CTRL_t := DEFAULT_HPS_CTRL_t;
    --   signal mon_r              : HPS_MON_t;
    -- begin
    --   ctrl_v(st_i) <= convert(ctrl_r,ctrl_v(st_i));
    --   mon_r <= convert(mon_v(st_i),mon_r);
    --   --------------------------------------------------------------
    --   HPS : entity hps_lib.hps
    --     generic map(
    --       g_STATION_RADIUS    => st_i,
    --       g_HPS_NUM_MDT_CH     => c_HP_NUM_SECTOR_STATION(st_i)
    --     )
    --     port map(
    --       clk                 => clk,
    --       rst                 => rst,
    --       glob_en             => glob_en,
    --       -- configuration & control
    --       ctrl_v              => ctrl_v(st_i),
    --       mon_v               => mon_v(st_i),
    --       -- SLc
    --       i_uCM2hps_av        => pl_ucm2hps_aav(st_i),
    --       -- MDT hit
    --       i_mdt_tar_av        => tar2hps_aav(st_i),
    --       -- to pt calc
    --       o_sf2pt_av          => hps2pt_aav(st_i)
    --   );
    -- else generate
    --   mon_v(st_i) <= (others => '0');
    --   ctrl_v(st_i) <= (others => '0');
    --   pl_ucm2hps_aav(st_i) <= (others => (others => '0'));
    --   tar2hps_aav(st_i) <= (others => (others => '0'));
    --   hps2pt_aav(st_i) <= (others => (others => '0'));
    -- end generate;
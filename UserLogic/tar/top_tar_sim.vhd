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
-- use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;
-- library project_lib;
use shared_lib.l0mdt_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;
--
use shared_lib.tar_sim_pkg.all;

library tar_lib;
use tar_lib.tar_pkg.all;

library ctrl_lib;
use ctrl_lib.tar_CTRL.all;
use ctrl_lib.TAR_CTRL_DEF.all;


entity tar_tb is
  generic (
    g_ST_ENABLE : std_logic_vector(3 downto 0) := (others => '0');
    --
    PRJ_INFO            : string  := "not_defined";
    IN_HIT_FILE         : string  := "not_defined.csv";
    IN_CTRL_FILE        : string  := "not_defined.csv";
    DUMMY               : boolean := false
    );
end entity tar_tb;

architecture beh of tar_tb is

  constant ST_ENABLE : std_logic_vector(3 downto 0) := g_ST_ENABLE;

  signal enable_mdt : std_logic := '1';
  signal glob_freeze : std_logic := '0';
  
  ---------------------------------------------------------------------------
  -- simulation signals
  ---------------------------------------------------------------------------
  -- AXI clk & rst
  signal axi_rst      : std_logic;
  signal clk_axi      : std_logic;
  signal clk_axi_cnt  : integer;
  -- constant c_CLK_AXI_MULT : integer := 5; 
  -- clk
  constant clk_time_period : time := 1 ns;  -- 1Ghz
  signal clk_time : std_logic := '0';
  signal tb_curr_time : unsigned(63 downto 0) := (others => '0');
  -- clk 0.78125
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

  signal bx : std_logic := '0'; 

  signal tar_inn_ctrl_r :  TAR_CTRL_t := DEFAULT_TAR_CTRL_t;
  signal tar_mid_ctrl_r :  TAR_CTRL_t := DEFAULT_TAR_CTRL_t;
  signal tar_out_ctrl_r :  TAR_CTRL_t := DEFAULT_TAR_CTRL_t;
  signal tar_ext_ctrl_r :  TAR_CTRL_t := DEFAULT_TAR_CTRL_t;
  signal tar_inn_mon_r  :  TAR_MON_t ;
  signal tar_mid_mon_r  :  TAR_MON_t ;
  signal tar_out_mon_r  :  TAR_MON_t ;
  signal tar_ext_mon_r  :  TAR_MON_t ;

  signal tar_inn_ctrl_v : std_logic_vector(TAR_CTRL_t'w - 1 downto 0);
  signal tar_mid_ctrl_v : std_logic_vector(TAR_CTRL_t'w - 1 downto 0);
  signal tar_out_ctrl_v : std_logic_vector(TAR_CTRL_t'w - 1 downto 0);
  signal tar_ext_ctrl_v : std_logic_vector(TAR_CTRL_t'w - 1 downto 0);
  signal tar_inn_mon_v  : std_logic_vector(TAR_MON_t'w - 1 downto 0);
  signal tar_mid_mon_v  : std_logic_vector(TAR_MON_t'w - 1 downto 0);
  signal tar_out_mon_v  : std_logic_vector(TAR_MON_t'w - 1 downto 0);
  signal tar_ext_mon_v  : std_logic_vector(TAR_MON_t'w - 1 downto 0);

  -- TDC Hits from Polmux
  signal i_mdt_tdc_inn_av :  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tdc_mid_av :  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tdc_out_av :  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tdc_ext_av :  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => (others => '0'));

  -- signal i_mdt_tdc_av :  tdcpolmux2tar_avt (c_TOTAL_MAX_NUM_HP -1 downto 0) := (others => (others => '0'));

  -- signal mdt_event_ai             : event_xaut(c_MAX_NUM_SL -1 downto 0);
  -- signal hit_event_ai             : event_xaut(c_MAX_NUM_SL -1 downto 0);

  -------------- OLD ----------------------

  -- -- clk
  -- constant clk_period : time := 3.125 ns;  -- 320Mhz
  -- signal clk : std_logic := '0';
  -- -- rest
  -- constant reset_init_cycles : integer := 3;
  -- signal rst                 : std_logic;
  -- signal glob_en             : std_logic := '1';
  -- --

  signal ctrl_r              : TAR_CTRL_t := DEFAULT_TAR_CTRL_t ;
  signal mon_r               : TAR_MON_t;
  signal ctrl_v              : std_logic_vector(TAR_CTRL_t'w - 1 downto 0); --  : in  TAR_CTRL_t;
  signal mon_v               : std_logic_vector(TAR_MON_t'w - 1 downto 0);--  : out TAR_MON_t;
  -- -- TDC Hits from Polmux
  -- signal i_tdc_hits_av    : tdcpolmux2tar_avt (g_HPS_MAX_HP -1 downto 0):= (others => (others => '0'));
  -- TDC polmux from Tar
  signal o_tdc_hits_inn_av    : tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal o_tdc_hits_mid_av    : tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal o_tdc_hits_out_av    : tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal o_tdc_hits_ext_av    : tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
  -- TDC Hits from Tar
  signal o_tar_hits_inn_av    : tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal o_tar_hits_mid_av    : tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal o_tar_hits_out_av    : tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal o_tar_hits_ext_av    : tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  ---------------------------------------------------------------------------
  -- 
  ---------------------------------------------------------------------------
  signal mdt_file_ok         : std_logic;
  signal mdt_file_ts         : string(1 to LINE_LENGTH_MAX);
  -- signal mdt_event_ai        : event_xaut(3 downto 0);
  -- signal slc_event_ai        : event_xaut(3 downto 0);
  signal mdt_event_ai     : event_tdc_aut := (others => (others => (others => '0')));
  signal slc_event_ai     : event_tdc_aut := (others => (others => (others => '0')));
  
begin
  -------------------------------------------------------------------------------------
	-- TAR
  -------------------------------------------------------------------------------------

  TAR_INN_GEN: if ST_ENABLE(0)='1' generate
    TAR_INN : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HP_MAX_NUM_SECTOR_STATION(0),
      g_STATION => 0
    )
    port map (
      -- clock, control, and monitoring
      clk             => clk,
      rst             => rst,
      glob_en         => glob_en,
      glob_freeze => glob_freeze,
      --
      ctrl_v            => tar_inn_ctrl_v,
      mon_v             => tar_inn_mon_v,
      -- TDC Hits from Polmux
      i_tdc_hits_av  => i_mdt_tdc_inn_av,
      -- to daq
      o_tdc_hits_av  => o_tdc_hits_inn_av,
      -- outputs to h2s
      o_tar_hits_av  => o_tar_hits_inn_av
  
    );
  end generate;
  TAR_MID_GEN: if ST_ENABLE(1)='1' generate
    TAR_MID : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HP_MAX_NUM_SECTOR_STATION(1),
      g_STATION => 1
    )
    port map (
      -- clock, control, and monitoring
      clk             => clk,
      rst             => rst,
      glob_en         => glob_en,
      glob_freeze => glob_freeze,
      --
      ctrl_v            => tar_mid_ctrl_v,
      mon_v             => tar_mid_mon_v,
      -- TDC Hits from Polmux
      i_tdc_hits_av  => i_mdt_tdc_mid_av,
      -- to daq
      o_tdc_hits_av  => o_tdc_hits_mid_av,
      -- outputs to h2s
      o_tar_hits_av  => o_tar_hits_mid_av

    );
  end generate;
  TAR_OUT_GEN: if ST_ENABLE(2)='1' generate
    TAR_OUT : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HP_MAX_NUM_SECTOR_STATION(2),
      g_STATION => 2
    )
    port map (
      -- clock, control, and monitoring
      clk             => clk,
      rst             => rst,
      glob_en         => glob_en,
      glob_freeze => glob_freeze,
      --
      ctrl_v            => tar_out_ctrl_v,
      mon_v             => tar_out_mon_v,
      -- TDC Hits from Polmux
      i_tdc_hits_av  => i_mdt_tdc_out_av,
      -- to daq
      o_tdc_hits_av  => o_tdc_hits_out_av,
      -- outputs to h2s
      o_tar_hits_av  => o_tar_hits_out_av
  
    );
  end generate;
  TAR_EXT_GEN: if ST_ENABLE(3)='1' generate
    TAR_EXT : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HP_MAX_NUM_SECTOR_STATION(3),
      g_STATION => 3
    )
    port map (
      -- clock, control, and monitoring
      clk             => clk,
      rst             => rst,
      glob_en         => glob_en,
      glob_freeze => glob_freeze,
      --
      ctrl_v            => tar_ext_ctrl_v,
      mon_v             => tar_ext_mon_v,
      -- TDC Hits from Polmux
      i_tdc_hits_av  => i_mdt_tdc_ext_av,
      -- to daq
      o_tdc_hits_av  => o_tdc_hits_ext_av,
      -- outputs to h2s
      o_tar_hits_av  => o_tar_hits_ext_av
  
    );
  end generate;

  -------------------------------------------------------------------------------------
	-- MDT IN
  -------------------------------------------------------------------------------------
  MDT : entity shared_lib.csv_reader_mdt 
  generic map (
    IN_HIT_FILE => IN_HIT_FILE,
    g_verbose => 2
  )
  port map(
    clk               => clk,
    rst               => rst,
    enable            => glob_en,
      glob_freeze => glob_freeze,
    --
    tb_curr_sim_time  => tb_curr_sim_time,
    tb_curr_tdc_time  => tb_curr_tdc_time,
    --
    o_file_ok         => mdt_file_ok,
    o_file_ts         => mdt_file_ts, 
    --
    o_mdt_event_ai    => mdt_event_ai,
    o_slc_event_ai    => slc_event_ai,
    -- TAR Hits for simulation
    o_mdt_tdc_inn_av  => i_mdt_tdc_inn_av,
    o_mdt_tdc_mid_av  => i_mdt_tdc_mid_av,
    o_mdt_tdc_out_av  => i_mdt_tdc_out_av,
    o_mdt_tdc_ext_av  => i_mdt_tdc_ext_av
  );
  -------------------------------------------------------------------------------------
	-- TAR OUT
  -------------------------------------------------------------------------------------
  TAR2HPS : entity shared_lib.csv_writer_tar
  generic map (
    g_PRJ_INFO    => PRJ_INFO,
    g_IN_FILES => IN_HIT_FILE
    -- g_IN_SLC_FILE => IN_SLC_FILE
    -- OUT_PTIN_SF_FILE => OUT_PTIN_SF_FILE,
    -- OUT_PTIN_MPL_FILE => OUT_PTIN_MPL_FILE
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    enable              => enable_mdt,
    --
    tb_curr_sim_time    => tb_curr_sim_time,
    tb_curr_tdc_time    => tb_curr_tdc_time,
    --
    in_mdt_file_ok      => mdt_file_ok,
    in_mdt_file_ts      => mdt_file_ts,
    -- --
    i_mdt_event_ai      => mdt_event_ai,
    i_slc_event_ai      => slc_event_ai,
    -- to daq
    i_tdc_hits_inn_av   => o_tdc_hits_inn_av,
    i_tdc_hits_mid_av   => o_tdc_hits_mid_av,
    i_tdc_hits_out_av   => o_tdc_hits_out_av,
    i_tdc_hits_ext_av   => o_tdc_hits_ext_av,
    -- outputs to h2s
    i_tar_hits_inn_av   => o_tar_hits_inn_av,
    i_tar_hits_mid_av   => o_tar_hits_mid_av,
    i_tar_hits_out_av   => o_tar_hits_out_av,
    i_tar_hits_ext_av   => o_tar_hits_ext_av

  );

  tar_inn_ctrl_v <= convert(tar_inn_ctrl_r,tar_inn_ctrl_v);
  tar_mid_ctrl_v <= convert(tar_mid_ctrl_r,tar_mid_ctrl_v);
  tar_out_ctrl_v <= convert(tar_out_ctrl_r,tar_out_ctrl_v);
  tar_ext_ctrl_v <= convert(tar_ext_ctrl_r,tar_ext_ctrl_v);
  tar_inn_mon_r <= convert(tar_inn_mon_v,tar_inn_mon_r);
  tar_mid_mon_r <= convert(tar_mid_mon_v,tar_mid_mon_r);
  tar_out_mon_r <= convert(tar_out_mon_v,tar_out_mon_r);
  tar_ext_mon_r <= convert(tar_ext_mon_v,tar_ext_mon_r);

  -- ctrl_v <= convert(ctrl_r,ctrl_v);
  -- mon_r <= convert(mon_v,mon_r);

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
	-- clock Sim Generator
	-------------------------------------------------------------------------------------
  CLK_SIM : process begin
    clk_sim_time <= '0';
    wait for clk_sim_time_period/2;
    clk_sim_time <= '1';
    wait for clk_sim_time_period/2;
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
 	-------------------------------------------------------------------------------------
	-- Reset Generator
	-------------------------------------------------------------------------------------
	rst_process: process begin
		rst<='0';
		wait for CLK_period;
		rst<='1';
		wait for CLK_period*reset_init_cycles;
		rst<= '0';
		wait;
  end process;
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
	-- Test Bench sim time
  -------------------------------------------------------------------------------------
  ToA_sim: process(clk_sim_time) begin
    if rising_edge(clk_sim_time) then
      tb_curr_sim_time <= tb_curr_sim_time + '1';
    end if;
  end process;
  

end beh;

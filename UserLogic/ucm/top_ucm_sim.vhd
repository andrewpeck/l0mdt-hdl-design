--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: top_ucm_sim.vhd
-- Module: <<moduleName>>
-- File PATH: /UserLogic/ucm/top_ucm_sim.vhd
-- -----
-- File Created: Monday, 11th April 2022 3:31:05 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 12th April 2022 5:06:04 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
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
use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;
-- library project_lib;
use shared_lib.l0mdt_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;
--
use shared_lib.ucm_sim_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_tb is
  generic (
    PRJ_INFO            : string  := "not_defined";
    IN_SLC_FILE         : string  := "not_defined.csv";
    IN_CTRL_FILE        : string  := "not_defined.csv";
    DUMMY               : boolean := false
    );
end entity ucm_tb;

architecture beh of ucm_tb is

  signal enable_slc : integer := 1;

  ---------------------------------------------------------------------------
  -- simulation signals generation
  ---------------------------------------------------------------------------
  -- AXI clk & rst
  signal axi_rst      : std_logic := '0';
  signal clk_axi      : std_logic := '0';
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
  -- clk
  constant clk_period : time := 3.125 ns;  -- 320Mhz
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal rst: std_logic;

  signal glob_en : std_logic := '1';

  signal bx : std_logic := '0';

  -- signal clk                     : std_logic;
  -- signal rst                     : std_logic;
  -- signal glob_en                 : std_logic;
  signal ttc_commands            : l0mdt_ttc_rt;
  -- configuration, control & Monitoring
  signal ctrl_r              : UCM_CTRL_t;
  signal mon_r               : UCM_MON_t;
  signal ctrl_v              : std_logic_vector(UCM_CTRL_t'w-1 downto 0) := (others => '0');--UCM_CTRL_t;
  signal mon_v               : std_logic_vector(UCM_MON_t'w-1 downto 0);--UCM_MON_t;
  -- SLc in
  signal i_slc_data_mainA_av      : slc_rx_avt(2 downto 0);
  signal i_slc_data_mainB_av      : slc_rx_avt(2 downto 0);
  signal i_slc_data_neighborA_v   : slc_rx_vt;
  signal i_slc_data_neighborB_v   : slc_rx_vt;
  -- to hps
  signal o_uCM2hps_inn_av         : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_mid_av         : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_out_av         : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_ext_av         : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  -- pipeline
  signal o_uCM2pl_av              : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);

  ---------------------------------------------------------------------------
  -- 
  ---------------------------------------------------------------------------
  signal slc_file_ok              : std_logic;
  signal slc_file_ts              : string(1 to LINE_LENGTH_MAX);
  signal slc_event_ai             : event_xaut(c_MAX_NUM_SL -1 downto 0);

begin

  UCM_DUT : entity ucm_lib.ucm
  port map(
    clk                     => clk,
    rst                     => rst,
    glob_en                 => glob_en,
    ttc_commands            => ttc_commands, 
    -- configuration, control & Monitoring
    ctrl_v                    => ctrl_v,
    mon_v                     => mon_v,
    -- SLc in
    i_slc_data_mainA_av     => i_slc_data_mainA_av,
    i_slc_data_mainB_av     => i_slc_data_mainB_av,
    i_slc_data_neighborA_v  => i_slc_data_neighborA_v,
    i_slc_data_neighborB_v  => i_slc_data_neighborB_v,
    -- pam out
    -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_inn_av        => o_uCM2hps_inn_av,
    o_uCM2hps_mid_av        => o_uCM2hps_mid_av,
    o_uCM2hps_out_av        => o_uCM2hps_out_av,
    o_uCM2hps_ext_av        => o_uCM2hps_ext_av,
    -- MDT hit
    o_uCM2pl_av             => o_uCM2pl_av
  );

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
	-- CSV
  -------------------------------------------------------------------------------------
  CSV_SLC_IN : entity shared_lib.csv_reader_slc 
  generic map (
    IN_SLC_FILE => IN_SLC_FILE,
    g_verbose => 2
  )
  port map(
    clk               => clk,
    rst               => rst,
    enable            => enable_slc,
    --
    tb_curr_tdc_time  => tb_curr_tdc_time,
    --
    o_file_ok         => slc_file_ok,
    o_file_ts         => slc_file_ts, 
    --
    o_slc_event_ai        => slc_event_ai,
    --
    o_main_primary_slc    => i_slc_data_mainA_av,
    o_main_secondary_slc  => i_slc_data_mainB_av,
    o_plus_neighbor_slc   => i_slc_data_neighborA_v,
    o_minus_neighbor_slc  => i_slc_data_neighborB_v

  );

  CSV_UCM_OUT : entity shared_lib.csv_writer_ucm
  generic map (
    g_PRJ_INFO    => PRJ_INFO
    -- g_IN_HIT_FILE => IN_HIT_FILE,
    -- g_IN_SLC_FILE => IN_SLC_FILE
  )
  port map(
    clk                       => clk,
    rst                       => rst,
    enable                    => enable_slc,
    --
    tb_curr_tdc_time          => tb_curr_tdc_time,
    --
    in_slc_file_ok            => slc_file_ok,
    in_slc_file_ts            => slc_file_ts,
    --
    slc_event_ai              => slc_event_ai,
    --
    inn_slc_to_h2s_av         => o_uCM2hps_inn_av,
    mid_slc_to_h2s_av         => o_uCM2hps_mid_av,
    out_slc_to_h2s_av         => o_uCM2hps_out_av,
    ext_slc_to_h2s_av         => o_uCM2hps_ext_av,
    ucm2pl_av                 => o_uCM2pl_av
  );

  -- MON_SIM: if mon_sim = '0' generate
  ttc_commands <= zero(ttc_commands);
  ctrl_r <= zero(ctrl_r);
  ctrl_v <= convert(ctrl_r,ctrl_v);
  mon_r <= convert(mon_v,mon_r);
  -- end generate MON_SIM;

end beh;

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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;
use ctrl_lib.HPS_CTRL_DEF.all;

entity hps_tb is
  generic(
    g_HPS_MAX_HP : integer := 6;
    g_ST_ACT : integer := 0;
    g_ST_ENABLE : std_logic_vector(3 downto 0) := (others => '0');

    --
    PRJ_INFO            : string  := "not defined";
    IN_TAR_FILE         : string  := "ov_tar2hps_TAR_BA3.csv";
    IN_SLC_FILE         : string  := "ov_ucm2hps_BA3.csv";
    IN_CTRL_FILE        : string  := "ctrl_A3_Barrel.csv"
  );
end entity hps_tb;

architecture beh of hps_tb is

  -- clk
  constant clk_period : time := 3.125 ns;  -- 320Mhz
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles  : integer := 3;
  signal rst                  : std_logic;
  signal ena                  : std_logic := '1';
  --
  signal ctrl_inn_r             : HPS_CTRL_t := DEFAULT_HPS_CTRL_t;
  signal mon_inn_r              : HPS_MON_t;
  signal ctrl_inn_v             : std_logic_vector(HPS_CTRL_t'w -1 downto 0);
  signal mon_inn_v              : std_logic_vector(HPS_MON_t'w -1 downto 0);

  -- signal i_uCM2hps_av       : ucm2hps_avt(c_NUM_THREADS -1 downto 0) := (others => (others => '0'));
  -- signal i_mdt_tar_av       : tar2hps_avt(g_HPS_NUM_MDT_CH -1 downto 0) := (others => (others => '0'));
  -- signal o_sf2pt_av         : sf2ptcalc_avt(c_NUM_THREADS -1 downto 0);

  -----------------------------UCM2TAR------------------------------
  signal tb_curr_tdc_time   : unsigned(63 downto 0);
  signal ucm2hps_file_ok    : std_logic;
  signal ucm2hps_file_ts    : string;
  signal slc_event_ai       : event_aut;
  signal ucm2hps_inn_av     : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal ucm2hps_mid_av     : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal ucm2hps_out_av     : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal ucm2hps_ext_av     : ucm2hps_avt(c_NUM_THREADS -1 downto 0)

begin

  -- IN_GEN : for hp_i in g_HPS_NUM_MDT_CH downto 0 generate
  --   mdt_polmux_data_av(hp_i).polmux <= i_mdt_polmux_av(hp_i);
  --   mdt_polmux_data_av(hp_i).tar <= i_mdt_tar_av(hp_i);
  -- end generate;

  ctrl_v <= convert(ctrl_r,ctrl_v);
  mon_r <= convert(mon_v,mon_r);
  --------------------------------------------------------------
  --
  --------------------------------------------------------------
  INN: if g_ST_ENABLE(0)='1' generate
    ctrl_inn_v <= convert(ctrl_inn_r,ctrl_inn_v);
    mon_inn_r <= convert(mon_inn_v,mon_inn_r);
    --------------------------------------------------------------
    HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 0,
        g_HPS_NUM_MDT_CH     => c_HP_NUM_SECTOR_STATION(0)
      )
      port map(
        clk                 => clk,
        rst                 => rst,
        glob_en             => ena,
        -- configuration & control
        ctrl_v              => ctrl_inn_v,
        mon_v               => mon_inn_v,
        -- SLc
        i_uCM2hps_av        => uCM2hps_inn_av,
        -- MDT hit
        i_mdt_tar_av        => mdt_tar_inn_av,
        -- to pt calc
        o_sf2pt_av          => sf2pt_inn_av
    );
  end generate;
  -- HPS_MID_GEN: if ST_ENABLE(1)='1' generate
  -- end generate;
  -- HPS_OUT_GEN: if ST_ENABLE(2)='1' generate
  -- end generate;
  -- HPS_EXT_GEN: if ST_ENABLE(3)='1' generate
  -- end generate;
  -------------------------------------------------------------------------------------
	-- TAR IN
  -------------------------------------------------------------------------------------
  -- UCM2HPS : entity shared_lib.csv_reader_mdt 
  -- generic map (
  --   IN_HIT_FILE => IN_HIT_FILE,
  --   g_verbose => 2
  -- )
  -- port map(
  --   clk               => clk,
  --   rst               => rst,
  --   enable            => enable_mdt,
  --   --
  --   tb_curr_tdc_time  => tb_curr_tdc_time,
  --   --
  --   o_file_ok         => ucm2hps_file_ok,
  --   o_file_ts         => ucm2hps_file_ts, 
  --   --
  --   o_slc_event_ai    => slc_event_ai,
  --   -- TAR Hits for simulation
  --   o_ucm2hps_inn_av  => ucm2hps_inn_av,
  --   o_ucm2hps_mid_av  => ucm2hps_mid_av,
  --   o_ucm2hps_out_av  => ucm2hps_out_av,
  --   o_ucm2hps_ext_av  => ucm2hps_ext_av
  -- );

  -------------------------------------------------------------------------------------
	-- UCM IN
  -------------------------------------------------------------------------------------
  -- TAR2HPS : entity shared_lib.csv_reader_ucm2hps 
  -- generic map (
  --   IN_HIT_FILE => IN_HIT_FILE,
  --   g_verbose => 2
  -- )
  -- port map(
  --   clk               => clk,
  --   rst               => rst,
  --   enable            => enable_mdt,
  --   --
  --   tb_curr_tdc_time  => tb_curr_tdc_time,
  --   --
  --   o_file_ok         => mdt_file_ok,
  --   o_file_ts         => mdt_file_ts, 
  --   --
  --   o_slc_event_ai    => slc_event_ai,
  --   --
  --   o_ucm2hps_inn_av  => ucm2hps_inn_av,
  --   o_ucm2hps_mid_av  => ucm2hps_mid_av,
  --   o_ucm2hps_out_av  => ucm2hps_out_av,
  --   o_ucm2hps_ext_av  => ucm2hps_ext_av
  -- );
  -------------------------------------------------------------------------------------
	-- HPS OUT
  -------------------------------------------------------------------------------------
  -- TAR2HPS : entity shared_lib.csv_writer_tar
  -- generic map (
  --   g_PRJ_INFO    => PRJ_INFO,
  --   g_IN_HIT_FILE => IN_HIT_FILE,
  --   g_IN_SLC_FILE => IN_SLC_FILE
  --   -- OUT_PTIN_SF_FILE => OUT_PTIN_SF_FILE,
  --   -- OUT_PTIN_MPL_FILE => OUT_PTIN_MPL_FILE
  -- )
  -- port map(
  --   clk                 => clk,
  --   rst                 => rst,
  --   enable              => enable_mdt,
  --   --
  --   tb_curr_tdc_time    => tb_curr_tdc_time,
  --   --
  --   in_mdt_file_ok      => mdt_file_ok,
  --   in_mdt_file_ts      => mdt_file_ts,
  --   -- --
  --   i_mdt_event_ai      => mdt_event_ai,
  --   i_slc_event_ai      => slc_event_ai,
  --   -- to daq
  --   i_tdc_hits_inn_av   => o_tdc_hits_inn_av,
  --   i_tdc_hits_mid_av   => o_tdc_hits_mid_av,
  --   i_tdc_hits_out_av   => o_tdc_hits_out_av,
  --   i_tdc_hits_ext_av   => o_tdc_hits_ext_av,
  --   -- outputs to h2s
  --   i_tar_hits_inn_av   => o_tar_hits_inn_av,
  --   i_tar_hits_mid_av   => o_tar_hits_mid_av,
  --   i_tar_hits_out_av   => o_tar_hits_out_av,
  --   i_tar_hits_ext_av   => o_tar_hits_ext_av

  -- );

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

  

end beh;

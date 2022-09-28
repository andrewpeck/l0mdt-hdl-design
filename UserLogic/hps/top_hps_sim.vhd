--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: hps
-- File: top_hps_sim.vhd
-- Module: <<moduleName>>
-- File PATH: /top_hps_sim.vhd
-- -----
-- File Created: Wednesday, 14th September 2022 9:09:37 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 27th September 2022 10:13:19 pm
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
-- use shared_lib.l0mdt_sim_cstm_pkg.all;
-- use shared_lib.vhdl_textio_csv_pkg.all;

-- library hp_lib;
-- use hp_lib.hp_pkg.all;
-- library heg_lib;
-- use heg_lib.heg_pkg.all;
-- library hps_lib;
-- use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;
use ctrl_lib.HPS_CTRL_DEF.all;

package hps_sim_pkg is
  type ctrl_avt is array (c_MAX_NUM_ST -1 downto 0) of std_logic_vector(HPS_CTRL_t'w -1 downto 0);
  type mon_avt is array (c_MAX_NUM_ST -1 downto 0) of std_logic_vector(HPS_MON_t'w -1 downto 0);
  type ucm2hps_aavt is array (c_MAX_NUM_ST -1 downto 0) of ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  type tar2hps_aavt is array (c_MAX_NUM_ST -1 downto 0) of tar2hps_avt(c_TOTAL_MAX_NUM_HP -1 downto 0);
  type hps2pt_aavt is array (c_MAX_NUM_ST -1 downto 0) of sf2ptcalc_avt(c_NUM_THREADS -1 downto 0);
end package ;

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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;
use ctrl_lib.HPS_CTRL_DEF.all;

library work;
use work.hps_sim_pkg.all;

entity hps_tb is
  generic(
    g_HPS_MAX_HP : integer := 6;
    g_ST_ENABLE : std_logic_vector(3 downto 0) := (others => '0');
    --
    PRJ_INFO            : string  := "not_defined";
    IN_TAR_FILE         : string  := "not_defined.csv";
    IN_UCM_FILE         : string  := "not_defined.csv";
    IN_CTRL_FILE        : string  := "not_defined.csv"
  );
end entity hps_tb;

architecture beh of hps_tb is

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
  -- clk
  constant clk_period : time := 3.125 ns;  -- 320Mhz
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal rst: std_logic;

  signal glob_en : std_logic := '1';

  signal bx : std_logic := '0'; 
  

  signal ucm2hps_file_ok    : std_logic;
  signal ucm2hps_file_ts    : string(1 to LINE_LENGTH_MAX);
  signal tar2hps_file_ok    : std_logic;
  signal tar2hps_file_ts    : string(1 to LINE_LENGTH_MAX);
  --
  signal ucm2hps_slc_event_ai : event_xaut(c_NUM_THREADS -1 downto 0);
  signal tar2hps_mdt_event_ai : event_tdc_aut;

  signal ctrl_v             : ctrl_avt;
  signal mon_v              : mon_avt;
  signal ucm2hps_aav        : ucm2hps_aavt;
  signal tar2hps_aav        : tar2hps_aavt;
  signal hps2pt_aav         : hps2pt_aavt; 

begin
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
	-- 
  -------------------------------------------------------------------------------------
  STATION_GEN: for st_i in 0 to 3 generate
    HPS: if g_ST_ENABLE(st_i)='1' generate
      signal ctrl_r             : HPS_CTRL_t := DEFAULT_HPS_CTRL_t;
      signal mon_r              : HPS_MON_t;
    begin
      ctrl_v(st_i) <= convert(ctrl_r,ctrl_v(st_i));
      mon_r <= convert(mon_v(st_i),mon_r);
      --------------------------------------------------------------
      HPS : entity hps_lib.hps
        generic map(
          g_STATION_RADIUS    => st_i,
          g_HPS_NUM_MDT_CH     => c_HP_NUM_SECTOR_STATION(st_i)
        )
        port map(
          clk                 => clk,
          rst                 => rst,
          glob_en             => glob_en,
          -- configuration & control
          ctrl_v              => ctrl_v(st_i),
          mon_v               => mon_v(st_i),
          -- SLc
          i_uCM2hps_av        => ucm2hps_aav(st_i),
          -- MDT hit
          i_mdt_tar_av        => tar2hps_aav(st_i),
          -- to pt calc
          o_sf2pt_av          => hps2pt_aav(st_i)
      );
    end generate;
  end generate STATION_GEN;
  -------------------------------------------------------------------------------------
	-- TAR IN
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
    o_file_ok         => ucm2hps_file_ok,
    o_file_ts         => ucm2hps_file_ts, 
    --
    o_slc_event_ai    => ucm2hps_slc_event_ai,
    -- TAR Hits for simulation
    o_ucm2hps_inn_av  => ucm2hps_aav(0),
    o_ucm2hps_mid_av  => ucm2hps_aav(1),
    o_ucm2hps_out_av  => ucm2hps_aav(2),
    o_ucm2hps_ext_av  => ucm2hps_aav(3)
  );

  -------------------------------------------------------------------------------------
	-- UCM IN
  -------------------------------------------------------------------------------------
  TAR2HPS : entity shared_lib.csv_reader_tar2hps 
  generic map (
   g_PRJ_INFO           => PRJ_INFO,
   g_ST_ENABLE          => g_ST_ENABLE,
  --  g_HPS_MAX_HP         => 
   g_IN_TAR2HPS_FILE    => IN_TAR_FILE
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    ena                 => glob_en,
    --
    tb_curr_tdc_time    => tb_curr_tdc_time,
    --
    o_file_ok           => tar2hps_file_ok,
    o_file_ts           => tar2hps_file_ts, 
    --
    o_mdt_event_ai      => tar2hps_mdt_event_ai,
    -- o_slc_event_ai    => tar2hps_slc_event_ai,
    --
    o_tar_hits_inn_av   => tar2hps_aav(0),
    o_tar_hits_mid_av   => tar2hps_aav(1),
    o_tar_hits_out_av   => tar2hps_aav(2),
    o_tar_hits_ext_av   => tar2hps_aav(3)
  );
  -------------------------------------------------------------------------------------
	-- HPS OUT
  -------------------------------------------------------------------------------------
  HPSOUT : entity shared_lib.csv_writer_hps_int
  generic map (
    g_PRJ_INFO        => PRJ_INFO,
    g_ST_ENABLE       => g_ST_ENABLE
  )
  port map(
    clk                     => clk,
    rst                     => rst,
    enable                  => glob_en,
    --
    tb_curr_tdc_time        => tb_curr_tdc_time,
    --
    i_ucm2hps_file_ok       => ucm2hps_file_ok,
    i_ucm2hps_file_ts       => ucm2hps_file_ts,
    i_tar2hps_file_ok       => tar2hps_file_ok,
    i_tar2hps_file_ts       => tar2hps_file_ts,
    -- --
    i_ucm2hps_slc_event_ai  => ucm2hps_slc_event_ai,
    i_tar2hps_mdt_event_ai  => tar2hps_mdt_event_ai
  );

  
  

end beh;

 -- HPS_INN_GEN: if g_ST_ENABLE(0)='1' generate
  --   ctrl_inn_v <= convert(ctrl_inn_r,ctrl_inn_v);
  --   mon_inn_r <= convert(mon_inn_v,mon_inn_r);
  --   --------------------------------------------------------------
  --   HPS : entity hps_lib.hps
  --     generic map(
  --       g_STATION_RADIUS    => 0,
  --       g_HPS_NUM_MDT_CH     => c_HP_NUM_SECTOR_STATION(0)
  --     )
  --     port map(
  --       clk                 => clk,
  --       rst                 => rst,
  --       glob_en             => glob_en,
  --       -- configuration & control
  --       ctrl_v              => ctrl_inn_v,
  --       mon_v               => mon_inn_v,
  --       -- SLc
  --       i_uCM2hps_av        => uCM2hps_inn_av,
  --       -- MDT hit
  --       i_mdt_tar_av        => tar2hps_inn_av,
  --       -- to pt calc
  --       o_sf2pt_av          => hps2pt_inn_av
  --   );
  -- end generate;
  -- HPS_MID_GEN: if g_ST_ENABLE(1)='1' generate
  --   ctrl_mid_v <= convert(ctrl_mid_r,ctrl_mid_v);
  --   mon_mid_r <= convert(mon_mid_v,mon_mid_r);
  --   --------------------------------------------------------------
  --   HPS : entity hps_lib.hps
  --     generic map(
  --       g_STATION_RADIUS    => 1,
  --       g_HPS_NUM_MDT_CH     => c_HP_NUM_SECTOR_STATION(1)
  --     )
  --     port map(
  --       clk                 => clk,
  --       rst                 => rst,
  --       glob_en             => glob_en,
  --       -- configuration & control
  --       ctrl_v              => ctrl_mid_v,
  --       mon_v               => mon_mid_v,
  --       -- SLc
  --       i_uCM2hps_av        => uCM2hps_mid_av,
  --       -- MDT hit
  --       i_mdt_tar_av        => tar2hps_mid_av,
  --       -- to pt calc
  --       o_sf2pt_av          => hps2pt_mid_av
  --   );
  -- end generate;
  -- HPS_OUT_GEN: if g_ST_ENABLE(2)='1' generate
  --   ctrl_out_v <= convert(ctrl_out_r,ctrl_out_v);
  --   mon_out_r <= convert(mon_out_v,mon_out_r);
  --   --------------------------------------------------------------
  --   HPS : entity hps_lib.hps
  --     generic map(
  --       g_STATION_RADIUS    => 2,
  --       g_HPS_NUM_MDT_CH     => c_HP_NUM_SECTOR_STATION(2)
  --     )
  --     port map(
  --       clk                 => clk,
  --       rst                 => rst,
  --       glob_en             => glob_en,
  --       -- configuration & control
  --       ctrl_v              => ctrl_out_v,
  --       mon_v               => mon_out_v,
  --       -- SLc
  --       i_uCM2hps_av        => uCM2hps_out_av,
  --       -- MDT hit
  --       i_mdt_tar_av        => tar2hps_out_av,
  --       -- to pt calc
  --       o_sf2pt_av          => hps2pt_out_av
  --   );
  -- end generate;
  -- HPS_EXT_GEN: if g_ST_ENABLE(3)='1' generate
  --   ctrl_ext_v <= convert(ctrl_ext_r,ctrl_ext_v);
  --   mon_ext_r <= convert(mon_ext_v,mon_ext_r);
  --   --------------------------------------------------------------
  --   HPS : entity hps_lib.hps
  --     generic map(
  --       g_STATION_RADIUS    => 3,
  --       g_HPS_NUM_MDT_CH     => c_HP_NUM_SECTOR_STATION(3)
  --     )
  --     port map(
  --       clk                 => clk,
  --       rst                 => rst,
  --       glob_en             => glob_en,
  --       -- configuration & control
  --       ctrl_v              => ctrl_ext_v,
  --       mon_v               => mon_ext_v,
  --       -- SLc
  --       i_uCM2hps_av        => uCM2hps_ext_av,
  --       -- MDT hit
  --       i_mdt_tar_av        => tar2hps_ext_av,
  --       -- to pt calc
  --       o_sf2pt_av          => hps2pt_ext_av
  --   );
  -- end generate;
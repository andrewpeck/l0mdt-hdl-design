--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: top_tar_imp.vhd
-- File PATH: /UserLogic/tar/top_tar_imp.vhd
-- Project PATH: /home/guille/ATLAS/l0mdt-fpga-design
-- -----
-- File Created: Tuesday, 23rd November 2021 2:24:35 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 15th December 2021 5:47:24 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2021-12-15	GLdL	Moving from all stations to only 1 station
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

library tar_lib;
use tar_lib.tar_pkg.all;

library ctrl_lib;
use ctrl_lib.tar_CTRL.all;
use ctrl_lib.TAR_CTRL_DEF.all;

entity top_tar is
  generic(
    g_ST_ENABLE : std_logic_vector(3 downto 0) := x"2"
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    glob_freeze            : in std_logic;
    --
    ctrl_inn_b            : in  std_logic; --  : in  TAR_CTRL_t;
    ctrl_mid_b            : in  std_logic; --  : in  TAR_CTRL_t;
    ctrl_out_b            : in  std_logic; --  : in  TAR_CTRL_t;
    ctrl_ext_b            : in  std_logic; --  : in  TAR_CTRL_t;
    mon_inn_b             : out std_logic;--  : out TAR_MON_t;
    mon_mid_b             : out std_logic;--  : out TAR_MON_t;
    mon_out_b             : out std_logic;--  : out TAR_MON_t;
    mon_ext_b             : out std_logic;--  : out TAR_MON_t;
    -- TDC Hits from Polmux
    i_tdc_hits_inn_ab    : in  std_logic_vector (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_tdc_hits_mid_ab    : in  std_logic_vector (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_tdc_hits_out_ab    : in  std_logic_vector (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_tdc_hits_ext_ab    : in  std_logic_vector (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC polmux from Tar
    o_tdc_hits_inn_ab    : out std_logic_vector(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_tdc_hits_mid_ab    : out std_logic_vector(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_tdc_hits_out_ab    : out std_logic_vector(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_tdc_hits_ext_ab    : out std_logic_vector(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_tar_hits_inn_ab    : out std_logic_vector(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_tar_hits_mid_ab    : out std_logic_vector(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_tar_hits_out_ab    : out std_logic_vector(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_tar_hits_ext_ab    : out std_logic_vector(c_HPS_NUM_MDT_CH_EXT -1 downto 0)

  );
end entity top_tar;

architecture beh of top_tar is

  -- signal ctrl_r             : tar_CTRL_t;
  -- signal mon_r              : tar_MON_t;
  -- constant  c_CTRL_LEN      : integer := tar_CTRL_t'w;
  -- constant c_MON_LEN        : integer := tar_MON_t'w;
  -- signal ctrl_v             : std_logic_vector(c_CTRL_LEN -1 downto 0);
  -- signal mon_v              : std_logic_vector(c_MON_LEN -1 downto 0);
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
  signal i_tdc_hits_inn_av :  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => (others => '0'));
  signal i_tdc_hits_mid_av :  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => (others => '0'));
  signal i_tdc_hits_out_av :  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => (others => '0'));
  signal i_tdc_hits_ext_av :  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => (others => '0'));
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

begin

  TAR_INN_GEN: if g_ST_ENABLE(0)='1' generate
    ctrl : entity shared_lib.vhdl_utils_deserializer 
      generic map (g_DATA_WIDTH => TAR_CTRL_t'w) 
      port map(clk => clk,rst  => rst,i_data =>  ctrl_inn_b,o_data => tar_inn_ctrl_v);
    mon_inn_b <= xor_reduce(tar_inn_mon_v);
    --------------------------------------------------------------
    tdc_inn: for i_h in c_HP_NUM_SECTOR_STATION(0) - 1 downto 0 generate
      des : entity shared_lib.vhdl_utils_deserializer 
        generic map (
          g_DATA_WIDTH => i_tdc_hits_inn_av(i_h)'length
        )
        port map(
          clk => clk,
          rst  => rst,
          i_data => i_tdc_hits_inn_ab(i_h),
          o_data => i_tdc_hits_inn_av(i_h)
        );
      o_tdc_hits_inn_ab(i_h) <= xor_reduce(o_tdc_hits_inn_av(i_h));
      o_tar_hits_inn_ab(i_h) <= xor_reduce(o_tar_hits_inn_av(i_h));
    end generate;
    --------------------------------------------------------------
    TAR_INN : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HP_NUM_SECTOR_STATION(0),
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
      i_tdc_hits_av  => i_tdc_hits_inn_av,
      -- to daq
      -- o_tdc_hits_av  => o_tdc_hits_inn_av,
      -- outputs to h2s
      o_tar_hits_av  => o_tar_hits_inn_av
  
    );
  end generate;
  TAR_MID_GEN: if g_ST_ENABLE(1)='1' generate
    ctrl : entity shared_lib.vhdl_utils_deserializer 
      generic map (g_DATA_WIDTH => TAR_CTRL_t'w) 
      port map(clk => clk,rst  => rst,i_data =>  ctrl_mid_b,o_data => tar_mid_ctrl_v);
    mon_mid_b <= xor_reduce(tar_mid_mon_v);
    --------------------------------------------------------------
    tdc_mid: for i_h in c_HP_NUM_SECTOR_STATION(1) - 1 downto 0 generate
      des : entity shared_lib.vhdl_utils_deserializer 
        generic map (
          g_DATA_WIDTH => i_tdc_hits_mid_av(i_h)'length
        )
        port map(
          clk => clk,
          rst  => rst,
          i_data => i_tdc_hits_mid_ab(i_h),
          o_data => i_tdc_hits_mid_av(i_h)
        );
      o_tdc_hits_mid_ab(i_h) <= xor_reduce(o_tdc_hits_mid_av(i_h));
      o_tar_hits_mid_ab(i_h) <= xor_reduce(o_tar_hits_mid_av(i_h));
    end generate;
    --------------------------------------------------------------
    TAR_MID : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HP_NUM_SECTOR_STATION(1),
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
      i_tdc_hits_av  => i_tdc_hits_mid_av,
      -- to daq
      -- o_tdc_hits_av  => o_tdc_hits_mid_av,
      -- outputs to h2s
      o_tar_hits_av  => o_tar_hits_mid_av

    );
  end generate;
  TAR_OUT_GEN: if g_ST_ENABLE(2)='1' generate
    ctrl : entity shared_lib.vhdl_utils_deserializer
      generic map (g_DATA_WIDTH => TAR_CTRL_t'w) 
      port map(clk => clk,rst  => rst,i_data =>  ctrl_out_b,o_data => tar_out_ctrl_v);
    mon_out_b <= xor_reduce(tar_out_mon_v);
    --------------------------------------------------------------
    tdc_out: for i_h in c_HP_NUM_SECTOR_STATION(2) - 1 downto 0 generate
      des : entity shared_lib.vhdl_utils_deserializer 
        generic map (
          g_DATA_WIDTH => i_tdc_hits_out_av(i_h)'length
        )
        port map(
          clk => clk,
          rst  => rst,
          i_data => i_tdc_hits_out_ab(i_h),
          o_data => i_tdc_hits_out_av(i_h)
        );
      o_tdc_hits_out_ab(i_h) <= xor_reduce(o_tdc_hits_out_av(i_h));
      o_tar_hits_out_ab(i_h) <= xor_reduce(o_tar_hits_out_av(i_h));
    end generate;
    --------------------------------------------------------------
    TAR_OUT : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HP_NUM_SECTOR_STATION(2),
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
      i_tdc_hits_av  => i_tdc_hits_out_av,
      -- to daq
      -- o_tdc_hits_av  => o_tdc_hits_out_av,
      -- outputs to h2s
      o_tar_hits_av  => o_tar_hits_out_av
  
    );
  end generate;
  TAR_EXT_GEN: if g_ST_ENABLE(3)='1' generate
    ctrl : entity shared_lib.vhdl_utils_deserializer 
      generic map (g_DATA_WIDTH => TAR_CTRL_t'w) 
      port map(clk => clk,rst  => rst,i_data =>  ctrl_ext_b,o_data => tar_ext_ctrl_v);
    mon_ext_b <= xor_reduce(tar_ext_mon_v);
    --------------------------------------------------------------
    tdc_ext: for i_h in c_HP_NUM_SECTOR_STATION(3) - 1 downto 0 generate
      des : entity shared_lib.vhdl_utils_deserializer 
        generic map (
          g_DATA_WIDTH => i_tdc_hits_ext_av(i_h)'length
        )
        port map(
          clk => clk,
          rst  => rst,
          i_data => i_tdc_hits_ext_ab(i_h),
          o_data => i_tdc_hits_ext_av(i_h)
        );
      o_tdc_hits_ext_ab(i_h) <= xor_reduce(o_tdc_hits_ext_av(i_h));
      o_tar_hits_ext_ab(i_h) <= xor_reduce(o_tar_hits_ext_av(i_h));
    end generate;
    --------------------------------------------------------------
    TAR_EXT : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HP_NUM_SECTOR_STATION(3),
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
      i_tdc_hits_av  => i_tdc_hits_ext_av,
      -- to daq
      -- o_tdc_hits_av  => o_tdc_hits_ext_av,
      -- outputs to h2s
      o_tar_hits_av  => o_tar_hits_ext_av
  
    );
  end generate;











  -- ctrl : entity shared_lib.vhdl_utils_deserializer generic map (c_CTRL_LEN) port map(clk,rst,ctrl_b,ctrl_v);
  -- mon_b <= xor_reduce(mon_v);
  -- --------------------------------------------------------------
  -- tdc_inn: for i_h in g_HPS_MAX_HP - 1 downto 0 generate
  --   des : entity shared_lib.vhdl_utils_deserializer 
  --     generic map (
  --       g_DATA_WIDTH => i_tdc_hits_av(i_h)'length
  --     )
  --     port map(
  --       clk => clk,
  --       rst  => rst,
  --       i_data => i_tdc_hits_ab(i_h),
  --       o_data => i_tdc_hits_av(i_h)
  --     );
  --   o_tdc_hits_ab(i_h) <= xor_reduce(o_tdc_hits_av(i_h));
  --   o_tar_hits_ab(i_h) <= xor_reduce(o_tar_hits_av(i_h));
  -- end generate;
  -- --------------------------------------------------------------






  -- TAR : entity tar_lib.tar
  -- generic map(
  --   g_HPS_MAX_HP => g_HPS_MAX_HP,
  --   g_STATION => g_STATION
  -- )
  -- port map (
  --   -- clock, control, and monitoring
  --   clk             => clk,
  --   rst             => rst,
  --   glob_en         => glob_en,
  --   --
  --   ctrl_v            => ctrl_v,
  --   mon_v             => mon_v,
  --   -- TDC Hits from Polmux
  --   i_tdc_hits_av  => i_tdc_hits_av,
  --   -- to daq
  --   o_tdc_hits_av  => o_tdc_hits_av,

  --   -- outputs to h2s
  --   o_tar_hits_av  => o_tar_hits_av
  -- );






end beh;

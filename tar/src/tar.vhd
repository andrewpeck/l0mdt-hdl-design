--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Tube Adress Remap
--  Description: aplies the fiber mapping to identify the origin of the hits
--
--------------------------------------------------------------------------------
--  Revisions: 
--    v0  - 2020.08.23 creation
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

library tar_lib;
use tar_lib.tar_pkg.all;

entity tar is
  generic (
    EN_TAR_HITS : integer := 1;
    EN_MDT_HITS : integer := 0
    );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- TDC Hits from Polmux
    i_inn_tdc_hits    : in  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_mid_tdc_hits    : in  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_out_tdc_hits    : in  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_ext_tdc_hits    : in  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    -- i_inn_tar_hits    : in  tar2hps_bus_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- i_mid_tar_hits   : in  tar2hps_bus_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- i_out_tar_hits    : in  tar2hps_bus_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- i_ext_tar_hits    : in  tar2hps_bus_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC polmux from Tar
    o_inn_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_mid_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_out_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_ext_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_inn_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_mid_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_out_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_ext_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0)
  );
end entity tar;

architecture beh of tar is
  
begin
  
  
  
end architecture beh;
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
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- TDC Hits from Polmux
    i_inner_tdc_hits    : in  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tdc_hits   : in  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tdc_hits    : in  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tdc_hits    : in  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    i_inner_tar_hits    : in  tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tar_hits   : in  tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tar_hits    : in  tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tar_hits    : in  tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC polmux from Tar
    o_inner_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_middle_tdc_hits   : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_outer_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_extra_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_inner_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_middle_tar_hits   : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_outer_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_extra_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0)
  );
end entity tar;

architecture beh of tar is
  
begin
  
  
  
end architecture beh;
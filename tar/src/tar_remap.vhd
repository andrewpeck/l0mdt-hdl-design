--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Tube Address Remap
--  Description: link information to tube mapper 
--
--------------------------------------------------------------------------------
--  Revisions: 
--    v0  - 2020.11.30 creation
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

use shared_lib.detector_param_pkg.all;

library tar_lib;
use tar_lib.tar_pkg.all;

entity tar_remap is
  generic (
    EN_TAR_HITS : integer := 1;
    EN_MDT_HITS : integer := 0
    );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- TDC Hits from Polmux
    i_inn_tdc_hits    : in  mdt_polmux_bus_avt (c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tdc_hits    : in  mdt_polmux_bus_avt (c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tdc_hits    : in  mdt_polmux_bus_avt (c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tdc_hits    : in  mdt_polmux_bus_avt (c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC Hits from Tar
    i_inn_tar_hits    : in  tar2hps_bus_avt (c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tar_hits    : in  tar2hps_bus_avt (c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tar_hits    : in  tar2hps_bus_avt (c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tar_hits    : in  tar2hps_bus_avt (c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC polmux from Tar
    o_inn_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_inn_tar_hits    : out tar2hps_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tar_hits    : out tar2hps_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tar_hits    : out tar2hps_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tar_hits    : out tar2hps_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0)
  );
end entity tar_remap;

architecture beh of tar_remap is


  
begin
  
  TDC_INPUTS_GEN : if c_TAR_INSEL = '1' generate
    o_inn_tdc_hits <= i_inn_tdc_hits;
    o_mid_tdc_hits <= i_mid_tdc_hits;
    o_out_tdc_hits <= i_out_tdc_hits;
    o_ext_tdc_hits <= i_ext_tdc_hits;
  end generate;

  TAR_INPUTS_GEN : if c_TAR_INSEL = '0' generate
    o_inn_tar_hits <= i_inn_tar_hits;
    o_mid_tar_hits <= i_mid_tar_hits;
    o_out_tar_hits <= i_out_tar_hits;
    o_ext_tar_hits <= i_ext_tar_hits;

    -- ST_EN : if c_HPS_ENABLE_ST_INN = '1' generate
    --   HP_LOOP : for hp_i in c_HPS_MAX_HP_INN -1 downto 0 generate
    --     HP_EN : if c_HPS_ENABLED_HP_INN(hp_i) = '1' generate
    --       -- TAR
    --       o_inn_tar_hits(hp_i) <= i_inn_tar_hits(hp_i);
    --       -- TDC
    --       o_inn_tdc_hits(hp_i).csmid <= resize(i_inn_tar_hits(hp_i).layer,TDCPOLMUX2TAR_CSMID_LEN);
    --     end generate;
    --   end generate;
    -- end generate;



  end generate;

  
end architecture beh;

-- type tdc_rt is record
--   chanid : unsigned(TDC_CHANID_LEN-1 downto 0);
--   edgemode : std_logic_vector(TDC_EDGEMODE_LEN-1 downto 0);
--   coarsetime : unsigned(TDC_COARSETIME_LEN-1 downto 0);
--   finetime : unsigned(TDC_FINETIME_LEN-1 downto 0);
--   pulsewidth : unsigned(TDC_PULSEWIDTH_LEN-1 downto 0);
-- end record tdc_rt;

-- type tdcpolmux2tar_rt is record
--   data_valid : std_logic;
--   tdc : tdc_rt;
--   csmid : unsigned(TDCPOLMUX2TAR_CSMID_LEN-1 downto 0);
--   tdcid : unsigned(TDCPOLMUX2TAR_TDCID_LEN-1 downto 0);
-- end record tdcpolmux2tar_rt;

-- type tar2hps_rt is record
--   data_valid : std_logic;
--   chamber_ieta : unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
--   layer : unsigned(TAR2HPS_LAYER_LEN-1 downto 0);
--   tube : unsigned(TAR2HPS_TUBE_LEN-1 downto 0);
--   time : unsigned(TAR2HPS_TIME_LEN-1 downto 0);
-- end record tar2hps_rt;
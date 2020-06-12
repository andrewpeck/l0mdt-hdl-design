--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

entity hps_pc_tar is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_fiberID             : in std_logic_vector(MDT_FIBER_LEN-1 downto 0);
    i_muxID               : in std_logic_vector(MDT_MUXCH_LEN-1 downto 0);
    i_tdc_ch              : in std_logic_vector(MDT_TDC_CH_LEN-1 downto 0);
    i_data_valid          : in std_logic;
    --
    o_tube                : out unsigned(MDT_TUBE_LEN-1 downto 0);
    o_layer               : out unsigned(MDT_LAYER_LEN-1 downto 0);
    o_mdt_time            : out unsigned(MDT_TIME_LEN-1 downto 0);
    o_data_valid          : out std_logic

    
  );
end entity hps_pc_tar;

architecture beh of hps_pc_tar is
  
begin
  
  
  
end architecture beh;


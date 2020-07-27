--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.some_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
use heg_lib.heg_custom_pkg.all;
-- use heg_lib.heg_trLUT_s3_pkg.all;

entity b_z2roi is
  generic(
    g_STATION_RADIUS     : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_z                 : in unsigned(UCM_Z_ROI_LEN-1 downto 0);
    i_dv                : in std_logic;
    --
    o_roi_center        : out heg_roi_center_at(get_num_layers(g_STATION_RADIUS) -1 downto 0);
    o_dv                : out std_logic
  );
end entity b_z2roi;

architecture beh of b_z2roi is

  signal int_uCM_data : ucm2hps_rt;
  signal uCM_barrel   : ucm_csf_barrel_rt;
  signal z_barrel       : unsigned(UCM_Z_ROI_LEN-1 downto 0);
  -- type trLUT_layer_t is array (0 to 7) of trLUT_limits_t;
  -- signal Roi_window_LUT : trLUT_layer_t;
  -- signal Roi_w_index : integer;
  -- signal Roi_window_a : hp_heg2hp_window_at;

  signal wingen_dv_o : std_logic;
begin



end beh;


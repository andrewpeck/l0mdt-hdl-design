--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: pkg
-- File: heg_sim_cstm_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /heg_sim_cstm_pkg.vhd
-- -----
-- File Created: Friday, 21st October 2022 8:45:47 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Friday, 21st October 2022 10:09:35 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
-- use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
-- library hps_lib;
-- use hps_lib.hps_pkg.all;

package heg_sim_cstm_pkg is
  
  type ucm2heg_aavt is array (c_MAX_NUM_ST -1 downto 0) of ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  type pc2heg_aavt is array (c_MAX_NUM_ST -1 downto 0) of heg_pc2heg_avt(c_TOTAL_MAX_NUM_HP -1 downto 0);

  type heg_ctrl2sf_avt is array(integer range <>) of heg_ctrl2sf_vt;
  type heg2sf_control_aavt is array(c_MAX_NUM_ST -1 downto 0) of heg_ctrl2sf_avt(c_NUM_THREADS -1 downto 0);
  type heg2sf_slc_data_aavt is array(c_MAX_NUM_ST -1 downto 0) of heg2sfslc_avt(c_NUM_THREADS -1 downto 0);
  type heg2sf_mdt_data_aavt is array(c_MAX_NUM_ST -1 downto 0) of heg2sfhit_avt(c_NUM_THREADS -1 downto 0);

  type heg_ctrl2sf_art is array(integer range <>) of heg_ctrl2sf_rt;
  type heg2sf_control_aart is array(c_MAX_NUM_ST -1 downto 0) of heg_ctrl2sf_art(c_NUM_THREADS -1 downto 0);
  type heg2sf_slc_data_aart is array(c_MAX_NUM_ST -1 downto 0) of heg2sfslc_art(c_NUM_THREADS -1 downto 0);
  type heg2sf_mdt_data_aart is array(c_MAX_NUM_ST -1 downto 0) of heg2sfhit_art(c_NUM_THREADS -1 downto 0);

end package heg_sim_cstm_pkg;


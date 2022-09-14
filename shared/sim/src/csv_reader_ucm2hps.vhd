--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: csv_reader_ucm2hps.vhd
-- Module: <<moduleName>>
-- File PATH: /shared/sim/src/csv_reader_ucm2hps.vhd
-- -----
-- File Created: Monday, 15th August 2022 1:15:27 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Saturday, 10th September 2022 6:49:02 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use std.standard.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

use shared_lib.vhdl_tb_utils_pkg.all;

use shared_lib.ucm_sim_pkg.all;
use shared_lib.l0mdt_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;

library vamc_lib;

-- library heg_lib;
-- use heg_lib.heg_pkg.all;
-- library hps_lib;
-- use hps_lib.hps_pkg.all;

entity csv_reader_ucm2hps is
  generic(
    g_PRJ_INFO            : string  := "not defined";
    g_ST_ENABLE           : std_logic_vector(3 downto 0) := (others => '0');
    g_IN_UCM2HPS_FILE     : string  := "not_defined.csv"
  );
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    ena                     : in std_logic;
    --
    tb_curr_tdc_time        : in unsigned(63 downto 0);
    --
    o_file_ok               : out std_logic;
    o_file_ts               : out string;
    --
    o_slc_event_ai          : out event_aut(c_NUM_THREADS -1 downto 0);
    --
    o_ucm2hps_inn_av     : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_ucm2hps_mid_av     : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_ucm2hps_out_av     : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_ucm2hps_ext_av     : out ucm2hps_avt(c_NUM_THREADS -1 downto 0)

  );
end entity csv_reader_ucm2hps;

architecture sim of csv_reader_ucm2hps is

  
begin

  
end architecture sim;
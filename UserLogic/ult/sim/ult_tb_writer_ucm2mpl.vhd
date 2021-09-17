--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Test Bench Module for Logic Trigger Path
--  Description: SLC input vector reader and injector
--
--------------------------------------------------------------------------------
--  Revisions:
--      2020.11.24 Creation 
--
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

library ult_lib;
use ult_lib.ult_tb_sim_pkg.all;
use ult_lib.ult_textio_wr_ucm2mpl_pkg.all;

library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

entity ult_tb_writer_ucm2mpl is
  generic(
    g_PRJ_INFO            : string  := "not_defined";
    g_IN_SLC_FILE         : string  := "not_defined.csv";
    g_IN_HIT_FILE         : string  := "not_defined.csv";
    g_IN_L0_FILE          : string  := "not_defined.csv"
    -- OUT_HEG_BM_SLC_FILE : string  := "hps_heg_bm_slc_A3_Barrel_yt_v04.csv";
    -- OUT_HEG_BM_HIT_FILE : string  := "hps_heg_bm_hit_A3_Barrel_yt_v04.csv"
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    enable                : in integer;
    --
    tb_curr_tdc_time      : in unsigned(63 downto 0) := (others => '0')
  );
end entity ult_tb_writer_ucm2mpl;

architecture sim of ult_tb_writer_ucm2mpl is
  
begin
    
  
end architecture sim;
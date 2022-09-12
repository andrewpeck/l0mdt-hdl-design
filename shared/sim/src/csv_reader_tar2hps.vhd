--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: csv_reader_tar2hps.vhd
-- Module: <<moduleName>>
-- File PATH: /shared/sim/src/csv_reader_tar2hps.vhd
-- -----
-- File Created: Monday, 15th August 2022 1:15:01 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Saturday, 10th September 2022 7:06:32 pm
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
use shared_lib.l0mdt_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;

use shared_lib.tar_sim_pkg.all;

library vamc_lib;

-- library heg_lib;
-- use heg_lib.heg_pkg.all;
-- library hps_lib;
-- use hps_lib.hps_pkg.all;

entity csv_reader_tar2hps is
  generic(
    g_PRJ_INFO            : string  := "not defined";
    g_ST_ENABLE           : std_logic_vector(3 downto 0) := (others => '0');
    g_HPS_MAX_HP          : integer := 6;
    g_IN_TAR2HPS_FILE     : string  := "not_defined.csv"
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    enable                : in integer;
    --
    tb_curr_tdc_time      : in unsigned(63 downto 0);
    --
    o_file_ok           : out std_logic;
    o_file_ts           : out string(1 to LINE_LENGTH_MAX);
    --
    i_mdt_event_ai        : out event_tdc_aut;--event_aut(3 downto 0);
    i_slc_event_ai        : out event_tdc_aut;--event_aut(3 downto 0);
    -- TDC Hits from Tar
    i_tar_hits_inn_av     : out tar2hps_avt(g_HPS_MAX_HP -1 downto 0);
    i_tar_hits_mid_av     : out tar2hps_avt(g_HPS_MAX_HP -1 downto 0);
    i_tar_hits_out_av     : out tar2hps_avt(g_HPS_MAX_HP -1 downto 0);
    i_tar_hits_ext_av     : out tar2hps_avt(g_HPS_MAX_HP -1 downto 0)

  );
end entity csv_reader_tar2hps;

architecture sim of csv_reader_tar2hps is

  signal mdt_event_ai     : event_tdc_aut := (others => (others => (others => '0')));

  shared variable csv_file  : csv_file_type;
  signal  file_open         : std_logic := '0';   
  signal file_ts            : string(1 to LINE_LENGTH_MAX);
  
  
begin

  o_file_ok <= file_open;
  o_file_ts <= file_ts;
  
  open_csv: process
    variable timestamp : string(1 to LINE_LENGTH_MAX);

    variable aux : string(1 to LINE_LENGTH_MAX);
  begin
    -- if first_read = '1' then
    puts("--------------------------------");
    puts("opening MDT CSV file : " & g_IN_TAR2HPS_FILE);
    csv_file.initialize(g_IN_TAR2HPS_FILE,"rd");
    csv_file.readline;
    while csv_file.read_isheader loop 
      aux := csv_file.read_string(' ');
      while not csv_file.end_of_line loop
        aux := csv_file.read_string(':');
        if aux(1 to 2) = "TS" then
          timestamp := csv_file.read_string(NUL);
          file_ts <= timestamp;
          puts("TimeStamp = ",timestamp);
        end if;
        if aux(1 to 4) = "Side" then
          puts("     Side = ",csv_file.read_string(' '));
        end if;
        if aux(1 to 6) = "Sector" then
          puts("   Sector = ",csv_file.read_string(' '));
        end if;
        if aux(1 to 4) = "Area" then
          puts("     Area = ",csv_file.read_string(' '));
        end if;
      end loop;
      csv_file.readline;
    end loop;
      file_open <= '1';
      puts("--------------------------------");

    -- end if;
    wait;
  end process open_csv;
  
end architecture sim;
--------------------------------------------------------------------------------
--  Max-Planck-Institut für Physik
--  Davide Cieri
--  davide.cieri@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Test bench module to write csf output to a csv file
--
--------------------------------------------------------------------------------
--  Revisions:
--      2021.09.24 Creation 
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
-- use shared_lib.detector_param_pkg.all;

use shared_lib.vhdl_textio_csv_pkg.ALL;


entity pt_tb_writer is
  generic (
    OUT_FILE       : string  := "out_pt.csv"
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    enable            : in integer;
    mtc               : in ptcalc2mtc_rt
  );
end entity pt_tb_writer;

architecture sim of pt_tb_writer is

begin
  
  
  PT_WRITE: process ( rst, clk)

    variable csv: csv_file_type;
    variable row                  : line;
    variable row_counter          : integer := 0;
    variable hit : heg2sfhit_rt;
    variable seed : heg2sfslc_rt;
    variable eof : integer := 0;
    variable first_write         : std_logic := '1';

    variable dummy_text  : string(1 to 100);
    variable ok : boolean;



  begin

    -- tb_curr_time <= tb_time;

    if rising_edge(clk) then
      if(rst= '1') then

      else

        if enable = 1 then
        -- write to DUT
          if first_write = '1' then
            first_write := '0';
            csv.initialize(OUT_FILE, "wr");
            -- Write the Header
            csv.write_word("slcid");
            csv.write_word("slid");
            csv.write_word("bcid");
            csv.write_word("mdt_eta");
            csv.write_word("mdt_pt");
            csv.write_word("mdt_ptthresh");
            csv.write_word("mdt_charge");
            csv.write_word("mdt_nsegments");
            csv.write_word("mdt_quality");
            csv.writeline;
          else
            if mtc.data_valid = '1' then
              csv.write_integer(to_integer(mtc.muid.slcid));
              csv.write_integer(to_integer(mtc.muid.slid));  
              csv.write_integer(to_integer(mtc.muid.bcid));
              csv.write_integer(to_integer(mtc.mdt_eta));
              csv.write_integer(to_integer(mtc.mdt_pt));
              csv.write_integer(to_integer(mtc.mdt_ptthresh));
              csv.write_integer(to_integer(unsigned'('0' & mtc.mdt_charge)));
              csv.write_integer(to_integer(mtc.mdt_nsegments));
              csv.write_integer(to_integer(unsigned(mtc.mdt_quality)));  
              csv.writeline;
            end if;
          end if;
          
        end if;

      end if;
    end if;

  end process;

  
end architecture sim;
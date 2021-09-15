--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Test Bench Module for Logic Trigger Path
--  Description: Hit input vector reader and injector
--
--------------------------------------------------------------------------------
--  Revisions:
--      2020.11.23 Creation 
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

library csf_lib;
use csf_lib.csf_textio_pkg.all;


entity csf_tb_reader is
  generic (
    IN_HIT_FILE       : string  := "csf_Barrel.csv"
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    enable            : in integer;
    -- Hits from HE
    o_seed            : out heg2sfslc_rt;
    o_mdt_hit         : out heg2sfhit_rt;
    o_eof             : out std_logic
  );
end entity csf_tb_reader;

architecture sim of csf_tb_reader is

begin
  
  
  CSF_READ: process ( rst, clk)

    file input_csf_file       : text open read_mode is IN_HIT_FILE;
    variable row                  : line;
    variable row_counter          : integer := 0;
    variable hit : heg2sfhit_rt;
    variable seed : heg2sfslc_rt;
    variable eof : std_logic;

  begin

    -- tb_curr_time <= tb_time;

    if rising_edge(clk) then
      if(rst= '1') then

      else

        if enable = 1 then
        -- write to DUT

          -- first read from input vector file
          if not endfile(input_csf_file) then
            readline(input_csf_file,row); -- reads header and ignores
            row_counter := row_counter +1;
            if row_counter > 0 then
              readline(input_csf_file,row);
              read(row, hit, seed, eof);
            end if;
            report "Read line : " & integer'image(row_counter);
          end if;

          o_mdt_hit <= hit;
          o_seed <= seed;
          o_eof <= eof;
        end if;

      end if;
    end if;

  end process;

  
end architecture sim;
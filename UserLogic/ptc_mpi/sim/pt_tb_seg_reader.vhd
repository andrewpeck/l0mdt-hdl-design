--------------------------------------------------------------------------------
--  Max-Planck-Institut für Physik, Munich
--  Davide Cieri
--  davide.cieri@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: CSV Segment reader for ptc_mpi test-bench
--  Description: Reads a csv and injects segments
--
--------------------------------------------------------------------------------
--  Revisions:
--      2021.10.25 First version
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
-- use shared_lib.detector_param_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.ALL;


entity pt_tb_seg_reader is
  generic (
    IN_HIT_FILE       : string  := "pt_in0.csv"
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    enable            : in std_logic;
    o_segment         : out sf2ptcalc_rt
  );
end entity pt_tb_seg_reader;

architecture sim of pt_tb_seg_reader is

begin
  


  PT_READ: process ( rst, clk)

    file input_pt_file            : text open read_mode is IN_HIT_FILE;
    variable csv                  : csv_file_type;
    variable row                  : line;
    variable row_counter          : integer := 0;
    
    variable seg                  : sf2ptcalc_rt;
    variable first_read           : std_logic := '1';

    variable seg_dv       : integer := 0;
    variable slcid        : integer := 0;
    variable slid         : integer := 0;
    variable bcid         : integer := 0;
    variable segpos       : integer := 0;
    variable segangle     : integer := 0;
    variable segquality   : integer := 0;
    variable chamber_id   : integer := 0;
    variable chamber_ieta : integer := 0;

    variable dummy_text   : string(1 to 100);
    variable ok           : boolean;

  begin


    if rising_edge(clk) then
      if(rst= '1') then

      else

        if enable = '1' then
        -- write to DUT
          if first_read = '1' then
            first_read := '0';
            csv.initialize(IN_HIT_FILE, "rd");
            csv.readline; -- First line is the header
          elsif csv.end_of_file = false then
            csv.readline;
            seg_dv       := csv.read_integer;    
            slcid        := csv.read_integer;
            slid         := csv.read_integer;
            bcid         := csv.read_integer;
            segpos       := csv.read_integer;
            segangle     := csv.read_integer;
            segquality   := csv.read_integer;
            chamber_id   := csv.read_integer;
            chamber_ieta := csv.read_integer;
          else
            seg_dv       := 0;    
            slcid        := 0;
            slid         := 0;
            bcid         := 0;
            segpos       := 0;
            segangle     := 0;
            segquality   := 0;
            chamber_id   := 0;
            chamber_ieta := 0;
          end if;

          seg := zero(seg);
          seg.data_valid := to_unsigned(seg_dv,1)(0);
          seg.muid := (
            slcid => to_unsigned(slcid, SLC_COMMON_SLCID_LEN),
            slid => to_unsigned(slid, SL_TRAILER_SLID_LEN),
            bcid => to_unsigned(bcid, SL_HEADER_BCID_LEN)
          );
          seg.segpos := to_unsigned(segpos, SF2PTCALC_SEGPOS_LEN);
          seg.segangle := to_unsigned(segangle, SF2PTCALC_SEGANGLE_LEN);
          seg.segquality := to_unsigned(segquality,1)(0);
          seg.mdtid := (
            chamber_id => to_unsigned(chamber_id, VEC_MDTID_CHAMBER_ID_LEN),
            chamber_ieta => to_unsigned(chamber_ieta, VEC_MDTID_CHAMBER_IETA_LEN)
          );
        else
          seg := zero(seg);
        end if;

        o_segment <= seg;
      end if;
    end if;

  end process;

  
end architecture sim;
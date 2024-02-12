--------------------------------------------------------------------------------
--  Max-Planck-Institut für Physik, Munich
--  Davide Cieri
--  davide.cieri@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Test Bench Module for Compact Segment Finder
--  Description: Hit/SLC input vector reader and injector
--
--------------------------------------------------------------------------------
--  Revisions:
--      2021.10.21 First change  
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


entity csf_tb_reader is
  generic (
    IN_HIT_FILE       : string  := "csf_short_in.csv"
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
    variable csv: csv_file_type;
    variable row                  : line;
    variable row_counter          : integer := 0;
    variable hit : heg2sfhit_rt;
    variable seed : heg2sfslc_rt;
    variable eof : integer := 0;
    variable first_read         : std_logic := '1';

    variable hit_dv : integer := 0;
    variable hit_ml : integer := 0;
    variable hit_x  : integer := 0;
    variable hit_y  : integer := 0;
    variable hit_r  : integer := 0;
    variable slc_dv : integer := 0;
    variable slc_chamber_id : integer := 0;
    variable slc_chamber_ieta : integer :=0 ;
    variable slc_vec_pos : integer := 0;
    variable slc_vec_ang : integer := 0;
    variable slc_hewindow_pos : integer := 0;


    variable dummy_text  : string(1 to 100);
    variable ok : boolean;



  begin

    -- tb_curr_time <= tb_time;

    if rising_edge(clk) then
      if(rst= '1') then

      else

        if enable = 1 then
        -- write to DUT
          if first_read = '1' then
            first_read := '0';
            csv.initialize(IN_HIT_FILE, "rd");
            csv.readline; -- First line is the header
          elsif csv.end_of_file = false then
            csv.readline;
            hit_dv := csv.read_integer;
            hit_ml := csv.read_integer;
            hit_x := csv.read_integer;
            hit_y := csv.read_integer;
            hit_r := csv.read_integer;
            slc_dv := csv.read_integer;
            slc_chamber_id := csv.read_integer;
            slc_chamber_ieta := csv.read_integer;
            slc_vec_pos := csv.read_integer;
            slc_vec_ang := csv.read_integer;
            slc_hewindow_pos := csv.read_integer;
            eof := csv.read_integer;
          end if;

          HIT := (
              data_valid => to_unsigned(hit_dv,1)(0),
              mlayer => to_unsigned(hit_ml,1)(0),
              localx => to_unsigned(hit_x, HEG2SFHIT_LOCALX_LEN),
              localy => to_unsigned(hit_y, HEG2SFHIT_LOCALY_LEN),
              radius => to_unsigned(hit_r, HEG2SFHIT_RADIUS_LEN)
            );

            SEED := zero(SEED);
            SEED.data_valid := to_unsigned(slc_dv,1)(0);
            SEED.mdtid := (
                chamber_id => to_unsigned(slc_chamber_id, VEC_MDTID_CHAMBER_ID_LEN),
                chamber_ieta => to_unsigned(slc_chamber_ieta, VEC_MDTID_CHAMBER_IETA_LEN)
            );
            SEED.vec_pos := to_unsigned(slc_vec_pos, UCM2HPS_VEC_POS_LEN);
            SEED.vec_ang := to_unsigned(slc_vec_ang, UCM2HPS_VEC_ANG_LEN);
            SEED.hewindow_pos := to_unsigned(slc_hewindow_pos, HEG2SFSLC_HEWINDOW_POS_LEN);

          o_mdt_hit <= hit;
          o_seed <= seed;
          o_eof <= to_unsigned(eof, 1)(0);
        end if;

      end if;
    end if;

  end process;

  
end architecture sim;
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


entity pt_tb_slc_reader is
  generic (
    IN_HIT_FILE       : string  := "pt_in_slc.csv"
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    enable            : in std_logic;
    o_slc             : out pl2ptcalc_rt
  );
end entity pt_tb_slc_reader;

architecture sim of pt_tb_slc_reader is

begin
  
  
  PT_READ: process ( rst, clk)

    file input_pt_file            : text open read_mode is IN_HIT_FILE;
    variable csv                  : csv_file_type;
    variable row                  : line;
    variable row_counter          : integer := 0;
    
    variable slc                  : pl2ptcalc_rt;
    variable first_read           : std_logic := '1';

    variable dv               : integer := 0;
    variable slcid            : integer := 0;
    variable slid             : integer := 0;
    variable bcid             : integer := 0;
    variable phimod           : integer := 0;
    variable sl_charge        : integer := 0;
    variable nswseg_poseta    : integer := 0;
    variable nswseg_posphi    : integer := 0;
    variable nswseg_angdtheta : integer := 0;

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
            dv           := csv.read_integer;    
            slcid            := csv.read_integer;
            slid             := csv.read_integer;
            bcid             := csv.read_integer;
            phimod           := csv.read_integer;
            sl_charge        := csv.read_integer;
            nswseg_poseta    := csv.read_integer;
            nswseg_posphi    := csv.read_integer;
            nswseg_angdtheta := csv.read_integer;
          else 
            dv               := 0;    
            slcid            := 0;
            slid             := 0;
            bcid             := 0;
            phimod           := 0;
            sl_charge        := 0;
            nswseg_poseta    := 0;
            nswseg_posphi    := 0;
            nswseg_angdtheta := 0;
          end if;

          slc := zero(slc);
          slc.data_valid := to_unsigned(dv,1)(0);
          slc.muid := (
            slcid => to_unsigned(slcid, SLC_COMMON_SLCID_LEN),
            slid => to_unsigned(slid, SL_TRAILER_SLID_LEN),
            bcid => to_unsigned(bcid, SL_HEADER_BCID_LEN)
          );
          slc.phimod := to_signed(phimod, UCM2PL_PHIMOD_LEN);
          slc.sl_charge := to_unsigned(sl_charge,1)(0);
          slc.nswseg_poseta := to_unsigned(nswseg_poseta, SLC_ENDCAP_NSWSEG_POSETA_LEN);
          slc.nswseg_posphi := to_unsigned(nswseg_poseta, SLC_ENDCAP_NSWSEG_POSPHI_LEN);
          slc.nswseg_angdtheta := to_signed(nswseg_angdtheta, SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN);
    
          
        else
          slc := zero(slc);
        end if;
        o_slc <= slc;
      end if;
    end if;

  end process;

  
end architecture sim;
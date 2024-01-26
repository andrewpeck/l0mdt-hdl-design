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
-- use shared_lib.detector_param_pkg.all;

library project_lib;
use project_lib.ult_tb_sim_pkg.all;
use project_lib.ult_tb_sim_cstm_pkg.all;
use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;

library ult_lib;
library vamc_lib;

entity ult_tb_writer_mpl2pt is
  generic(
    g_PRJ_INFO            : string  := "not_defined";
    g_IN_SLC_FILE         : string  := "not_defined.csv";
    g_IN_HIT_FILE         : string  := "not_defined.csv";
    g_IN_L0_FILE          : string  := "not_defined.csv"
    -- OUT_PTIN_SF_FILE    : string  := "pt_in_sf_A3_Barrel_yt_v04.csv";
    -- OUT_PTIN_MPL_FILE   : string  := "pt_in_mpl_A3_Barrel_yt_v04.csv"
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    enable                : in integer;
    --
    tb_curr_tdc_time      : in unsigned(63 downto 0) := (others => '0')
  );
end entity ult_tb_writer_mpl2pt;

architecture sim of ult_tb_writer_mpl2pt is
  
begin
  
  SF_MPL_PT: process(clk)

  file file_sf_handler : text open write_mode is OUT_PTIN_SF_FILE ;
  file file_mpl_handler : text open write_mode is OUT_PTIN_MPL_FILE;

  variable row 		: line;

  alias inn_segments_to_pt_av is << signal.ult_tb.ULT.inn_segments_to_pt_av : sf2pt_bus_avt >>;
  alias mid_segments_to_pt_av is << signal.ult_tb.ULT.mid_segments_to_pt_av : sf2pt_bus_avt >>;
  alias out_segments_to_pt_av is << signal.ult_tb.ULT.out_segments_to_pt_av : sf2pt_bus_avt >>;
  alias ext_segments_to_pt_av is << signal.ult_tb.ULT.ext_segments_to_pt_av : sf2pt_bus_avt >>;

  alias pl2pt_av is << signal.ult_tb.ULT.pl2pt_av : pl2ptcalc_avt >>;

  -- variable fifo_mem_v : heg2sf_hits_fifo_at(OUTPUT_FIFO_LEN -1 downto 0);
  variable fifo_count : integer := 0;

  variable sf2pt : sf2ptcalc_rt;

  variable sf_2write : in_pt_pt2sf_sim_rt;
  variable mpl_2write : in_pt_mpl_sim_rt;

  variable read_sf  : sf2ptcalc_rt;
  variable read_mpl : pl2ptcalc_rt;
  -- variable read_hit   : heg2sfhit_rt;

  variable header2write : std_logic := '0';

begin
  if rising_edge(clk) then
    if rst = '1' then
          
    else

      if header2write = '0' then
        SWRITE(row, "#----------------------------------------");
        writeline(file_sf_handler,row);
        SWRITE(row, "# Output : SF 2 PTCALC");
        writeline(file_sf_handler,row);
        SWRITE(row, "# BUS : sf2ptcalc_rt ");
        writeline(file_sf_handler,row);
        SWRITE(row, "# IN_SLC_FILE : " & IN_SLC_FILE);
        writeline(file_sf_handler,row);
        SWRITE(row, "# IN_HIT_FILE : " & IN_HIT_FILE);
        writeline(file_sf_handler,row);
        SWRITE(row, "#----------------------------------------");
        writeline(file_sf_handler,row);
        WRITEHEADER(row,sf_2write);
        writeline(file_sf_handler,row);
        ----------------------------------------
        SWRITE(row, "#----------------------------------------");
        writeline(file_mpl_handler,row);
        SWRITE(row, "# Output : SF 2 PTCALC");
        writeline(file_mpl_handler,row);
        SWRITE(row, "# BUS : pl2ptcalc_rt ");
        writeline(file_mpl_handler,row);
        SWRITE(row, "# IN_SLC_FILE : " & IN_SLC_FILE);
        writeline(file_mpl_handler,row);
        SWRITE(row, "# IN_HIT_FILE : " & IN_HIT_FILE);
        writeline(file_mpl_handler,row);
        SWRITE(row, "#----------------------------------------");
        writeline(file_mpl_handler,row);
        WRITEHEADER(row,mpl_2write);
        writeline(file_mpl_handler,row);
        header2write := '1';
      end if;

      fifo_count := 0;

      -------------------------------------------------------------------
      -- new SF
      -------------------------------------------------------------------

      if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
        for heg_i in c_NUM_THREADS -1 downto 0 loop
          read_sf := convert(inn_segments_to_pt_av(heg_i));
          if read_sf.data_valid = '1' then

            sf_2write.ToA      := tb_curr_tdc_time;
            sf_2write.station  := to_unsigned(0,4);
            sf_2write.thread   := to_unsigned(heg_i,4);
            sf_2write.data   := read_sf;
            write(row,sf_2write);
            writeline(file_sf_handler,row);

          end if;
        end loop;
      end if;
      if c_STATIONS_IN_SECTOR(1) = '1' then -- MID
        for heg_i in c_NUM_THREADS -1 downto 0 loop
          read_sf := convert(mid_segments_to_pt_av(heg_i));
          if read_sf.data_valid = '1' then

            sf_2write.ToA      := tb_curr_tdc_time;
            sf_2write.station  := to_unsigned(1,4);
            sf_2write.thread   := to_unsigned(heg_i,4);
            sf_2write.data   := read_sf;
            write(row,sf_2write);
            writeline(file_sf_handler,row);

          end if;
        end loop;
      end if;
      if c_STATIONS_IN_SECTOR(2) = '1' then -- OUT
        for heg_i in c_NUM_THREADS -1 downto 0 loop
          read_sf := convert(out_segments_to_pt_av(heg_i));
          if read_sf.data_valid = '1' then

            sf_2write.ToA      := tb_curr_tdc_time;
            sf_2write.station  := to_unsigned(2,4);
            sf_2write.thread   := to_unsigned(heg_i,4);
            sf_2write.data   := read_sf;
            write(row,sf_2write);
            writeline(file_sf_handler,row);

          end if;
        end loop;
      end if;

      -------------------------------------------------------------------
      -- new HIT
      -------------------------------------------------------------------

      -- if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
        for heg_i in c_NUM_THREADS -1 downto 0 loop
          read_mpl := convert(pl2pt_av(heg_i));
          if read_mpl.data_valid = '1' then
            mpl_2write.ToA      := tb_curr_tdc_time;
            -- mpl_2write.station  := to_unsigned(0,4);
            mpl_2write.thread   := to_unsigned(heg_i,4);
            mpl_2write.data   := read_mpl;
            write(row,mpl_2write);
            writeline(file_mpl_handler,row);
          end if;
        end loop;
      -- end if;

    end if;
  end if;
end process SF_MPL_PT;
  
end architecture sim;
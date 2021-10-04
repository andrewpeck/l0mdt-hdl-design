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

use shared_lib.vhdl_tb_utils_pkg.all;

library project_lib;
use project_lib.ult_tb_sim_pkg.all;
use project_lib.ult_tb_sim_cstm_pkg.all;
use project_lib.vhdl_textio_csv_pkg.all;

library ult_lib;
library vamc_lib;

library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

entity ult_tb_writer_heg is
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
end entity ult_tb_writer_heg;

architecture sim of ult_tb_writer_heg is

  alias slc_file_ok is  << signal.ult_tp.SLC.file_open : std_logic >>;
  alias slc_file_ts is  << signal.ult_tp.SLC.file_ts : string >>;
  alias hit_file_ok is  << signal.ult_tp.MDT.file_open : std_logic >>;
  alias hit_file_ts is  << signal.ult_tp.MDT.file_ts : string >>;

  constant g_OUT_FILE_1     : string  := "ov_heg_hp2bm_" & g_PRJ_INFO & ".csv";
  constant g_OUT_FILE_2     : string  := "ov_heg_ctrlRoi_" & g_PRJ_INFO & ".csv";
     
  shared variable csv_file_1: csv_file_reader_type;
  shared variable csv_file_2: csv_file_reader_type;

  alias slc_event_ai is  << signal.ult_tp.SLC.slc_event_ai : event_aut >>;

  
begin

  
  
  -- HEG_BM: process(clk)

  --   file file_slc_handler : text open write_mode is OUT_HEG_BM_SLC_FILE;
  --   file file_hit_handler : text open write_mode is OUT_HEG_BM_HIT_FILE;

  --   variable row 		: line;

  --   -- o_sf_control_v

  --   alias heg2sf_inn_slc_av is  << signal.ult_tp.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sfslc_av : heg2sfslc_bus_avt >>;
  --   alias heg2sf_inn_hit_av is  << signal.ult_tp.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sfhit_av : heg2sfhit_bus_avt >>;
  --   alias heg2sf_inn_ctrl_av is << signal.ult_tp.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt >>;

  --   alias heg2sf_mid_slc_av is  << signal.ult_tp.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_mid.HPS.heg2sfslc_av : heg2sfslc_bus_avt >>;
  --   alias heg2sf_mid_hit_av is  << signal.ult_tp.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_mid.HPS.heg2sfhit_av : heg2sfhit_bus_avt >>;
  --   alias heg2sf_mid_ctrl_av is << signal.ult_tp.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_mid.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt >>;

  --   alias heg2sf_out_slc_av is  << signal.ult_tp.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_out.HPS.heg2sfslc_av : heg2sfslc_bus_avt >>;
  --   alias heg2sf_out_hit_av is  << signal.ult_tp.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_out.HPS.heg2sfhit_av : heg2sfhit_bus_avt >>;
  --   alias heg2sf_out_ctrl_av is << signal.ult_tp.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_out.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt >>;
  --   -- heg2sf_ctrl_av : hps_ctrl2sf_avt

  --   -- variable fifo_mem_v : heg2sf_hits_fifo_at(OUTPUT_FIFO_LEN -1 downto 0);
  --   variable fifo_count : integer := 0;

  --   variable hit2write : out_heg_bm_hit_sim_rt;
  --   variable slc2write : out_heg_bm_slc_sim_rt;
  --   variable ctrl2write : out_heg_bm_ctrl_sim_rt;

  --   variable read_ctrl  : heg_ctrl2sf_rt;
  --   variable read_slc   : heg2sfslc_rt;
  --   variable read_hit   : heg2sfhit_rt;

  --   variable header2write : std_logic := '0';

  -- begin
  --   if rising_edge(clk) then
  --     if rst = '1' then
            
  --     else

  --       if header2write = '0' then
  --         SWRITE(row, "#----------------------------------------");
  --         writeline(file_slc_handler,row);
  --         SWRITE(row, "# Output : HEG buffer mux");
  --         writeline(file_slc_handler,row);
  --         SWRITE(row, "# BUS : heg2sfslc_rt ");
  --         writeline(file_slc_handler,row);
  --         SWRITE(row, "# IN_SLC_FILE : " & IN_SLC_FILE);
  --         writeline(file_slc_handler,row);
  --         SWRITE(row, "# IN_HIT_FILE : " & IN_HIT_FILE);
  --         writeline(file_slc_handler,row);
  --         SWRITE(row, "#----------------------------------------");
  --         writeline(file_slc_handler,row);
  --         WRITEHEADER(row,slc2write);
  --         writeline(file_slc_handler,row);
  --         ----------------------------------------
  --         SWRITE(row, "#----------------------------------------");
  --         writeline(file_hit_handler,row);
  --         SWRITE(row, "# Output : HEG buffer mux");
  --         writeline(file_hit_handler,row);
  --         SWRITE(row, "# BUS : heg2sfhit_rt ");
  --         writeline(file_hit_handler,row);
  --         SWRITE(row, "# IN_SLC_FILE : " & IN_SLC_FILE);
  --         writeline(file_hit_handler,row);
  --         SWRITE(row, "# IN_HIT_FILE : " & IN_HIT_FILE);
  --         writeline(file_hit_handler,row);
  --         SWRITE(row, "#----------------------------------------");
  --         writeline(file_hit_handler,row);
  --         WRITEHEADER(row,hit2write);
  --         writeline(file_hit_handler,row);
  --         header2write := '1';
  --       end if;

  --       fifo_count := 0;

  --       -------------------------------------------------------------------
  --       -- new SLC
  --       -------------------------------------------------------------------

  --       if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
  --         for heg_i in c_NUM_THREADS -1 downto 0 loop
  --           read_slc := structify(heg2sf_inn_slc_av(heg_i));
  --           if read_slc.data_valid = '1' then

  --             slc2write.ToA      := tb_curr_tdc_time;
  --             slc2write.station  := to_unsigned(0,4);
  --             slc2write.thread   := to_unsigned(heg_i,4);
  --             slc2write.data   := read_slc;
  --             write(row,slc2write);
  --             writeline(file_slc_handler,row);

  --           end if;
  --         end loop;
  --       end if;
  --       if c_STATIONS_IN_SECTOR(1) = '1' then -- MID
  --         for heg_i in c_NUM_THREADS -1 downto 0 loop
  --           read_slc := structify(heg2sf_mid_slc_av(heg_i));
  --           if read_slc.data_valid = '1' then

  --             slc2write.ToA      := tb_curr_tdc_time;
  --             slc2write.station  := to_unsigned(1,4);
  --             slc2write.thread   := to_unsigned(heg_i,4);
  --             slc2write.data   := read_slc;
  --             write(row,slc2write);
  --             writeline(file_slc_handler,row);

  --           end if;
  --         end loop;
  --       end if;
  --       if c_STATIONS_IN_SECTOR(2) = '1' then -- OUT
  --         for heg_i in c_NUM_THREADS -1 downto 0 loop
  --           read_slc := structify(heg2sf_out_slc_av(heg_i));
  --           if read_slc.data_valid = '1' then

  --             slc2write.ToA      := tb_curr_tdc_time;
  --             slc2write.station  := to_unsigned(2,4);
  --             slc2write.thread   := to_unsigned(heg_i,4);
  --             slc2write.data   := read_slc;
  --             write(row,slc2write);
  --             writeline(file_slc_handler,row);

  --           end if;
  --         end loop;
  --       end if;

  --       -------------------------------------------------------------------
  --       -- end SLC
  --       -------------------------------------------------------------------

  --       if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
  --         for heg_i in c_NUM_THREADS -1 downto 0 loop
  --           read_ctrl := structify(heg2sf_inn_ctrl_av(heg_i));
  --           -- read_slc := structify(heg2sf_inn_slc_av(heg_i));
  --           if read_ctrl.eof = '1' then
  --             read_slc := structify(heg2sf_inn_slc_av(heg_i));
  --             ctrl2write.ToA      := tb_curr_tdc_time;
  --             ctrl2write.station  := to_unsigned(0,4);
  --             ctrl2write.thread   := to_unsigned(heg_i,4);
  --             ctrl2write.HEG_ctrl := read_ctrl;
  --             ctrl2write.data    := read_slc;
  --             write(row,ctrl2write);
  --             writeline(file_slc_handler,row);

  --           end if;
  --         end loop;
  --       end if;
  --       if c_STATIONS_IN_SECTOR(1) = '1' then -- MID
  --         for heg_i in c_NUM_THREADS -1 downto 0 loop
  --           read_ctrl := structify(heg2sf_mid_ctrl_av(heg_i));
  --           -- read_slc := structify(heg2sf_mid_slc_av(heg_i));
  --           if read_ctrl.eof = '1' then
  --             read_slc := structify(heg2sf_mid_slc_av(heg_i));
  --             ctrl2write.ToA      := tb_curr_tdc_time;
  --             ctrl2write.station  := to_unsigned(0,4);
  --             ctrl2write.thread   := to_unsigned(heg_i,4);
  --             ctrl2write.HEG_ctrl := read_ctrl;
  --             ctrl2write.data    := read_slc;
  --             write(row,ctrl2write);
  --             writeline(file_slc_handler,row);

  --           end if;
  --         end loop;
  --       end if;
  --       if c_STATIONS_IN_SECTOR(2) = '1' then -- OUT
  --         for heg_i in c_NUM_THREADS -1 downto 0 loop
  --           read_ctrl := structify(heg2sf_out_ctrl_av(heg_i));
  --           -- read_slc := structify(heg2sf_out_slc_av(heg_i));
  --           if read_ctrl.eof = '1' then
  --             read_slc := structify(heg2sf_out_slc_av(heg_i));
  --             ctrl2write.ToA      := tb_curr_tdc_time;
  --             ctrl2write.station  := to_unsigned(0,4);
  --             ctrl2write.thread   := to_unsigned(heg_i,4);
  --             ctrl2write.HEG_ctrl := read_ctrl;
  --             ctrl2write.data    := read_slc;
  --             write(row,ctrl2write);
  --             writeline(file_slc_handler,row);

  --           end if;
  --         end loop;
  --       end if;

  --       -------------------------------------------------------------------
  --       -- new HIT
  --       -------------------------------------------------------------------

  --       if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
  --         for heg_i in c_NUM_THREADS -1 downto 0 loop
  --           read_hit := structify(heg2sf_inn_hit_av(heg_i));
  --           if read_hit.data_valid = '1' then
  --             hit2write.ToA      := tb_curr_tdc_time;
  --             hit2write.station  := to_unsigned(0,4);
  --             hit2write.thread   := to_unsigned(heg_i,4);
  --             hit2write.data   := read_hit;
  --             write(row,hit2write);
  --             writeline(file_hit_handler,row);
  --           end if;
  --         end loop;
  --       end if;
  --       if c_STATIONS_IN_SECTOR(1) = '1' then -- MID
  --         for heg_i in c_NUM_THREADS -1 downto 0 loop
  --           read_hit := structify(heg2sf_mid_hit_av(heg_i));
  --           if read_hit.data_valid = '1' then
  --             hit2write.ToA      := tb_curr_tdc_time;
  --             hit2write.station  := to_unsigned(1,4);
  --             hit2write.thread   := to_unsigned(heg_i,4);
  --             hit2write.data   := read_hit;
  --             write(row,hit2write);
  --             writeline(file_hit_handler,row);
  --           end if;
  --         end loop;
  --       end if;
  --       if c_STATIONS_IN_SECTOR(2) = '1' then -- OUT
  --         for heg_i in c_NUM_THREADS -1 downto 0 loop
  --           read_hit := structify(heg2sf_out_hit_av(heg_i));
  --           if read_hit.data_valid = '1' then
  --             hit2write.ToA      := tb_curr_tdc_time;
  --             hit2write.station  := to_unsigned(2,4);
  --             hit2write.thread   := to_unsigned(heg_i,4);
  --             hit2write.data   := read_hit;
  --             write(row,hit2write);
  --             writeline(file_hit_handler,row);
  --           end if;
  --         end loop;
  --       end if;

  --     end if;
  --   end if;
  -- end process HEG_BM;



  
  
end architecture sim;
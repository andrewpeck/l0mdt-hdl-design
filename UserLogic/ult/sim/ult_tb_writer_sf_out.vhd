--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Test Bench Module for Logic Trigger Path
--  Description: HPS SF input busses
--
--------------------------------------------------------------------------------
--  Revisions:
--      2021.10.06 Creation 
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

use shared_lib.vhdl_tb_utils_pkg.all;

library project_lib;
use project_lib.ult_tb_sim_pkg.all;
use project_lib.ult_tb_sim_cstm_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;

library ult_lib;
library vamc_lib;

library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

entity ult_tb_writer_sf_out is
  generic(
    g_PRJ_INFO            : string  := "not_defined";
    g_IN_SLC_FILE         : string  := "not_defined.csv";
    g_IN_HIT_FILE         : string  := "not_defined.csv";
    g_IN_L0_FILE          : string  := "not_defined.csv"
    -- OUT_PTIN_SF_FILE    : string  := "sf2out.csv";
    -- OUT_PTIN_MPL_FILE   : string  := "not_defined.csv"
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    enable                : in integer;
    --
    tb_curr_tdc_time      : in unsigned(63 downto 0) := (others => '0')
  );
end entity ult_tb_writer_sf_out;

architecture sim of ult_tb_writer_sf_out is
  
  
  alias slc_file_ok is  << signal.ult_tb.SLC.file_open : std_logic >>;
  alias slc_file_ts is  << signal.ult_tb.SLC.file_ts : string >>;
  alias hit_file_ok is  << signal.ult_tb.MDT.file_open : std_logic >>;
  alias hit_file_ts is  << signal.ult_tb.MDT.file_ts : string >>;

  shared variable csv_file_1: csv_file_type;
  shared variable csv_file_2: csv_file_type;

  constant g_OUT_FILE_1     : string  := "ov_heg_heg2sf_" & g_PRJ_INFO & ".csv";
  constant g_OUT_FILE_2     : string  := "ov_heg_ctrlRoi_" & g_PRJ_INFO & ".csv";
     
  alias slc_event_ai is  << signal.ult_tb.SLC.slc_event_ai : event_xaut >>;
  alias mdt_event_ai is  << signal.ult_tb.MDT.mdt_event_ai : event_tdc_aut >>;

  signal tdc_event_u2h_au : event_tdc_at;

begin
  
  open_csv: process
  begin
    wait until slc_file_ok and hit_file_ok;
    ------------------------------------------------
    puts("opening HEG BM2SF CSV file : " & g_OUT_FILE_1);
    csv_file_1.initialize(g_OUT_FILE_1,"wr");
    csv_file_1.write_string("# --------------------------");
    csv_file_1.write_string("# SLC TS  : " & slc_file_ts);
    csv_file_1.write_string("# HIT TS  : " & hit_file_ts);
    csv_file_1.write_string("# PRJ CFG : " & g_PRJ_INFO);
    csv_file_1.write_string("# SIM TS  : " & time'image(now));
    csv_file_1.write_string("# --------------------------");
    --
    csv_file_1.write_word("ToA");
    csv_file_1.write_word("event");                  
    csv_file_1.write_word("station");   
    csv_file_1.write_word("thread");                  
    --
    csv_file_1.write_word("mlayer");
    csv_file_1.write_word("radius");
    csv_file_1.write_word("local_x");
    csv_file_1.write_word("local_y");
    --
    csv_file_1.writeline;
    ------------------------------------------------
    puts("opening HEG CTRL&ROI CSV file : " & g_OUT_FILE_2);
    csv_file_2.initialize(g_OUT_FILE_2,"wr");
    csv_file_2.write_string("# --------------------------");
    csv_file_2.write_string("# SLC TS  : " & slc_file_ts);
    csv_file_2.write_string("# HIT TS  : " & hit_file_ts);
    csv_file_2.write_string("# PRJ CFG : " & g_PRJ_INFO);
    csv_file_2.write_string("# SIM TS  : " & time'image(now));
    csv_file_2.write_string("# --------------------------");
    --
    csv_file_2.write_word("ToA");
    csv_file_2.write_word("event");                  
    csv_file_2.write_word("station");   
    csv_file_2.write_word("thread");  
    csv_file_2.write_word("EOF");  
    -- muid
    csv_file_2.write_word("slc_id");
    csv_file_2.write_word("slid");
    csv_file_2.write_word("bcid");
    -- mdtseg Dest
    csv_file_2.write_word("mdtseg_Dest");
    -- mdtid
    csv_file_2.write_word("chamber_id");
    csv_file_2.write_word("chamber_ieta");
    -- vec
    csv_file_2.write_word("vec_pos");
    csv_file_2.write_word("vec_ang");
    -- vec
    csv_file_2.write_word("hewindow_pos");
    --
    csv_file_2.writeline;
    wait;
  end process open_csv;

  event_st_pl : for st_i in 0 to 3 generate
    event_ch_pl : for ch_i in c_HPS_MAX_ARRAY(st_i) -1 downto 0 generate
      E_PL : entity vamc_lib.vamc_spl
      generic map(
        -- pragma translate_off
        g_SIMULATION => '1',
        -- pragma translate_on
        g_PIPELINE_TYPE => "ring_buffer",
        g_DELAY_CYCLES  => 423,
        g_PIPELINE_WIDTH    => 32
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => '1',
        --
        i_data      => std_logic_vector(mdt_event_ai(st_i)(ch_i)),
        o_data      => tdc_event_u2h_au(st_i)(ch_i)
      );
    end generate;
  end generate;

  -- inn_mdt_full_data_ar <= convert(inn_mdt_full_data_av);
  -- mid_mdt_full_data_ar <= convert(mid_mdt_full_data_av);
  -- out_mdt_full_data_ar <= convert(out_mdt_full_data_av);
  -- ext_mdt_full_data_ar <= convert(ext_mdt_full_data_av);
  
  HPS_INN: if c_STATIONS_IN_SECTOR(0) = '1' generate
    constant lc_ST_ID : integer := 0;
    --
    alias heg2sf_slc_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sfslc_av   : heg2sfslc_avt >>;
    alias heg2sf_hit_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sfhit_av   : heg2sfhit_avt >>;
    alias heg2sf_ctrl_av is << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt   >>;
    signal heg2sf_slc_ar  : heg2sfslc_art(c_NUM_THREADS -1 downto 0);
    signal heg2sf_hit_ar  : heg2sfhit_art(c_NUM_THREADS -1 downto 0);
    signal heg2sf_ctrl_ar : hps_ctrl2sf_art(c_NUM_THREADS -1 downto 0);

  begin
    heg2sf_hit_ar  <= convert(heg2sf_hit_av );
    HIT_HEG2SF: process(clk, rst) begin
      if rst = '1' then
      elsif rising_edge(clk) then
        for th_i in c_NUM_THREADS -1 downto 0 loop
          if heg2sf_hit_ar(th_i).data_valid = '1' then
            csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
            csv_file_1.write_integer(0);--unsigned(tdc_event_u2h_au(lc_ST_ID)(th_i)));          
            csv_file_1.write_integer(lc_ST_ID);
            csv_file_1.write_integer(th_i);
            csv_file_1.write_bool(heg2sf_hit_ar(th_i).mlayer);
            csv_file_1.write_integer(heg2sf_hit_ar(th_i).localx);
            csv_file_1.write_integer(heg2sf_hit_ar(th_i).localy);
            csv_file_1.write_integer(heg2sf_hit_ar(th_i).radius);
            csv_file_1.writeline;
          end if;
        end loop;
      end if;
    end process;
    --
    heg2sf_slc_ar  <= convert(heg2sf_slc_av );
    heg2sf_ctrl_ar <= convert(heg2sf_ctrl_av);
    SLC_HEG2SF: process(clk, rst) begin
      if rst = '1' then
      elsif rising_edge(clk) then
        for th_i in c_NUM_THREADS -1 downto 0 loop
          if heg2sf_slc_ar(th_i).data_valid = '1' or heg2sf_ctrl_ar(th_i).eof = '1' then
            csv_file_2.write_integer(to_integer(tb_curr_tdc_time));
            csv_file_2.write_integer(0);--unsigned(tdc_event_u2h_au(lc_ST_ID)(th_i)));          
            csv_file_2.write_integer(lc_ST_ID);
            csv_file_2.write_integer(th_i);

            csv_file_2.write_bool(heg2sf_ctrl_ar(th_i).eof);
            -- muid
            csv_file_2.write_integer(to_integer(heg2sf_slc_ar(th_i).muid.slcid));
            csv_file_2.write_integer(to_integer(heg2sf_slc_ar(th_i).muid.slid));
            csv_file_2.write_integer(to_integer(heg2sf_slc_ar(th_i).muid.bcid));
            -- mdtseg2Dest
            csv_file_2.write_integer(to_integer(unsigned(heg2sf_slc_ar(th_i).mdtseg_dest)));
            -- mdtid
            csv_file_2.write_integer(to_integer(heg2sf_slc_ar(th_i).mdtid.chamber_id));
            csv_file_2.write_integer(to_integer(heg2sf_slc_ar(th_i).mdtid.chamber_ieta));
            -- vec_po2
            csv_file_2.write_integer(to_integer(heg2sf_slc_ar(th_i).vec_pos));
            csv_file_2.write_integer(to_integer(heg2sf_slc_ar(th_i).vec_ang));

            csv_file_2.write_integer(to_integer(heg2sf_slc_ar(th_i).hewindow_pos));

            csv_file_2.writeline;
          end if;
        end loop;
      end if;
    end process;
  end generate;

  HPS_MID: if c_STATIONS_IN_SECTOR(1) = '1' generate
    constant lc_ST_ID : integer := 1;
    --
    alias heg2sf_slc_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sfslc_av   : heg2sfslc_avt >>;
    alias heg2sf_hit_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sfhit_av   : heg2sfhit_avt >>;
    alias heg2sf_ctrl_av is << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt   >>;

  begin

  end generate;

  HPS_OUT: if c_STATIONS_IN_SECTOR(2) = '1' generate
    constant lc_ST_ID : integer := 2;

  begin

  end generate;

  EXT_MID: if c_STATIONS_IN_SECTOR(3) = '1' generate
    constant lc_ST_ID : integer := 3;

  begin

  end generate;

end architecture sim;
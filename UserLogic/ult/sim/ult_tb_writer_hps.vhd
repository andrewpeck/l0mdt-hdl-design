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

use shared_lib.vhdl_tb_utils_pkg.all;


library project_lib;
use project_lib.ult_tb_sim_pkg.all;
use project_lib.ult_tb_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;

library ult_lib;
library vamc_lib;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;
-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;
-- use hegtypes_lib.heg_pkg.all;

entity ult_tb_writer_hps is
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
end entity ult_tb_writer_hps;

architecture sim of ult_tb_writer_hps is
  
  alias slc_file_ok is  << signal.ult_tb.SLC.file_open : std_logic >>;
  alias slc_file_ts is  << signal.ult_tb.SLC.file_ts : string >>;
  alias hit_file_ok is  << signal.ult_tb.MDT.file_open : std_logic >>;
  alias hit_file_ts is  << signal.ult_tb.MDT.file_ts : string >>;

  shared variable csv_file_1: csv_file_type;
  -- shared variable csv_file_2: csv_file_type;
  -- shared variable csv_file_3: csv_file_type;

  constant g_OUT_FILE_1     : string  := "ov_hpsPc2Heg_" & g_PRJ_INFO & ".csv";
  -- constant g_OUT_FILE_2     : string  := "ov_heg_heg2sf_" & g_PRJ_INFO & ".csv";
  -- constant g_OUT_FILE_3     : string  := "ov_heg_ctrlRoi_" & g_PRJ_INFO & ".csv";
     
  alias slc_event_ai is  << signal.ult_tb.SLC.slc_event_ai : event_xaut >>;
  alias mdt_event_ai is  << signal.ult_tb.MDT.mdt_event_ai : event_tdc_aut >>;

  signal tdc_event_u2h_au : event_tdc_at;

begin
  
  open_csv: process
  begin
    wait until slc_file_ok and hit_file_ok;
    puts("opening UCM2HPS CSV file : " & g_OUT_FILE_1);
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
    csv_file_1.write_word("chamber_id");
    --
    csv_file_1.write_word("tube");
    csv_file_1.write_word("layer");
    csv_file_1.write_word("time_t0");
    csv_file_1.write_word("global_z");
    csv_file_1.write_word("global_x");
    --
    csv_file_1.writeline;  
    -- ------------------------------------------------
    -- puts("opening HEG BM2SF CSV file : " & g_OUT_FILE_2);
    -- csv_file_2.initialize(g_OUT_FILE_2,"wr");
    -- csv_file_2.write_string("# --------------------------");
    -- csv_file_2.write_string("# SLC TS  : " & slc_file_ts);
    -- csv_file_2.write_string("# HIT TS  : " & hit_file_ts);
    -- csv_file_2.write_string("# PRJ CFG : " & g_PRJ_INFO);
    -- csv_file_2.write_string("# SIM TS  : " & time'image(now));
    -- csv_file_2.write_string("# --------------------------");
    -- --
    -- csv_file_2.write_word("ToA");
    -- csv_file_2.write_word("event");                  
    -- csv_file_2.write_word("thread");                  
    -- csv_file_2.write_word("station");   
    -- csv_file_2.write_word("hp_i");
    -- --
    -- csv_file_2.write_word("valid");
    -- csv_file_2.write_word("mlayer");
    -- csv_file_2.write_word("radius");
    -- csv_file_2.write_word("local_x");
    -- csv_file_2.write_word("local_y");
    -- --
    -- csv_file_2.writeline;
    -- ------------------------------------------------
    -- puts("opening HEG CTRL&ROI CSV file : " & g_OUT_FILE_3);
    -- csv_file_3.initialize(g_OUT_FILE_3,"wr");
    -- csv_file_3.write_string("# --------------------------");
    -- csv_file_3.write_string("# SLC TS  : " & slc_file_ts);
    -- csv_file_3.write_string("# HIT TS  : " & hit_file_ts);
    -- csv_file_3.write_string("# PRJ CFG : " & g_PRJ_INFO);
    -- csv_file_3.write_string("# SIM TS  : " & time'image(now));
    -- csv_file_3.write_string("# --------------------------");
    -- --
    -- csv_file_3.write_word("ToA");
    -- csv_file_3.write_word("event");                  
    -- csv_file_3.write_word("station");   
    -- csv_file_3.write_word("chamber_id");
    -- --

    -- --
    -- csv_file_3.writeline;
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
    alias mdt_full_data_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.HPS_INN.HPS.mdt_full_data_av : heg_pc2heg_avt >>;
    signal mdt_full_data_ar  : heg_pc2heg_art(c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0);
  begin
    array_loop : for i in c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0 generate
      mdt_full_data_ar(i) <= convert(mdt_full_data_av(i),mdt_full_data_ar(i));
    end generate ; -- identifier
    PC2HP: process(clk, rst) begin
      if rst = '1' then
      elsif rising_edge(clk) then
        for ch_i in c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0 loop
          if mdt_full_data_ar(ch_i).data_valid = '1' then
            csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
            csv_file_1.write_integer(unsigned(tdc_event_u2h_au(lc_ST_ID)(ch_i)));          
            csv_file_1.write_integer(lc_ST_ID);
            csv_file_1.write_integer(ch_i);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).tube);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).layer);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).time_t0);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).global_z);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).global_x);
            csv_file_1.writeline;
          end if;
        end loop;
      end if;
    end process;
  end generate;

  HPS_MID: if c_STATIONS_IN_SECTOR(1) = '1' generate
    constant lc_ST_ID : integer := 1;
    alias mdt_full_data_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.HPS_MID.HPS.mdt_full_data_av : heg_pc2heg_avt >>;
    signal mdt_full_data_ar  : heg_pc2heg_art(c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0);
  begin
    array_loop : for i in c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0 generate
      mdt_full_data_ar(i) <= convert(mdt_full_data_av(i),mdt_full_data_ar(i));
    end generate ; -- identifier
    PC2HP: process(clk, rst) begin
      if rst = '1' then
      elsif rising_edge(clk) then
        for ch_i in c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0 loop
          if mdt_full_data_ar(ch_i).data_valid = '1' then
            csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
            csv_file_1.write_integer(unsigned(tdc_event_u2h_au(lc_ST_ID)(ch_i)));          
            csv_file_1.write_integer(lc_ST_ID);
            csv_file_1.write_integer(ch_i);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).tube);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).layer);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).time_t0);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).global_z);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).global_x);
            csv_file_1.writeline;
          end if;
        end loop;
      end if;
    end process;
  end generate;

  HPS_OUT: if c_STATIONS_IN_SECTOR(2) = '1' generate
    constant lc_ST_ID : integer := 2;
    alias mdt_full_data_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.HPS_OUT.HPS.mdt_full_data_av : heg_pc2heg_avt >>;
    signal mdt_full_data_ar  : heg_pc2heg_art(c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0);
  begin
    array_loop : for i in c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0 generate
      mdt_full_data_ar(i) <= convert(mdt_full_data_av(i),mdt_full_data_ar(i));
    end generate ; -- identifier
    PC2HP: process(clk, rst) begin
      if rst = '1' then
      elsif rising_edge(clk) then
        for ch_i in c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0 loop
          if mdt_full_data_ar(ch_i).data_valid = '1' then
            csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
            csv_file_1.write_integer(unsigned(tdc_event_u2h_au(lc_ST_ID)(ch_i)));          
            csv_file_1.write_integer(lc_ST_ID);
            csv_file_1.write_integer(ch_i);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).tube);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).layer);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).time_t0);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).global_z);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).global_x);
            csv_file_1.writeline;
          end if;
        end loop;
      end if;
    end process;
  end generate;

  EXT_MID: if c_STATIONS_IN_SECTOR(3) = '1' generate
    constant lc_ST_ID : integer := 3;
    alias mdt_full_data_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.HPS_EXT.HPS.mdt_full_data_av : heg_pc2heg_avt >>;
    signal mdt_full_data_ar  : heg_pc2heg_art(c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0);
  begin
    array_loop : for i in c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0 generate
      mdt_full_data_ar(i) <= convert(mdt_full_data_av(i),mdt_full_data_ar(i));
    end generate ; -- identifier
    PC2HP: process(clk, rst) begin
      if rst = '1' then
      elsif rising_edge(clk) then
        for ch_i in c_HPS_MAX_ARRAY(lc_ST_ID) -1 downto 0 loop
          if mdt_full_data_ar(ch_i).data_valid = '1' then
            csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
            csv_file_1.write_integer(unsigned(tdc_event_u2h_au(lc_ST_ID)(ch_i)));          
            csv_file_1.write_integer(lc_ST_ID);
            csv_file_1.write_integer(ch_i);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).tube);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).layer);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).time_t0);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).global_z);
            csv_file_1.write_integer(mdt_full_data_ar(ch_i).global_x);
            csv_file_1.writeline;
          end if;
        end loop;
      end if;
    end process;
  end generate;

  
end architecture sim;

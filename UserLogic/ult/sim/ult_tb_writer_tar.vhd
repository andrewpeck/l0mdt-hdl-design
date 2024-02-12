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

use shared_lib.vhdl_tb_utils_pkg.all;

library project_lib;
use project_lib.ult_tb_sim_pkg.all;
use project_lib.ult_tb_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;

library ult_lib;
library vamc_lib;

entity ult_tb_writer_tar is
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
    -- i_hit_event_ai        : in event_xaut(c_MAX_NUM_SL -1 downto 0) 
  );
end entity ult_tb_writer_tar;

architecture sim of ult_tb_writer_tar is

  alias slc_file_ok is  << signal.ult_tb.SLC.file_open : std_logic >>;
  alias slc_file_ts is  << signal.ult_tb.SLC.file_ts : string >>;
  alias hit_file_ok is  << signal.ult_tb.MDT.file_open : std_logic >>;
  alias hit_file_ts is  << signal.ult_tb.MDT.file_ts : string >>;
  shared variable csv_file_1: csv_file_type;
  constant g_OUT_FILE_1     : string  := "ov_tar2hps_" & g_PRJ_INFO & ".csv";

  alias ult_inn_tar_hits_av is  << signal.ult_tb.ULT.ult_inn_tar_hits_out_av : tar2hps_avt >>;
  alias ult_mid_tar_hits_av is  << signal.ult_tb.ULT.ult_mid_tar_hits_out_av : tar2hps_avt >>;
  alias ult_out_tar_hits_av is  << signal.ult_tb.ULT.ult_out_tar_hits_out_av : tar2hps_avt >>;
  alias ult_ext_tar_hits_av is  << signal.ult_tb.ULT.ult_ext_tar_hits_out_av : tar2hps_avt >>;

  alias mdt_event_ai is  << signal.ult_tb.MDT.mdt_event_ai : event_tdc_aut >>;

  signal tdc_event_u2h_au : event_tdc_at;

  signal ult_inn_tar_hits_ar  : tar2hps_art(c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal ult_mid_tar_hits_ar  : tar2hps_art(c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal ult_out_tar_hits_ar  : tar2hps_art(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal ult_ext_tar_hits_ar  : tar2hps_art(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
  
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
        g_DELAY_CYCLES  => 420,
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

    loop_inn : for i in c_HPS_NUM_MDT_CH_INN -1 downto 0 generate
      ult_inn_tar_hits_ar(i) <= convert(ult_inn_tar_hits_av(i),ult_inn_tar_hits_ar(i));
    end generate ; -- identifier
    loop_mid : for i in c_HPS_NUM_MDT_CH_MID -1 downto 0 generate
      ult_mid_tar_hits_ar(i) <= convert(ult_mid_tar_hits_av(i),ult_mid_tar_hits_ar(i));
    end generate ; -- identifier
    loop_out : for i in c_HPS_NUM_MDT_CH_OUT -1 downto 0 generate
      ult_out_tar_hits_ar(i) <= convert(ult_out_tar_hits_av(i),ult_out_tar_hits_ar(i));
    end generate ; -- identifier
    loop_ext : for i in c_HPS_NUM_MDT_CH_EXT -1 downto 0 generate
      ult_ext_tar_hits_ar(i) <= convert(ult_ext_tar_hits_av(i),ult_ext_tar_hits_ar(i));
    end generate ; -- identifier

  
  TAR2HPS: process(clk)
    variable first_write           : std_logic := '1';

  begin
    if rising_edge(clk) then
      if first_write = '1' then
        -- wait until not slc_file_ok and not hit_file_ok;
        -- puts("opening UCM2HPS CSV file : " & g_OUT_FILE_1);
        -- csv_file_1.initialize(g_OUT_FILE_1,"wr");
        -- csv_file_1.write_string("# --------------------------");
        -- csv_file_1.write_word("#");
        -- csv_file_1.write_string("#");
        -- csv_file_1.write_string("# --------------------------");         
        -- muid
        csv_file_1.write_word("ToA");
        csv_file_1.write_word("event");          
        -- csv_file_1.write_word("thread");          
        csv_file_1.write_word("station");          
        -- muid
        csv_file_1.write_word("chamber_ieta");
        csv_file_1.write_word("layer");
        csv_file_1.write_word("tube");
        csv_file_1.write_word("time");
        -- -- mdtid
        -- csv_file_1.write_word("chamber_id");
        -- csv_file_1.write_word("chamber_ieta");
        -- -- vec_pos
        -- csv_file_1.write_word("vec_pos");
        -- -- vec_ang
        -- csv_file_1.write_word("vec_ang");
        csv_file_1.writeline;
        first_write := '0';
      end if;
      if rst = '1' then
      else
        if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
          for ch_i in c_HPS_MAX_ARRAY(0) -1 downto 0 loop
            if ult_inn_tar_hits_ar(ch_i).data_valid = '1' then
              csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
              csv_file_1.write_integer(unsigned(tdc_event_u2h_au(0)(ch_i)));          
              csv_file_1.write_integer(0);
              csv_file_1.write_integer(ult_inn_tar_hits_ar(ch_i).chamber_ieta);
              csv_file_1.write_integer(ult_inn_tar_hits_ar(ch_i).layer);
              csv_file_1.write_integer(ult_inn_tar_hits_ar(ch_i).tube);
              csv_file_1.write_integer(ult_inn_tar_hits_ar(ch_i).time);
              csv_file_1.writeline;
            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(1) = '1' then -- INN
          for ch_i in c_HPS_MAX_ARRAY(1) -1 downto 0 loop
            if ult_mid_tar_hits_ar(ch_i).data_valid = '1' then
              csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
              csv_file_1.write_integer(unsigned(tdc_event_u2h_au(1)(ch_i)));          
              csv_file_1.write_integer(1);
              csv_file_1.write_integer(ult_mid_tar_hits_ar(ch_i).chamber_ieta);
              csv_file_1.write_integer(ult_mid_tar_hits_ar(ch_i).layer);
              csv_file_1.write_integer(ult_mid_tar_hits_ar(ch_i).tube);
              csv_file_1.write_integer(ult_mid_tar_hits_ar(ch_i).time);
              csv_file_1.writeline;
            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(2) = '1' then -- INN
          for ch_i in c_HPS_MAX_ARRAY(2) -1 downto 0 loop
            if ult_out_tar_hits_ar(ch_i).data_valid = '1' then
              csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
              csv_file_1.write_integer(unsigned(tdc_event_u2h_au(2)(ch_i)));   
              csv_file_1.write_integer(2);
              csv_file_1.write_integer(ult_out_tar_hits_ar(ch_i).chamber_ieta);
              csv_file_1.write_integer(ult_out_tar_hits_ar(ch_i).layer);
              csv_file_1.write_integer(ult_out_tar_hits_ar(ch_i).tube);
              csv_file_1.write_integer(ult_out_tar_hits_ar(ch_i).time);       
              csv_file_1.writeline;
            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(3) = '1' then -- INN
          for ch_i in c_HPS_MAX_ARRAY(3) -1 downto 0 loop
            if ult_ext_tar_hits_ar(ch_i).data_valid = '1' then
              csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
              csv_file_1.write_integer(unsigned(tdc_event_u2h_au(3)(ch_i)));   
              csv_file_1.write_integer(3);
              csv_file_1.write_integer(ult_ext_tar_hits_ar(ch_i).chamber_ieta);
              csv_file_1.write_integer(ult_ext_tar_hits_ar(ch_i).layer);
              csv_file_1.write_integer(ult_ext_tar_hits_ar(ch_i).tube);
              csv_file_1.write_integer(ult_ext_tar_hits_ar(ch_i).time);       
              csv_file_1.writeline;
            end if;
          end loop;
        end if;
      end if;
    end if;
  end process TAR2HPS;
  
end architecture sim;
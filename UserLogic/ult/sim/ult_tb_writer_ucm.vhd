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

-- library heg_lib;
-- use heg_lib.heg_pkg.all;
-- library hps_lib;
-- use hps_lib.hps_pkg.all;

entity ult_tb_writer_ucm is
  generic(
    g_PRJ_INFO            : string  := "A3B";
    g_IN_SLC_FILE         : string  := "not_defined.csv";
    g_IN_HIT_FILE         : string  := "not_defined.csv";
    g_IN_L0_FILE          : string  := "not_defined.csv"
    -- g_OUT_FILE            : string  := "ov_ucm2hps_A3B.csv"
    -- OUT_HEG_BM_SLC_FILE : string  := "hps_heg_bm_slc_A3_Barrel_yt_v04.csv";
    -- OUT_HEG_BM_HIT_FILE : string  := "hps_heg_bm_hit_A3_Barrel_yt_v04.csv"
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    enable                : in integer;
    --
    tb_curr_tdc_time      : in unsigned(63 downto 0)
    -- i_slc_event_ai        : in event_xaut(c_MAX_NUM_SL -1 downto 0) 

  );
end entity ult_tb_writer_ucm;

architecture sim of ult_tb_writer_ucm is

  alias slc_file_ok is  << signal.ult_tb.SLC.file_open : std_logic >>;
  alias slc_file_ts is  << signal.ult_tb.SLC.file_ts : string >>;
  alias hit_file_ok is  << signal.ult_tb.MDT.file_open : std_logic >>;
  alias hit_file_ts is  << signal.ult_tb.MDT.file_ts : string >>;

  constant g_OUT_FILE_1     : string  := "ov_ucm2hps_" & g_PRJ_INFO & ".csv";
  constant g_OUT_FILE_2     : string  := "ov_ucm2mpl_" & g_PRJ_INFO & ".csv";
     
  shared variable csv_file_1: csv_file_type;
  shared variable csv_file_2: csv_file_type;

  alias slc_event_ai is  << signal.ult_tb.SLC.slc_event_ai : event_xaut >>;

  alias inn_slc_to_h2s_av is  << signal.ult_tb.ULT.inn_slc_to_h2s_plin_av : ucm2hps_avt >>;
  alias mid_slc_to_h2s_av is  << signal.ult_tb.ULT.mid_slc_to_h2s_plin_av : ucm2hps_avt >>;
  alias out_slc_to_h2s_av is  << signal.ult_tb.ULT.out_slc_to_h2s_plin_av : ucm2hps_avt >>;
  alias ext_slc_to_h2s_av is  << signal.ult_tb.ULT.ext_slc_to_h2s_plin_av : ucm2hps_avt >>;

  alias ucm2pl_av is  << signal.ult_tb.ULT.ucm2pl_av : ucm2pl_avt >>;
  signal ucm2pl_ar : ucm2pl_art(c_MAX_NUM_SL-1 downto 0);

  signal slc_event_u2m_au        : event_xat(c_MAX_NUM_SL -1 downto 0);
  signal slc_event_u2h_au        : event_xat(c_MAX_NUM_SL -1 downto 0);

  signal inn_ucm2hps_bus_ar : ucm2hps_art(c_NUM_THREADS-1 downto 0);
  signal mid_ucm2hps_bus_ar : ucm2hps_art(c_NUM_THREADS-1 downto 0);
  signal out_ucm2hps_bus_ar : ucm2hps_art(c_NUM_THREADS-1 downto 0);
  signal ext_ucm2hps_bus_ar : ucm2hps_art(c_NUM_THREADS-1 downto 0);



  
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
    puts("opening UCM2PL CSV file : " & g_OUT_FILE_2);
    csv_file_2.initialize(g_OUT_FILE_2,"wr");
    csv_file_2.write_string("# --------------------------");
    csv_file_2.write_string("# SLC TS  : " & slc_file_ts);
    csv_file_2.write_string("# HIT TS  : " & hit_file_ts);
    csv_file_2.write_string("# PRJ CFG : " & g_PRJ_INFO);
    csv_file_2.write_string("# SIM TS  : " & time'image(now));
    csv_file_2.write_string("# --------------------------");    
    wait;
  end process open_csv;

  event_ucm2hps_pl : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    E_U2H_PL : entity vamc_lib.vamc_spl
    generic map(
      -- pragma translate_off
      g_SIMULATION => '1',
      -- pragma translate_on
      g_PIPELINE_TYPE => "ring_buffer",
      g_DELAY_CYCLES  => 52,
      g_PIPELINE_WIDTH    => 32
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => '1',
      --
      i_data      => std_logic_vector(slc_event_ai(sl_i)),
      o_data      => slc_event_u2h_au(sl_i)
    );
  end generate;

    th_loop : for i in c_NUM_THREADS-1 downto 0 generate
      inn_ucm2hps_bus_ar(i) <= convert(inn_slc_to_h2s_av(i),inn_ucm2hps_bus_ar(i));
      mid_ucm2hps_bus_ar(i) <= convert(mid_slc_to_h2s_av(i),mid_ucm2hps_bus_ar(i));
      out_ucm2hps_bus_ar(i) <= convert(out_slc_to_h2s_av(i),out_ucm2hps_bus_ar(i));
      ext_ucm2hps_bus_ar(i) <= convert(ext_slc_to_h2s_av(i),ext_ucm2hps_bus_ar(i));
    end generate ; -- identifier


  UCM2HPS_OUT: process(clk, rst)
    variable first_write           : std_logic := '1';

    -- variable csv_file_1: csv_file_type;

    variable thread_counter : integer := 0;

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
        csv_file_1.write_word("thread");          
        csv_file_1.write_word("station");          
        -- muid
        csv_file_1.write_word("slc_id");
        csv_file_1.write_word("slid");
        csv_file_1.write_word("bcid");
        -- mdtseg_Dest
        csv_file_1.write_word("mdtseg_Dest");
        -- mdtid
        csv_file_1.write_word("chamber_id");
        csv_file_1.write_word("chamber_ieta");
        -- vec_pos
        csv_file_1.write_word("vec_pos");
        -- vec_ang
        csv_file_1.write_word("vec_ang");
        csv_file_1.writeline;
        first_write := '0';
      end if;
      if rst = '1' then
      else     
        if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
          thread_counter := 0;
          for th_i in c_NUM_THREADS -1 downto 0 loop
            -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
            if inn_ucm2hps_bus_ar(th_i).data_valid = '1' then
              -- puts(" hello ",th_i);
              thread_counter := thread_counter +1;
              -- muid
              csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
              -- csv_file_1.write_word("event");          
              csv_file_1.write_integer(unsigned(slc_event_u2h_au(c_MAX_NUM_SL - thread_counter)));          

              csv_file_1.write_integer(th_i);          
              csv_file_1.write_word("0");          
              -- muid
              csv_file_1.write_integer(to_integer(inn_ucm2hps_bus_ar(th_i).muid.slcid));
              csv_file_1.write_integer(to_integer(inn_ucm2hps_bus_ar(th_i).muid.slid));
              csv_file_1.write_integer(to_integer(inn_ucm2hps_bus_ar(th_i).muid.bcid));
              -- mdtseg_Dest
              csv_file_1.write_integer(to_integer(unsigned(inn_ucm2hps_bus_ar(th_i).mdtseg_dest)));
              -- mdtid
              csv_file_1.write_integer(to_integer(inn_ucm2hps_bus_ar(th_i).mdtid.chamber_id));
              csv_file_1.write_integer(to_integer(inn_ucm2hps_bus_ar(th_i).mdtid.chamber_ieta));
              -- vec_pos
              csv_file_1.write_integer(to_integer(inn_ucm2hps_bus_ar(th_i).vec_pos));
              -- vec_ang
              csv_file_1.write_integer(to_integer(inn_ucm2hps_bus_ar(th_i).vec_ang));
              csv_file_1.writeline;

            end if;
          end loop;
        end if;

        if c_STATIONS_IN_SECTOR(1) = '1' then -- INN
          thread_counter := 0;
          for th_i in c_NUM_THREADS -1 downto 0 loop
            -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
            if mid_ucm2hps_bus_ar(th_i).data_valid = '1' then
              -- puts(" hello ",th_i);
              thread_counter := thread_counter +1;

              -- muid
              csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
              -- csv_file_1.write_word("event");          
              csv_file_1.write_integer(unsigned(slc_event_u2h_au(c_MAX_NUM_SL - thread_counter)));          

              csv_file_1.write_integer(th_i);          
              csv_file_1.write_word("1");          
              -- muid
              csv_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(th_i).muid.slcid));
              csv_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(th_i).muid.slid));
              csv_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(th_i).muid.bcid));
              -- mdtseg_Dest
              csv_file_1.write_integer(to_integer(unsigned(mid_ucm2hps_bus_ar(th_i).mdtseg_dest)));
              -- mdtid
              csv_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(th_i).mdtid.chamber_id));
              csv_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(th_i).mdtid.chamber_ieta));
              -- vec_pos
              csv_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(th_i).vec_pos));
              -- vec_ang
              csv_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(th_i).vec_ang));
              csv_file_1.writeline;

            end if;
          end loop;
        end if;

        if c_STATIONS_IN_SECTOR(2) = '1' then -- INN
          thread_counter := 0;

          for th_i in c_NUM_THREADS -1 downto 0 loop
            -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
            if out_ucm2hps_bus_ar(th_i).data_valid = '1' then
              -- puts(" hello ",th_i);
              thread_counter := thread_counter +1;

              -- muid
              csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
              -- csv_file_1.write_word("event");    
              csv_file_1.write_integer(unsigned(slc_event_u2h_au(c_MAX_NUM_SL - thread_counter)));          
              csv_file_1.write_integer(th_i);          
              csv_file_1.write_word("2");          
              -- muid
              csv_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(th_i).muid.slcid));
              csv_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(th_i).muid.slid));
              csv_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(th_i).muid.bcid));
              -- mdtseg_Dest
              csv_file_1.write_integer(to_integer(unsigned(out_ucm2hps_bus_ar(th_i).mdtseg_dest)));
              -- mdtid
              csv_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(th_i).mdtid.chamber_id));
              csv_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(th_i).mdtid.chamber_ieta));
              -- vec_pos
              csv_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(th_i).vec_pos));
              -- vec_ang
              csv_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(th_i).vec_ang));
              csv_file_1.writeline;

            end if;
          end loop;
        end if;

        if c_STATIONS_IN_SECTOR(3) = '1' then -- INN
          thread_counter := 0;

          for th_i in c_NUM_THREADS -1 downto 0 loop
            -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
            if ext_ucm2hps_bus_ar(th_i).data_valid = '1' then
              -- puts(" hello ",th_i);
              thread_counter := thread_counter +1;

              -- muid
              csv_file_1.write_integer(to_integer(tb_curr_tdc_time));
              -- csv_file_1.write_word("event");          
              csv_file_1.write_integer(unsigned(slc_event_u2h_au(c_MAX_NUM_SL - thread_counter)));          

              csv_file_1.write_integer(th_i);          
              csv_file_1.write_word("3");          
              -- muid
              csv_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(th_i).muid.slcid));
              csv_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(th_i).muid.slid));
              csv_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(th_i).muid.bcid));
              -- mdtseg_Dest
              csv_file_1.write_integer(to_integer(unsigned(ext_ucm2hps_bus_ar(th_i).mdtseg_dest)));
              -- mdtid
              csv_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(th_i).mdtid.chamber_id));
              csv_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(th_i).mdtid.chamber_ieta));
              -- vec_pos
              csv_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(th_i).vec_pos));
              -- vec_ang
              csv_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(th_i).vec_ang));
              csv_file_1.writeline;

            end if;
          end loop;
        end if;
      end if;
    end if;
  end process UCM2HPS_OUT;
  
  event_ucm2mpl_pl : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    E_U2M_PL : entity vamc_lib.vamc_spl
    generic map(
      -- pragma translate_off
      g_SIMULATION => '1',
      -- pragma translate_on
      g_PIPELINE_TYPE => "ring_buffer",
      g_DELAY_CYCLES  => 10,
      g_PIPELINE_WIDTH    => 32
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => '1',
      --
      i_data      => std_logic_vector(slc_event_ai(sl_i)),
      o_data      => slc_event_u2m_au(sl_i)
    );
  end generate;

  sl_loop : for i in c_MAX_NUM_SL - 1 downto 0 generate
    ucm2pl_ar(i) <= convert(ucm2pl_av(i),ucm2pl_ar(i));
  end generate ; -- sl_loop

  UCM2MPL_OUT: process(clk, rst)

    variable first_write           : std_logic := '1';

    -- variable csv_file_2: csv_file_type;

    variable common : slc_common_rt;

  begin
    if rising_edge(clk) then
      if first_write = '1' then
        -- puts("opening UCM2PL CSV file : " & g_OUT_FILE_2);
        -- csv_file_2.initialize(g_OUT_FILE_2,"wr");
        -- csv_file_2.write_string("# --------------------------");
        -- csv_file_2.write_string("#");
        -- csv_file_2.write_string("#");
        -- csv_file_2.write_string("# --------------------------");         
        -- event
        csv_file_2.write_word("ToA");
        csv_file_2.write_word("event");          
        csv_file_2.write_word("sl_pos");                   
        -- multi-thread
        csv_file_2.write_word("busy");
        csv_file_2.write_word("process_ch");
        -- common
        -- -- header
        -- csv_file_2.write_word("h_reserved"); 
        csv_file_2.write_word("tcoverflow"); 
        csv_file_2.write_word("nmtc_sl"); 
        csv_file_2.write_word("nmtc_mdt"); 
        csv_file_2.write_word("nslc"); 
        csv_file_2.write_word("bcid"); 
        -- --
        csv_file_2.write_word("slcid"); 
        csv_file_2.write_word("tcsent"); 
        csv_file_2.write_word("poseta"); 
        csv_file_2.write_word("posphi"); 
        csv_file_2.write_word("sl_pt"); 
        csv_file_2.write_word("sl_ptthresh"); 
        csv_file_2.write_word("sl_charge"); 
        csv_file_2.write_word("cointype"); 
        -- -- trailer
        -- csv_file_2.write_word("t_reserved"); 
        csv_file_2.write_word("crc"); 
        csv_file_2.write_word("fiberid"); 
        csv_file_2.write_word("slid"); 
        csv_file_2.write_word("comma"); 
        -- phimod
        csv_file_2.write_word("phimod");
        -- nsw
        csv_file_2.write_word("nswseg_angdtheta");
        csv_file_2.write_word("nswseg_posphi");
        csv_file_2.write_word("nswseg_poseta");
        csv_file_2.writeline;
        first_write := '0';
      end if;
      if rst = '1' then
      else
        for sl_i in c_MAX_NUM_SL -1 downto 0 loop
          -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
          if ucm2pl_ar(sl_i).data_valid = '1' then
            -- common := convert(ucm2pl_ar(sl_i).common);

            -- event
            csv_file_2.write_integer(to_integer(tb_curr_tdc_time));
            csv_file_2.write_integer(unsigned(slc_event_u2m_au(sl_i)));          
            csv_file_2.write_integer(sl_i);                  
            -- 
            csv_file_2.write_bool(ucm2pl_ar(sl_i).busy);
            csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).process_ch));
            -- common
            -- -- header
            -- csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).common.header.h_reserved)); 
            csv_file_2.write_bool(ucm2pl_ar(sl_i).common.header.tcoverflow); 
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.header.nmtc_sl); 
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.header.nmtc_mdt); 
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.header.nslc); 
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.header.bcid); 
            -- -- --
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.slcid); 
            csv_file_2.write_bool(ucm2pl_ar(sl_i).common.tcsent); 
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.poseta); 
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.posphi); 
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.sl_pt); 
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.sl_ptthresh); 
            csv_file_2.write_bool(ucm2pl_ar(sl_i).common.sl_charge); 
            csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).common.cointype)); 
            -- -- -- trailer
            -- csv_file_2.write_integer(ucm2pl_ar(sl_i).common.trailer.t_reserved); 
            csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).common.trailer.crc)); 
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.trailer.fiberid); 
            csv_file_2.write_integer(ucm2pl_ar(sl_i).common.trailer.slid); 
            csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).common.trailer.comma)); 
            -- --
            csv_file_2.write_integer(ucm2pl_ar(sl_i).phimod);
            -- --nsw
            csv_file_2.write_integer(ucm2pl_ar(sl_i).nswseg_angdtheta);
            csv_file_2.write_integer(ucm2pl_ar(sl_i).nswseg_posphi);
            csv_file_2.write_integer(ucm2pl_ar(sl_i).nswseg_poseta);



            csv_file_2.writeline;

          end if;
        end loop;
      end if;
    end if;
  end process UCM2MPL_OUT;
  
  -- HEG_BM: process(clk)

  --   file file_slc_handler : text open write_mode is OUT_HEG_BM_SLC_FILE;
  --   file file_hit_handler : text open write_mode is OUT_HEG_BM_HIT_FILE;

  --   variable row 		: line;

  --   -- o_sf_control_v

  --   alias heg2sf_inn_slc_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sfslc_av : heg2sfslc_avt >>;
  --   alias heg2sf_inn_hit_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sfhit_av : heg2sfhit_avt >>;
  --   alias heg2sf_inn_ctrl_av is << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_inn.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt >>;

  --   alias heg2sf_mid_slc_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_mid.HPS.heg2sfslc_av : heg2sfslc_avt >>;
  --   alias heg2sf_mid_hit_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_mid.HPS.heg2sfhit_av : heg2sfhit_avt >>;
  --   alias heg2sf_mid_ctrl_av is << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_mid.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt >>;

  --   alias heg2sf_out_slc_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_out.HPS.heg2sfslc_av : heg2sfslc_avt >>;
  --   alias heg2sf_out_hit_av is  << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_out.HPS.heg2sfhit_av : heg2sfhit_avt >>;
  --   alias heg2sf_out_ctrl_av is << signal.ult_tb.ULT.logic_gen.H2S_GEN.ULT_H2S.hps_out.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt >>;
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
  --           read_slc := convert(heg2sf_inn_slc_av(heg_i));
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
  --           read_slc := convert(heg2sf_mid_slc_av(heg_i));
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
  --           read_slc := convert(heg2sf_out_slc_av(heg_i));
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
  --           read_ctrl := convert(heg2sf_inn_ctrl_av(heg_i));
  --           -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
  --           if read_ctrl.eof = '1' then
  --             read_slc := convert(heg2sf_inn_slc_av(heg_i));
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
  --           read_ctrl := convert(heg2sf_mid_ctrl_av(heg_i));
  --           -- read_slc := convert(heg2sf_mid_slc_av(heg_i));
  --           if read_ctrl.eof = '1' then
  --             read_slc := convert(heg2sf_mid_slc_av(heg_i));
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
  --           read_ctrl := convert(heg2sf_out_ctrl_av(heg_i));
  --           -- read_slc := convert(heg2sf_out_slc_av(heg_i));
  --           if read_ctrl.eof = '1' then
  --             read_slc := convert(heg2sf_out_slc_av(heg_i));
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
  --           read_hit := convert(heg2sf_inn_hit_av(heg_i));
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
  --           read_hit := convert(heg2sf_mid_hit_av(heg_i));
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
  --           read_hit := convert(heg2sf_out_hit_av(heg_i));
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
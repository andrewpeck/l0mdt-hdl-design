--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: csv_writer_ucm.vhd
-- Module: UCM CSV output signals writer
-- File PATH: /shared/sim/src/csv_writer_ucm.vhd
-- -----
-- File Created: Wednesday, 24th November 2020 1:50:08 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 14th April 2022 2:51:28 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2020-11-24	GLdL : Creation	
-- 2022-04-14	GLdL : New version	
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

-- library project_lib;
use shared_lib.ucm_sim_pkg.all;
use shared_lib.l0mdt_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;

library vamc_lib;

-- library heg_lib;
-- use heg_lib.heg_pkg.all;
-- library hps_lib;
-- use hps_lib.hps_pkg.all;

entity csv_writer_ucm is
  generic(
    g_PRJ_INFO            : string  := "not_defined";
    g_IN_FILES            : string  := "not_defined.csv";
    g_SLC_2_HPS_DELAY : integer := 0;
    g_SLC_2_MPL_DELAY : integer := 0;
    g_verbose         : integer := 1
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    enable                : in std_logic;
    --
    tb_curr_sim_time      : in unsigned(63 downto 0) := (others => '0');
    tb_curr_tdc_time      : in unsigned(63 downto 0) := (others => '0');
    --
    in_slc_file_ok        : in std_logic;
    in_slc_file_ts        : in string;
    in_files_str          : in string(1 to LINE_LENGTH_MAX);
    --
    slc_event_ai          : in event_xaut;
    --
    in_offset_cvp         : in offset_art(c_NUM_ACCEPTS -1 downto 0) := (others => (others => '0'));
    in_slope_cvp          : in slope_art(c_NUM_ACCEPTS -1 downto 0) := (others => (others => '0'));
    -- to TAR
    o_uCM2tar_inn_av      : in ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_mid_av      : in ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_out_av      : in ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_uCM2tar_ext_av      : in ucm2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    --
    inn_slc_to_h2s_av     : in ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    mid_slc_to_h2s_av     : in ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    out_slc_to_h2s_av     : in ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    ext_slc_to_h2s_av     : in ucm2hps_avt(c_NUM_ACCEPTS -1 downto 0);
    --
    ucm2pl_av             : in ucm2pl_avt(c_MAX_NUM_SL -1 downto 0)

  );
end entity csv_writer_ucm;

architecture sim of csv_writer_ucm is

  -- alias slc_file_ok is  << signal.ult_tb.SLC.file_open : std_logic >>;
  -- alias slc_file_ts is  << signal.ult_tb.SLC.file_ts : string >>;
  -- alias hit_file_ok is  << signal.ult_tb.MDT.file_open : std_logic >>;
  -- alias hit_file_ts is  << signal.ult_tb.MDT.file_ts : string >>;

  constant g_OUT_FILE_1     : string  := "ov_" & g_PRJ_INFO & "_ucm2hps.csv";
  constant g_OUT_FILE_2     : string  := "ov_" & g_PRJ_INFO & "_ucm2mpl.csv";
     
  shared variable csv_file_1: csv_file_type;
  shared variable csv_file_2: csv_file_type;

  -- alias slc_event_ai is  << signal.ult_tb.SLC.slc_event_ai : event_xaut >>;

  -- alias inn_slc_to_h2s_av is  << signal.ult_tb.ULT.inn_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- alias mid_slc_to_h2s_av is  << signal.ult_tb.ULT.mid_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- alias out_slc_to_h2s_av is  << signal.ult_tb.ULT.out_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- alias ext_slc_to_h2s_av is  << signal.ult_tb.ULT.ext_slc_to_h2s_plin_av : ucm2hps_avt >>;

  -- alias ucm2pl_av is  << signal.ult_tb.ULT.ucm2pl_av : ucm2pl_avt >>;
  signal ucm2pl_ar : ucm2pl_art(c_MAX_NUM_SL-1 downto 0);

  signal slc_event_u2m_au        : event_xat(c_MAX_NUM_SL -1 downto 0);
  signal slc_event_u2h_au        : event_xat(c_MAX_NUM_SL -1 downto 0);

  signal inn_ucm2hps_bus_ar : ucm2hps_art(c_NUM_ACCEPTS-1 downto 0);
  signal mid_ucm2hps_bus_ar : ucm2hps_art(c_NUM_ACCEPTS-1 downto 0);
  signal out_ucm2hps_bus_ar : ucm2hps_art(c_NUM_ACCEPTS-1 downto 0);
  signal ext_ucm2hps_bus_ar : ucm2hps_art(c_NUM_ACCEPTS-1 downto 0);



  
begin

  -- slc_file_ts <= in_slc_file_ts;

  open_csv: process
  begin
    wait until in_slc_file_ok;
    puts("opening UCM2HPS CSV file : " & g_OUT_FILE_1);
    csv_file_1.initialize(g_OUT_FILE_1,"wr");
    csv_file_1.write_string("# --------------------------");
    csv_file_1.write_string("# CSV files TS = " & in_files_str);
    -- csv_file_1.write_string("# HIT TS  : " & hit_file_ts);
    csv_file_1.write_string("# PRJ CFG = " & g_PRJ_INFO);
    csv_file_1.write_string("# SIM TS  = " & "2022.09.15_12:05:34");--time'image(now));
    csv_file_1.write_string("# --------------------------");
    -- muid
    csv_file_1.write_word("ToS[100ps]");
    csv_file_1.write_word("ToA[0.78125ns]");
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
    csv_file_1.write_word("vec_pos[1mm]");
    -- vec_ang
    csv_file_1.write_word("vec_ang[1mrad]");
    -- csv_file_1.write_word("vec_off[1mm]");
    csv_file_1.write_word("phimod[4mrad]");
    csv_file_1.writeline;
    ----------------------------------------------------------------------------
    puts("opening UCM2PL CSV file : " & g_OUT_FILE_2);
    csv_file_2.initialize(g_OUT_FILE_2,"wr");
    csv_file_2.write_string("# --------------------------");
    csv_file_2.write_string("# CSV files TS = " & in_files_str);
    -- csv_file_2.write_string("# HIT TS  : " & hit_file_ts);
    csv_file_2.write_string("# PRJ CFG = " & g_PRJ_INFO);
    csv_file_2.write_string("# SIM TS  = " & "2022.09.15_12:05:34");--time'image(now));
    csv_file_2.write_string("# --------------------------");   
    -- event
    csv_file_2.write_word("ToS[100ps]");
    csv_file_2.write_word("ToA[0.78125ns]");   
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
    csv_file_2.write_word("poseta[0.00024]"); 
    csv_file_2.write_word("posphi[15.63mrad]"); 
    csv_file_2.write_word("sl_pt[0.5GeV]"); 
    csv_file_2.write_word("sl_ptthresh[1GeV]"); 
    csv_file_2.write_word("sl_charge"); 
    csv_file_2.write_word("cointype"); 
    -- -- trailer
    -- csv_file_2.write_word("t_reserved"); 
    csv_file_2.write_word("crc"); 
    csv_file_2.write_word("fiberid"); 
    csv_file_2.write_word("slid"); 
    csv_file_2.write_word("comma"); 
    -- phimod
    csv_file_2.write_word("phimod[4mrad]");
    -- nsw
    csv_file_2.write_word("nswseg_angdtheta[1mrad]");
    csv_file_2.write_word("nswseg_posphi[20mrad]");
    csv_file_2.write_word("nswseg_poseta[0.0002]");
    csv_file_2.writeline;
    wait;
  end process open_csv;

  event_ucm2hps_pl : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    E_U2H_PL : entity vamc_lib.vamc_spl
    generic map(
      -- pragma translate_off
      g_SIMULATION => '1',
      -- pragma translate_on
      g_PIPELINE_TYPE => "ring_buffer",
      g_DELAY_CYCLES  => g_SLC_2_HPS_DELAY,
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

    th_loop : for i in c_NUM_ACCEPTS-1 downto 0 generate
      inn_ucm2hps_bus_ar(i) <= convert(inn_slc_to_h2s_av(i),inn_ucm2hps_bus_ar(i));
      mid_ucm2hps_bus_ar(i) <= convert(mid_slc_to_h2s_av(i),mid_ucm2hps_bus_ar(i));
      out_ucm2hps_bus_ar(i) <= convert(out_slc_to_h2s_av(i),out_ucm2hps_bus_ar(i));
      ext_ucm2hps_bus_ar(i) <= convert(ext_slc_to_h2s_av(i),ext_ucm2hps_bus_ar(i));
    end generate ; -- identifier


  UCM2HPS_OUT: process(clk, rst)
    -- variable first_write           : std_logic := '1';

    -- variable csv_file_1: csv_file_type;

    variable thread_counter : integer := 0;

  begin
    if rising_edge(clk) then
      if rst = '1' then
      else     
        if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
          thread_counter := 0;
          for th_i in c_NUM_ACCEPTS -1 downto 0 loop
            -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
            if inn_ucm2hps_bus_ar(th_i).data_valid = '1' then
              -- puts(" hello ",th_i);
              thread_counter := thread_counter +1;
              -- muid
              csv_file_1.write_integer(to_integer(tb_curr_sim_time));
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
              csv_file_1.write_integer(to_integer(signed(inn_ucm2hps_bus_ar(th_i).vec_pos)));
              -- vec_ang
              csv_file_1.write_integer(to_integer(signed(inn_ucm2hps_bus_ar(th_i).vec_ang)));
              csv_file_1.write_integer(to_integer(signed(inn_ucm2hps_bus_ar(th_i).phimod)));
              csv_file_1.writeline;

              if g_verbose > 1 then
                puts("OUT ## UCM2HPS_0 => " & integer'image(to_integer(tb_curr_sim_time)) &
                " : " & integer'image(to_integer(tb_curr_tdc_time)) &
                " : " & integer'image(0) &
                " : " & integer'image(to_integer(unsigned(inn_ucm2hps_bus_ar(th_i).mdtseg_dest))) &
                " : " & integer'image(th_i) &
                " : " & integer'image(0) &
                " : " & integer'image(to_integer(inn_ucm2hps_bus_ar(th_i).muid.slcid)) &
                " : " & integer'image(to_integer(inn_ucm2hps_bus_ar(th_i).muid.slid)) &
                " : " & integer'image(to_integer(inn_ucm2hps_bus_ar(th_i).muid.bcid)) &
                " : " & integer'image(to_integer(unsigned(inn_ucm2hps_bus_ar(th_i).mdtseg_dest))) &
                " : " & integer'image(to_integer(inn_ucm2hps_bus_ar(th_i).mdtid.chamber_id)) &
                " : " & integer'image(to_integer(inn_ucm2hps_bus_ar(th_i).mdtid.chamber_ieta)) &
                " : " & integer'image(to_integer(signed(inn_ucm2hps_bus_ar(th_i).vec_pos))) &
                " : " & integer'image(to_integer(signed(inn_ucm2hps_bus_ar(th_i).vec_ang))) &
                " : " & integer'image(to_integer(signed(inn_ucm2hps_bus_ar(th_i).phimod))));
              end if;
              
            end if;
          end loop;
        end if;

        if c_STATIONS_IN_SECTOR(1) = '1' then -- INN
          thread_counter := 0;
          for th_i in c_NUM_ACCEPTS -1 downto 0 loop
            -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
            if mid_ucm2hps_bus_ar(th_i).data_valid = '1' then
              -- puts(" hello ",th_i);
              thread_counter := thread_counter +1;

              -- muid
              csv_file_1.write_integer(to_integer(tb_curr_sim_time));
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
              csv_file_1.write_integer(to_integer(signed(mid_ucm2hps_bus_ar(th_i).vec_pos)));
              -- vec_ang
              csv_file_1.write_integer(to_integer(signed(mid_ucm2hps_bus_ar(th_i).vec_ang)));
              csv_file_1.write_integer(to_integer(signed(mid_ucm2hps_bus_ar(th_i).phimod)));
              csv_file_1.writeline;

              if g_verbose > 1 then
                puts("OUT ## UCM2HPS_1 => " & integer'image(to_integer(tb_curr_sim_time)) &
                " : " & integer'image(to_integer(tb_curr_tdc_time)) &
                " : " & integer'image(0) &
                " : " & integer'image(to_integer(unsigned(mid_ucm2hps_bus_ar(th_i).mdtseg_dest))) &
                " : " & integer'image(th_i) &
                " : " & integer'image(1) &
                " : " & integer'image(to_integer(mid_ucm2hps_bus_ar(th_i).muid.slcid)) &
                " : " & integer'image(to_integer(mid_ucm2hps_bus_ar(th_i).muid.slid)) &
                " : " & integer'image(to_integer(mid_ucm2hps_bus_ar(th_i).muid.bcid)) &
                " : " & integer'image(to_integer(unsigned(mid_ucm2hps_bus_ar(th_i).mdtseg_dest))) &
                " : " & integer'image(to_integer(mid_ucm2hps_bus_ar(th_i).mdtid.chamber_id)) &
                " : " & integer'image(to_integer(mid_ucm2hps_bus_ar(th_i).mdtid.chamber_ieta)) &
                " : " & integer'image(to_integer(signed(mid_ucm2hps_bus_ar(th_i).vec_pos))) &
                " : " & integer'image(to_integer(signed(mid_ucm2hps_bus_ar(th_i).vec_ang))) &
                " : " & integer'image(to_integer(signed(mid_ucm2hps_bus_ar(th_i).phimod))));
              end if;

            end if;
          end loop;
        end if;

        if c_STATIONS_IN_SECTOR(2) = '1' then -- INN
          thread_counter := 0;

          for th_i in c_NUM_ACCEPTS -1 downto 0 loop
            -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
            if out_ucm2hps_bus_ar(th_i).data_valid = '1' then
              -- puts(" hello ",th_i);
              thread_counter := thread_counter +1;

              -- muid
              csv_file_1.write_integer(to_integer(tb_curr_sim_time));
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
              csv_file_1.write_integer(unsigned(out_ucm2hps_bus_ar(th_i).mdtseg_dest));
              -- mdtid
              csv_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(th_i).mdtid.chamber_id));
              csv_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(th_i).mdtid.chamber_ieta));
              -- vec_pos
              csv_file_1.write_integer(signed(out_ucm2hps_bus_ar(th_i).vec_pos));
              -- vec_ang
              csv_file_1.write_integer(signed(out_ucm2hps_bus_ar(th_i).vec_ang));
              csv_file_1.write_integer(signed(out_ucm2hps_bus_ar(th_i).phimod));
              csv_file_1.writeline;

              if g_verbose > 1 then
                puts("OUT ## UCM2HPS_2 => " & integer'image(to_integer(tb_curr_sim_time)) &
                " : " & integer'image(to_integer(tb_curr_tdc_time)) &
                " : " & integer'image(0) &
                " : " & integer'image(to_integer(unsigned(out_ucm2hps_bus_ar(th_i).mdtseg_dest))) &
                " : " & integer'image(th_i) &
                " : " & integer'image(2) &
                " : " & integer'image(to_integer(out_ucm2hps_bus_ar(th_i).muid.slcid)) &
                " : " & integer'image(to_integer(out_ucm2hps_bus_ar(th_i).muid.slid)) &
                " : " & integer'image(to_integer(out_ucm2hps_bus_ar(th_i).muid.bcid)) &
                " : " & integer'image(to_integer(unsigned(out_ucm2hps_bus_ar(th_i).mdtseg_dest))) &
                " : " & integer'image(to_integer(out_ucm2hps_bus_ar(th_i).mdtid.chamber_id)) &
                " : " & integer'image(to_integer(out_ucm2hps_bus_ar(th_i).mdtid.chamber_ieta)) &
                " : " & integer'image(to_integer(signed(out_ucm2hps_bus_ar(th_i).vec_pos))) &
                " : " & integer'image(to_integer(signed(out_ucm2hps_bus_ar(th_i).vec_ang))) &
                " : " & integer'image(to_integer(signed(out_ucm2hps_bus_ar(th_i).phimod))));
              end if;

            end if;
          end loop;
        end if;

        if c_STATIONS_IN_SECTOR(3) = '1' then -- INN
          thread_counter := 0;

          for th_i in c_NUM_ACCEPTS -1 downto 0 loop
            -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
            if ext_ucm2hps_bus_ar(th_i).data_valid = '1' then
              -- puts(" hello ",th_i);
              thread_counter := thread_counter +1;

              -- muid
              csv_file_1.write_integer(to_integer(tb_curr_sim_time));
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
              csv_file_1.write_integer(to_integer(unsigned(ext_ucm2hps_bus_ar(th_i).vec_pos)));
              -- vec_ang
              csv_file_1.write_integer(to_integer(signed(ext_ucm2hps_bus_ar(th_i).vec_ang)));
              csv_file_1.write_integer(to_integer(signed(ext_ucm2hps_bus_ar(th_i).phimod)));
              csv_file_1.writeline;

              if g_verbose > 1 then
                puts("OUT ## UCM2HPS_3 => " & integer'image(to_integer(tb_curr_sim_time)) &
                " : " & integer'image(to_integer(tb_curr_tdc_time)) &
                " : " & integer'image(0) &
                " : " & integer'image(to_integer(unsigned(ext_ucm2hps_bus_ar(th_i).mdtseg_dest))) &
                " : " & integer'image(th_i) &
                " : " & integer'image(3) &
                " : " & integer'image(to_integer(ext_ucm2hps_bus_ar(th_i).muid.slcid)) &
                " : " & integer'image(to_integer(ext_ucm2hps_bus_ar(th_i).muid.slid)) &
                " : " & integer'image(to_integer(ext_ucm2hps_bus_ar(th_i).muid.bcid)) &
                " : " & integer'image(to_integer(unsigned(ext_ucm2hps_bus_ar(th_i).mdtseg_dest))) &
                " : " & integer'image(to_integer(ext_ucm2hps_bus_ar(th_i).mdtid.chamber_id)) &
                " : " & integer'image(to_integer(ext_ucm2hps_bus_ar(th_i).mdtid.chamber_ieta)) &
                " : " & integer'image(to_integer(signed(ext_ucm2hps_bus_ar(th_i).vec_pos))) &
                " : " & integer'image(to_integer(signed(ext_ucm2hps_bus_ar(th_i).vec_ang))) &
                " : " & integer'image(to_integer(signed(ext_ucm2hps_bus_ar(th_i).phimod))));
              end if;

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
      g_DELAY_CYCLES  => g_SLC_2_MPL_DELAY,
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
    variable common : slc_common_rt;
  begin
    if rising_edge(clk) then
      if rst = '1' then
      else
        for sl_i in c_MAX_NUM_SL -1 downto 0 loop
          if ucm2pl_ar(sl_i).data_valid = '1' then
            -- event
            csv_file_2.write_integer(to_integer(tb_curr_sim_time));
            csv_file_2.write_integer(to_integer(tb_curr_tdc_time));
            csv_file_2.write_integer(unsigned(slc_event_u2m_au(sl_i)));          
            csv_file_2.write_integer(sl_i);                  
            -- 
            csv_file_2.write_bool(ucm2pl_ar(sl_i).busy);
            csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).process_ch));
            -- common
            -- -- header
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

            if g_verbose > 1 then
              puts("OUT ## UCM2CPL => " &   
              " : " & integer'image(to_integer(tb_curr_sim_time)) &
              " : " & integer'image(to_integer(tb_curr_tdc_time)) &
              " : " & integer'image(to_integer(unsigned(slc_event_u2m_au(sl_i)))) &
              " : " & integer'image(sl_i) &
              " : " & std_logic'image(ucm2pl_ar(sl_i).busy) &
              " : " & integer'image(to_integer(unsigned(ucm2pl_ar(sl_i).process_ch))) &
              " : " & std_logic'image(ucm2pl_ar(sl_i).common.header.tcoverflow) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.header.nmtc_sl)) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.header.nmtc_mdt)) & 
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.header.nslc)) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.header.bcid)) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.slcid)) &
              " : " & std_logic'image(ucm2pl_ar(sl_i).common.tcsent) & 
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.poseta)) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.posphi)) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.sl_pt)) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.sl_ptthresh)) &
              " : " & std_logic'image(ucm2pl_ar(sl_i).common.sl_charge) &
              " : " & integer'image(to_integer(unsigned(ucm2pl_ar(sl_i).common.cointype))) &
              " : " & integer'image(to_integer(unsigned(ucm2pl_ar(sl_i).common.trailer.crc))) & 
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.trailer.fiberid)) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).common.trailer.slid)) &
              " : " & integer'image(to_integer(unsigned(ucm2pl_ar(sl_i).common.trailer.comma))) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).phimod)) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).nswseg_angdtheta)) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).nswseg_posphi)) &
              " : " & integer'image(to_integer(ucm2pl_ar(sl_i).nswseg_poseta)));
            end if;

          end if;
        end loop;
      end if;
    end if;
  end process UCM2MPL_OUT;
  
end sim;


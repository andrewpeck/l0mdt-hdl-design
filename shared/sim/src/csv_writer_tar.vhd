--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: csv_writer_tar.vhd
-- Module: <<moduleName>>
-- File PATH: /shared/sim/src/csv_writer_tar.vhd
-- -----
-- File Created: Wednesday, 3rd August 2022 11:31:20 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 3rd August 2022 6:36:13 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2022-08-03	GLdL	Creation
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
use shared_lib.l0mdt_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;

use shared_lib.tar_sim_pkg.all;

library vamc_lib;

-- library heg_lib;
-- use heg_lib.heg_pkg.all;
-- library hps_lib;
-- use hps_lib.hps_pkg.all;

entity csv_writer_tar is
  generic(
    g_PRJ_INFO            : string  := "A3B";
    g_IN_SLC_FILE         : string  := "not_defined.csv";
    g_IN_HIT_FILE         : string  := "not_defined.csv";
    g_IN_L0_FILE          : string  := "not_defined.csv";
    -- g_OUT_FILE            : string  := "ov_ucm2hps_A3B.csv"
    -- OUT_HEG_BM_SLC_FILE : string  := "hps_heg_bm_slc_A3_Barrel_yt_v04.csv";
    -- OUT_HEG_BM_HIT_FILE : string  := "hps_heg_bm_hit_A3_Barrel_yt_v04.csv"
    g_HPS_MAX_HP : integer := 6
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    enable                : in integer;
    --
    tb_curr_tdc_time      : in unsigned(63 downto 0);
    --
    -- TDC polmux from Tar
    o_tdc_hits_av         : in tdcpolmux2tar_avt(g_HPS_MAX_HP -1 downto 0);
    -- TDC Hits from Tar
    o_tar_hits_av         : in tar2hps_avt(g_HPS_MAX_HP -1 downto 0)

  );
end entity csv_writer_tar;

architecture sim of csv_writer_tar is

  -- -- alias hit_file_ok is  << signal.ult_tp.MDT.file_open : std_logic >>;
  -- -- alias hit_file_ts is  << signal.ult_tp.MDT.file_ts : string >>;

  constant g_OUT_FILE_1     : string  := "ov_tar2hps_" & g_PRJ_INFO & ".csv";
  constant g_OUT_FILE_2     : string  := "ov_tar2daq_" & g_PRJ_INFO & ".csv";
     
  shared variable tar_file_1: tar_file_type;
  shared variable tar_file_2: tar_file_type;

  -- -- alias slc_event_ai is  << signal.ult_tp.SLC.slc_event_ai : event_aut >>;

  -- -- alias inn_slc_to_h2s_av is  << signal.ult_tp.ULT.inn_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- -- alias mid_slc_to_h2s_av is  << signal.ult_tp.ULT.mid_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- -- alias out_slc_to_h2s_av is  << signal.ult_tp.ULT.out_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- -- alias ext_slc_to_h2s_av is  << signal.ult_tp.ULT.ext_slc_to_h2s_plin_av : ucm2hps_avt >>;

  -- -- alias ucm2pl_av is  << signal.ult_tp.ULT.ucm2pl_av : ucm2pl_avt >>;
  -- signal ucm2pl_ar : ucm2pl_art(g_HPS_MAX_HP-1 downto 0);

  signal mdt_event_u2m_au        : event_at(g_HPS_MAX_HP -1 downto 0);
  signal mdt_event_u2h_au        : event_at(g_HPS_MAX_HP -1 downto 0);

    -- TDC polmux from Tar
  signal tdc_hits_ar : tdcpolmux2tar_art(g_HPS_MAX_HP -1 downto 0);
    -- TDC Hits from Tar
  signal tar_hits_ar :tar2hps_art(g_HPS_MAX_HP -1 downto 0)



  
begin

  -- -- slc_file_ts <= in_mdt_file_ts;

  open_csv: process
  begin
    wait until in_mdt_file_ok;
    puts("opening TAR2HPS CSV file : " & g_OUT_FILE_1);
    tar_file_1.initialize(g_OUT_FILE_1,"wr");
    tar_file_1.write_string("# --------------------------");
    tar_file_1.write_string("# HIT TS  : " & in_mdt_file_ts);
    -- tar_file_1.write_string("# HIT TS  : " & hit_file_ts);
    tar_file_1.write_string("# PRJ CFG : " & g_PRJ_INFO);
    tar_file_1.write_string("# SIM TS  : " & time'image(now));
    tar_file_1.write_string("# --------------------------");   
    puts("opening TAR2DAQ CSV file : " & g_OUT_FILE_2);
    csv_file_2.initialize(g_OUT_FILE_2,"wr");
    csv_file_2.write_string("# --------------------------");
    csv_file_2.write_string("# HIT TS  : " & in_mdt_file_ts);
    -- csv_file_2.write_string("# HIT TS  : " & hit_file_ts);
    csv_file_2.write_string("# PRJ CFG : " & g_PRJ_INFO);
    csv_file_2.write_string("# SIM TS  : " & time'image(now));
    csv_file_2.write_string("# --------------------------");    
    wait;
  end process open_csv;

  -- event_ucm2hps_pl : for sl_i in g_HPS_MAX_HP -1 downto 0 generate
  --   E_U2H_PL : entity vamc_lib.vamc_spl
  --   generic map(
  --     -- pragma translate_off
  --     g_SIMULATION => '1',
  --     -- pragma translate_on
  --     g_PIPELINE_TYPE => "ring_buffer",
  --     g_DELAY_CYCLES  => 131,
  --     g_PIPELINE_WIDTH    => 32
  --   )
  --   port map(
  --     clk         => clk,
  --     rst         => rst,
  --     ena         => '1',
  --     --
  --     i_data      => std_logic_vector(slc_event_ai(sl_i)),
  --     o_data      => mdt_event_u2h_au(sl_i)
  --   );
  -- end generate;

  --   th_loop : for i in c_NUM_THREADS-1 downto 0 generate
  --     tar_hits_ar(i) <= convert(inn_slc_to_h2s_av(i),tar_hits_ar(i));
  --     mid_ucm2hps_bus_ar(i) <= convert(mid_slc_to_h2s_av(i),mid_ucm2hps_bus_ar(i));
  --     out_ucm2hps_bus_ar(i) <= convert(out_slc_to_h2s_av(i),out_ucm2hps_bus_ar(i));
  --     ext_ucm2hps_bus_ar(i) <= convert(ext_slc_to_h2s_av(i),ext_ucm2hps_bus_ar(i));
  --   end generate ; -- identifier


  TAR2HPS : process(clk, rst)
    variable first_write           : std_logic := '1';

    -- variable tar_file_1: tar_file_type;

    variable thread_counter : integer := 0;

  begin
    if rising_edge(clk) then
      if first_write = '1' then
        -- wait until not slc_file_ok and not hit_file_ok;
        -- puts("opening UCM2HPS CSV file : " & g_OUT_FILE_1);
        -- tar_file_1.initialize(g_OUT_FILE_1,"wr");
        -- tar_file_1.write_string("# --------------------------");
        -- tar_file_1.write_word("#");
        -- tar_file_1.write_string("#");
        -- tar_file_1.write_string("# --------------------------");         
        -- sim
        tar_file_1.write_word("ToA");
        tar_file_1.write_word("event");          
        tar_file_1.write_word("hit_id");                 
        tar_file_1.write_word("station");          
        tar_file_1.write_word("hp#");          
        -- tdc
        tar_file_1.write_word("ieta");
        tar_file_1.write_word("layer");
        tar_file_1.write_word("tube");
        tar_file_1.write_word("time");

        tar_file_1.writeline;
        first_write := '0';
      end if;
      if rst = '1' then
      else     
        if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
  --         thread_counter := 0;
          for hp_i in g_HPS_MAX_HP -1 downto 0 loop
  --           -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
            if tar_hits_ar(hp_i).data_valid = '1' then
              -- puts(" hello ",hp_i);
              -- thread_counter := thread_counter +1;
              -- muid
              tar_file_1.write_integer(to_integer(tb_curr_tdc_time));
              -- tar_file_1.write_word("event");          
              -- tar_file_1.write_integer(unsigned(mdt_event_u2h_au(g_HPS_MAX_HP - thread_counter)));                   
              tar_file_1.write_word("0");   -- event
              tar_file_1.write_word("0");   -- hit_id
              tar_file_1.write_integer(hp_i);        
              -- muid
              tar_file_1.write_integer(to_integer(tar_hits_ar(hp_i).muid.slcid));
              tar_file_1.write_integer(to_integer(tar_hits_ar(hp_i).muid.slid));
              tar_file_1.write_integer(to_integer(tar_hits_ar(hp_i).muid.bcid));
              -- mdtseg_Dest
              tar_file_1.write_integer(to_integer(unsigned(tar_hits_ar(hp_i).mdtseg_dest)));
              -- mdtid
              tar_file_1.write_integer(to_integer(tar_hits_ar(hp_i).mdtid.chamber_id));
              tar_file_1.write_integer(to_integer(tar_hits_ar(hp_i).mdtid.chamber_ieta));
              -- vec_pos
              tar_file_1.write_integer(to_integer(tar_hits_ar(hp_i).vec_pos));
              -- vec_ang
              tar_file_1.write_integer(to_integer(tar_hits_ar(hp_i).vec_ang));
              tar_file_1.writeline;

            end if;
          end loop;
        end if;

  --       if c_STATIONS_IN_SECTOR(1) = '1' then -- INN
  --         thread_counter := 0;
  --         for hp_i in c_NUM_THREADS -1 downto 0 loop
  --           -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
  --           if mid_ucm2hps_bus_ar(hp_i).data_valid = '1' then
  --             -- puts(" hello ",hp_i);
  --             thread_counter := thread_counter +1;

  --             -- muid
  --             tar_file_1.write_integer(to_integer(tb_curr_tdc_time));
  --             -- tar_file_1.write_word("event");          
  --             tar_file_1.write_integer(unsigned(mdt_event_u2h_au(g_HPS_MAX_HP - thread_counter)));          

  --             tar_file_1.write_integer(hp_i);          
  --             tar_file_1.write_word("1");          
  --             -- muid
  --             tar_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(hp_i).muid.slcid));
  --             tar_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(hp_i).muid.slid));
  --             tar_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(hp_i).muid.bcid));
  --             -- mdtseg_Dest
  --             tar_file_1.write_integer(to_integer(unsigned(mid_ucm2hps_bus_ar(hp_i).mdtseg_dest)));
  --             -- mdtid
  --             tar_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(hp_i).mdtid.chamber_id));
  --             tar_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(hp_i).mdtid.chamber_ieta));
  --             -- vec_pos
  --             tar_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(hp_i).vec_pos));
  --             -- vec_ang
  --             tar_file_1.write_integer(to_integer(mid_ucm2hps_bus_ar(hp_i).vec_ang));
  --             tar_file_1.writeline;

  --           end if;
  --         end loop;
  --       end if;

  --       if c_STATIONS_IN_SECTOR(2) = '1' then -- INN
  --         thread_counter := 0;

  --         for hp_i in c_NUM_THREADS -1 downto 0 loop
  --           -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
  --           if out_ucm2hps_bus_ar(hp_i).data_valid = '1' then
  --             -- puts(" hello ",hp_i);
  --             thread_counter := thread_counter +1;

  --             -- muid
  --             tar_file_1.write_integer(to_integer(tb_curr_tdc_time));
  --             -- tar_file_1.write_word("event");    
  --             tar_file_1.write_integer(unsigned(mdt_event_u2h_au(g_HPS_MAX_HP - thread_counter)));          
  --             tar_file_1.write_integer(hp_i);          
  --             tar_file_1.write_word("2");          
  --             -- muid
  --             tar_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(hp_i).muid.slcid));
  --             tar_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(hp_i).muid.slid));
  --             tar_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(hp_i).muid.bcid));
  --             -- mdtseg_Dest
  --             tar_file_1.write_integer(to_integer(unsigned(out_ucm2hps_bus_ar(hp_i).mdtseg_dest)));
  --             -- mdtid
  --             tar_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(hp_i).mdtid.chamber_id));
  --             tar_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(hp_i).mdtid.chamber_ieta));
  --             -- vec_pos
  --             tar_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(hp_i).vec_pos));
  --             -- vec_ang
  --             tar_file_1.write_integer(to_integer(out_ucm2hps_bus_ar(hp_i).vec_ang));
  --             tar_file_1.writeline;

  --           end if;
  --         end loop;
  --       end if;

  --       if c_STATIONS_IN_SECTOR(3) = '1' then -- INN
  --         thread_counter := 0;

  --         for hp_i in c_NUM_THREADS -1 downto 0 loop
  --           -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
  --           if ext_ucm2hps_bus_ar(hp_i).data_valid = '1' then
  --             -- puts(" hello ",hp_i);
  --             thread_counter := thread_counter +1;

  --             -- muid
  --             tar_file_1.write_integer(to_integer(tb_curr_tdc_time));
  --             -- tar_file_1.write_word("event");          
  --             tar_file_1.write_integer(unsigned(mdt_event_u2h_au(g_HPS_MAX_HP - thread_counter)));          

  --             tar_file_1.write_integer(hp_i);          
  --             tar_file_1.write_word("3");          
  --             -- muid
  --             tar_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(hp_i).muid.slcid));
  --             tar_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(hp_i).muid.slid));
  --             tar_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(hp_i).muid.bcid));
  --             -- mdtseg_Dest
  --             tar_file_1.write_integer(to_integer(unsigned(ext_ucm2hps_bus_ar(hp_i).mdtseg_dest)));
  --             -- mdtid
  --             tar_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(hp_i).mdtid.chamber_id));
  --             tar_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(hp_i).mdtid.chamber_ieta));
  --             -- vec_pos
  --             tar_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(hp_i).vec_pos));
  --             -- vec_ang
  --             tar_file_1.write_integer(to_integer(ext_ucm2hps_bus_ar(hp_i).vec_ang));
  --             tar_file_1.writeline;

  --           end if;
  --         end loop;
  --       end if;
      end if;
    end if;
  end process TAR2HPS ;
  
  -- event_ucm2mpl_pl : for sl_i in g_HPS_MAX_HP -1 downto 0 generate
  --   E_U2M_PL : entity vamc_lib.vamc_spl
  --   generic map(
  --     -- pragma translate_off
  --     g_SIMULATION => '1',
  --     -- pragma translate_on
  --     g_PIPELINE_TYPE => "ring_buffer",
  --     g_DELAY_CYCLES  => 10,
  --     g_PIPELINE_WIDTH    => 32
  --   )
  --   port map(
  --     clk         => clk,
  --     rst         => rst,
  --     ena         => '1',
  --     --
  --     i_data      => std_logic_vector(slc_event_ai(sl_i)),
  --     o_data      => mdt_event_u2m_au(sl_i)
  --   );
  -- end generate;

  -- sl_loop : for i in g_HPS_MAX_HP - 1 downto 0 generate
  --   ucm2pl_ar(i) <= convert(ucm2pl_av(i),ucm2pl_ar(i));
  -- end generate ; -- sl_loop

  -- UCM2MPL_OUT: process(clk, rst)

  --   variable first_write           : std_logic := '1';

  --   -- variable csv_file_2: tar_file_type;

  --   variable common : slc_common_rt;

  -- begin
  --   if rising_edge(clk) then
  --     if first_write = '1' then
  --       -- puts("opening UCM2PL CSV file : " & g_OUT_FILE_2);
  --       -- csv_file_2.initialize(g_OUT_FILE_2,"wr");
  --       -- csv_file_2.write_string("# --------------------------");
  --       -- csv_file_2.write_string("#");
  --       -- csv_file_2.write_string("#");
  --       -- csv_file_2.write_string("# --------------------------");         
  --       -- event
  --       csv_file_2.write_word("ToA");
  --       csv_file_2.write_word("event");          
  --       csv_file_2.write_word("sl_pos");                   
  --       -- multi-thread
  --       csv_file_2.write_word("busy");
  --       csv_file_2.write_word("process_ch");
  --       -- common
  --       -- -- header
  --       -- csv_file_2.write_word("h_reserved"); 
  --       csv_file_2.write_word("tcoverflow"); 
  --       csv_file_2.write_word("nmtc_sl"); 
  --       csv_file_2.write_word("nmtc_mdt"); 
  --       csv_file_2.write_word("nslc"); 
  --       csv_file_2.write_word("bcid"); 
  --       -- --
  --       csv_file_2.write_word("slcid"); 
  --       csv_file_2.write_word("tcsent"); 
  --       csv_file_2.write_word("poseta"); 
  --       csv_file_2.write_word("posphi"); 
  --       csv_file_2.write_word("sl_pt"); 
  --       csv_file_2.write_word("sl_ptthresh"); 
  --       csv_file_2.write_word("sl_charge"); 
  --       csv_file_2.write_word("cointype"); 
  --       -- -- trailer
  --       -- csv_file_2.write_word("t_reserved"); 
  --       csv_file_2.write_word("crc"); 
  --       csv_file_2.write_word("fiberid"); 
  --       csv_file_2.write_word("slid"); 
  --       csv_file_2.write_word("comma"); 
  --       -- phimod
  --       csv_file_2.write_word("phimod");
  --       -- nsw
  --       csv_file_2.write_word("nswseg_angdtheta");
  --       csv_file_2.write_word("nswseg_posphi");
  --       csv_file_2.write_word("nswseg_poseta");
  --       csv_file_2.writeline;
  --       first_write := '0';
  --     end if;
  --     if rst = '1' then
  --     else
  --       for sl_i in g_HPS_MAX_HP -1 downto 0 loop
  --         -- read_slc := convert(heg2sf_inn_slc_av(heg_i));
  --         if ucm2pl_ar(sl_i).data_valid = '1' then
  --           -- common := convert(ucm2pl_ar(sl_i).common);

  --           -- event
  --           csv_file_2.write_integer(to_integer(tb_curr_tdc_time));
  --           csv_file_2.write_integer(unsigned(mdt_event_u2m_au(sl_i)));          
  --           csv_file_2.write_integer(sl_i);                  
  --           -- 
  --           csv_file_2.write_bool(ucm2pl_ar(sl_i).busy);
  --           csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).process_ch));
  --           -- common
  --           -- -- header
  --           -- csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).common.header.h_reserved)); 
  --           csv_file_2.write_bool(ucm2pl_ar(sl_i).common.header.tcoverflow); 
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.header.nmtc_sl); 
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.header.nmtc_mdt); 
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.header.nslc); 
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.header.bcid); 
  --           -- -- --
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.slcid); 
  --           csv_file_2.write_bool(ucm2pl_ar(sl_i).common.tcsent); 
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.poseta); 
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.posphi); 
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.sl_pt); 
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.sl_ptthresh); 
  --           csv_file_2.write_bool(ucm2pl_ar(sl_i).common.sl_charge); 
  --           csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).common.cointype)); 
  --           -- -- -- trailer
  --           -- csv_file_2.write_integer(ucm2pl_ar(sl_i).common.trailer.t_reserved); 
  --           csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).common.trailer.crc)); 
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.trailer.fiberid); 
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).common.trailer.slid); 
  --           csv_file_2.write_integer(unsigned(ucm2pl_ar(sl_i).common.trailer.comma)); 
  --           -- --
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).phimod);
  --           -- --nsw
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).nswseg_angdtheta);
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).nswseg_posphi);
  --           csv_file_2.write_integer(ucm2pl_ar(sl_i).nswseg_poseta);



  --           csv_file_2.writeline;

  --         end if;
  --       end loop;
  --     end if;
  --   end if;
  -- end process UCM2MPL_OUT;
  
  
end architecture sim;
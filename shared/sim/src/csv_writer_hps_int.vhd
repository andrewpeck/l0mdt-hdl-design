--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: csv_writer_hps_int.vhd
-- Module: <<moduleName>>
-- File PATH: /csv_writer_hps_int.vhd
-- -----
-- File Created: Tuesday, 27th September 2022 6:54:22 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 27th September 2022 7:06:13 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2022-09-30	GLdL	Added PC only output
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
  use shared_lib.vhdl_tb_utils_pkg.all;
  use shared_lib.l0mdt_sim_cstm_pkg.all;
  use shared_lib.vhdl_textio_csv_pkg.all;

-- use shared_lib.tar_sim_pkg.all;

library vamc_lib;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

entity csv_writer_hps_int is
  generic(
    g_PRJ_INFO              : string  := "not_defined";
    g_OUT_CSV_HPS_PC        : std_logic := '1';
    g_OUT_CSV_HPS_HIT       : std_logic := '1';
    g_OUT_CSV_HPS_SLC       : std_logic := '1';
    g_ST_ENABLE             : std_logic_vector(3 downto 0) := (others => '0')
  );
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    enable                  : in std_logic;
    --
    tb_curr_sim_time        : in unsigned(63 downto 0);
    tb_curr_tdc_time        : in unsigned(63 downto 0);
    --
    i_ucm2hps_file_ok       : in std_logic;
    i_ucm2hps_file_ts       : in string(1 to LINE_LENGTH_MAX);
    i_tar2hps_file_ok       : in std_logic;
    i_tar2hps_file_ts       : in string(1 to LINE_LENGTH_MAX);
    --
    i_ucm2hps_slc_event_au  : in event_xaut(c_NUM_THREADS -1 downto 0);
    i_tar2hps_mdt_event_au  : in event_tdc_aut;
    i_tar2hps_slc_event_au  : in event_tdc_aut
  );
end entity csv_writer_hps_int;

architecture sim of csv_writer_hps_int is
  type hps_pc2heg_aavt is array (c_MAX_NUM_ST -1 downto 0) of heg_pc2heg_avt(c_TOTAL_MAX_NUM_HP-1 downto 0);
  type heg_hp2bm_aavt is array (c_NUM_THREADS -1 downto 0) of heg_hp2bm_avt(c_TOTAL_MAX_NUM_HP-1 downto 0);
  type heg_hp2bm_aaavt is array (c_MAX_NUM_ST -1 downto 0) of heg_hp2bm_aavt;
  type hps_pc2heg_aart is array (c_MAX_NUM_ST -1 downto 0) of heg_pc2heg_art(c_TOTAL_MAX_NUM_HP-1 downto 0);
  type heg_hp2bm_aart is array (c_NUM_THREADS -1 downto 0) of heg_hp2bm_art(c_TOTAL_MAX_NUM_HP-1 downto 0);
  type heg_hp2bm_aaart is array (c_MAX_NUM_ST -1 downto 0) of heg_hp2bm_aart;

  signal in_files_ok : std_logic := '0';
  signal in_files_ts : string(1 to LINE_LENGTH_MAX);

begin
  in_files_ok <= i_ucm2hps_file_ok and i_tar2hps_file_ok;
  in_files_ts(1 to 15)  <= "not working yet";
  ----------------------------------------------------------------
  --
  ----------------------------------------------------------------
  OUT_CSV_HIT_EN: if g_OUT_CSV_HPS_HIT = '1' generate
    constant OUT_FILE_1     : string  := "ov_" & g_PRJ_INFO & "_hps_int_hits.csv";
    shared variable csv_file_1: csv_file_type;
    signal hps_pc_mdt_full_data_aav : hps_pc2heg_aavt;
    signal hps_heg_hp2bm_aaav : heg_hp2bm_aaavt;
    signal hps_pc_mdt_full_data_aar : hps_pc2heg_aart;
    signal hps_heg_hp2bm_aaar : heg_hp2bm_aaart;
    signal tar2hps_slc_event_au : event_tdc_aut;
    signal tar2hps_slc_event_a : event_tdc_at;
    signal tar2hps_mdt_event_au : event_tdc_aut;
    signal tar2hps_mdt_event_a : event_tdc_at;
  begin
    open_csv: process
    begin
      wait until in_files_ok;
      -- in_files_ts <= str_concat(in_files_ts,i_ucm2hps_file_ts,i_tar2hps_file_ts);
      puts("opening HPS INTERNALS HITs CSV file : " & OUT_FILE_1);
      csv_file_1.initialize(OUT_FILE_1,"wr");
      csv_file_1.write_string("# --------------------------");
      csv_file_1.write_string("# CSV files TS = " & in_files_ts);
      -- csv_file_1.write_string("# HIT TS  : " & hit_file_ts);
      csv_file_1.write_string("# PRJ CFG = " & g_PRJ_INFO);
      csv_file_1.write_string("# SIM TS  = " & "2022.09.15_12:05:34");--time'image(now));
      csv_file_1.write_string("# --------------------------");   
      --
      csv_file_1.write_word("ToS[100ps]");
      csv_file_1.write_word("ToA[781.25ps]");
      csv_file_1.write_word("event");          
      csv_file_1.write_word("muonFixedId");                 
      csv_file_1.write_word("station");          
      csv_file_1.write_word("thread");          
      csv_file_1.write_word("hp#");          
      -- HPS_PC
      csv_file_1.write_word("PC_dv");
      csv_file_1.write_word("PC_layer");
      csv_file_1.write_word("PC_tube");
      csv_file_1.write_word("PC_time_t0[781.25ps]");
      csv_file_1.write_word("PC_global_z[31.25um]");
      csv_file_1.write_word("PC_global_x[31.25um]");
      -- HEG_BMIN
      csv_file_1.write_word("HP2BM_dv");
      csv_file_1.write_word("HP2BM_mdt_valid");
      csv_file_1.write_word("HP2BM_local_y[31.25um]");
      csv_file_1.write_word("HP2BM_local_x[31.25um]");
      csv_file_1.write_word("HP2BM_radius[31.25um]");
      csv_file_1.write_word("HP2BM_mlayer");
      csv_file_1.writeline;
      wait;
    end process open_csv;
  
    SNIFFER_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
      ST_EN: if g_ST_ENABLE(st_i) = '1' generate
        alias temp_mdt_full_data_av is << signal.hps_tb.STATION_GEN(st_i).HPS.HPS.mdt_full_data_av : heg_pc2heg_avt(c_HP_NUM_SECTOR_STATION(st_i)-1 downto 0) >>;
      begin
        HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
          C_PL : entity vamc_lib.vamc_spl
            generic map(
              -- pragma translate_off
              g_SIMULATION => '1',
              -- pragma translate_on
              -- g_PIPELINE_TYPE => "ring_buffer",
              g_DELAY_CYCLES  => 2,
              g_PIPELINE_WIDTH    => heg_pc2heg_vt'w
            )
            port map(
              clk         => clk,
              rst         => rst,
              ena         => '1',
              --
              i_data      => temp_mdt_full_data_av(hp_i),
              o_data      => hps_pc_mdt_full_data_aav(st_i)(hp_i)
          );
        end generate HP_GEN;
        TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
          alias temp_hp2bm_av is << signal.hps_tb.STATION_GEN(st_i).HPS.HPS.heg_gen(th_i).HEG.hp2bm_av : heg_hp2bm_avt(c_HP_NUM_SECTOR_STATION(st_i)-1 downto 0) >>;
        begin
          HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
            hps_heg_hp2bm_aaav(st_i)(th_i)(hp_i) <= temp_hp2bm_av(hp_i);
          end generate HP_GEN;
        end generate;
      else generate
        hps_pc_mdt_full_data_aav(st_i) <= (others => (others => '0'));
        hps_heg_hp2bm_aaav(st_i) <= (others => (others => (others => '0')));
      end generate;
    end generate;
  
    CONV_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
      ST_EN: if g_ST_ENABLE(st_i) = '1' generate
        TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
          HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
            hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i) <= convert(hps_heg_hp2bm_aaav(st_i)(th_i)(hp_i),hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i));
          end generate HP_GEN;
        end generate;
        HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
          hps_pc_mdt_full_data_aar(st_i)(hp_i) <= convert(hps_pc_mdt_full_data_aav(st_i)(hp_i),hps_pc_mdt_full_data_aar(st_i)(hp_i));
        --
        t2h_slc_e_PL : entity vamc_lib.vamc_spl
          generic map(
            -- pragma translate_off
            g_SIMULATION => '1',
            -- pragma translate_on
            -- g_PIPELINE_TYPE => "ring_buffer",
            g_DELAY_CYCLES  => 5,
            g_PIPELINE_WIDTH    => 32
          )
          port map(
            clk         => clk,
            rst         => rst,
            ena         => '1',
            --
            i_data      => std_logic_vector(i_tar2hps_slc_event_au(st_i)(hp_i)),
            o_data      => tar2hps_slc_event_a(st_i)(hp_i)
        );
        tar2hps_slc_event_au(st_i)(hp_i) <= unsigned(tar2hps_slc_event_a(st_i)(hp_i));
        t2h_hit_e_PL : entity vamc_lib.vamc_spl
        generic map(
          -- pragma translate_off
          g_SIMULATION => '1',
          -- pragma translate_on
          -- g_PIPELINE_TYPE => "ring_buffer",
          g_DELAY_CYCLES  => 5,
          g_PIPELINE_WIDTH    => 32
        )
        port map(
          clk         => clk,
          rst         => rst,
          ena         => '1',
          --
          i_data      => std_logic_vector(i_tar2hps_mdt_event_au(st_i)(hp_i)),
          o_data      => tar2hps_mdt_event_a(st_i)(hp_i)
      );
      tar2hps_mdt_event_au(st_i)(hp_i) <= unsigned(tar2hps_mdt_event_a(st_i)(hp_i));
        end generate HP_GEN;
      end generate;
    end generate;
  
    HIT_CSV_WR: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
        else
          for st_i in 0 to c_MAX_NUM_ST - 1 loop
            for th_i in 0 to c_NUM_THREADS-1 loop
              for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 loop
                if hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data_valid = '1' or hps_pc_mdt_full_data_aar(st_i)(hp_i).data_valid = '1' then
                  csv_file_1.write_integer(to_integer(tb_curr_sim_time)); -- ToS                 
                  csv_file_1.write_integer(to_integer(tb_curr_tdc_time)); -- ToA                 
                  csv_file_1.write_integer(to_integer(tar2hps_slc_event_au(st_i)(hp_i)));--to_integer(unsigned(tar2hps_slc_event_a(pc_st_id)(pm_i))));   -- event
                  csv_file_1.write_integer(to_integer(tar2hps_mdt_event_au(st_i)(hp_i)));--to_integer(unsigned(tar2hps_mdt_event_a(pc_st_id)(pm_i))));   -- hit_id
                  csv_file_1.write_integer(st_i);   -- station
                  csv_file_1.write_integer(th_i);     -- hp_position   
                  csv_file_1.write_integer(hp_i);     -- hp_position   
                  -- HPS_PC
                  csv_file_1.write_bool(hps_pc_mdt_full_data_aar(st_i)(hp_i).data_valid);
                  csv_file_1.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).layer));
                  csv_file_1.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).tube));
                  csv_file_1.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).time_t0));
                  csv_file_1.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).global_z));
                  csv_file_1.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).global_x));
                  -- HEG_BMIN
                  csv_file_1.write_bool(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data_valid);
                  csv_file_1.write_bool(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).mdt_valid);
                  csv_file_1.write_integer(to_integer(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data.local_y));
                  csv_file_1.write_integer(to_integer(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data.local_x));
                  csv_file_1.write_integer(to_integer(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data.radius));
                  csv_file_1.write_bool(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data.mlayer);
                  csv_file_1.writeline;
                end if;
              end loop;
            end loop;
          end loop;
        end if;
      end if;
    end process;  
  
  end generate;
  ----------------------------------------------------------------
  --
  ----------------------------------------------------------------
  OUT_CSV_SLC_EN: if g_OUT_CSV_HPS_SLC = '1' generate
    constant OUT_FILE_2     : string  := "ov_" & g_PRJ_INFO & "_hps_int_slcs.csv";
    shared variable csv_file_2: csv_file_type;
  begin
    -- open_csv: process
    -- begin
    --   wait until in_files_ok;
    --   -- in_files_ts <= str_concat(in_files_ts,i_ucm2hps_file_ts,i_tar2hps_file_ts);
    --   puts("opening HPS INTERNALS SLCs CSV file : " & OUT_FILE_2);
    --   csv_file_2.initialize(OUT_FILE_2,"wr");
    --   csv_file_2.write_string("# --------------------------");
    --   csv_file_2.write_string("# CSV files TS = " & in_files_ts);
    --   -- csv_file_2.write_string("# HIT TS  : " & hit_file_ts);
    --   csv_file_2.write_string("# PRJ CFG = " & g_PRJ_INFO);
    --   csv_file_2.write_string("# SIM TS  = " & "2022.09.15_12:05:34");--time'image(now));
    --   csv_file_2.write_string("# --------------------------");   
    --   --
    --   csv_file_2.write_word("ToS[100ps]");
    --   csv_file_2.write_word("ToA[781.25ps]");
    --   csv_file_2.write_word("event");          
    --   csv_file_2.write_word("muonFixedId");                 
    --   csv_file_2.write_word("station");          
    --   csv_file_2.write_word("thread");          
    --   csv_file_2.write_word("hp#");          
    --   -- HPS_PC
    --   csv_file_2.write_word("PC_dv");
    --   csv_file_2.write_word("PC_layer");
    --   csv_file_2.write_word("PC_tube");
    --   csv_file_2.write_word("PC_time_t0[781.25ps]");
    --   csv_file_2.write_word("PC_global_z[31.25um]");
    --   csv_file_2.write_word("PC_global_x[31.25um]");
    --   -- HEG_BMIN
    --   csv_file_2.write_word("HP2BM_dv");
    --   csv_file_2.write_word("HP2BM_mdt_valid");
    --   csv_file_2.write_word("HP2BM_local_y[31.25um]");
    --   csv_file_2.write_word("HP2BM_local_x[31.25um]");
    --   csv_file_2.write_word("HP2BM_radius[31.25um]");
    --   csv_file_2.write_word("HP2BM_mlayer");
    --   csv_file_2.writeline;
    --   wait;
    -- end process open_csv;
  
    -- SNIFFER_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
    --   ST_EN: if g_ST_ENABLE(st_i) = '1' generate
    --     alias temp_mdt_full_data_av is << signal.hps_tb.STATION_GEN(st_i).HPS.HPS.mdt_full_data_av : heg_pc2heg_avt(c_HP_NUM_SECTOR_STATION(st_i)-1 downto 0) >>;
    --   begin
    --     HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
    --       C_PL : entity vamc_lib.vamc_spl
    --         generic map(
    --           -- pragma translate_off
    --           g_SIMULATION => '1',
    --           -- pragma translate_on
    --           -- g_PIPELINE_TYPE => "ring_buffer",
    --           g_DELAY_CYCLES  => 2,
    --           g_PIPELINE_WIDTH    => heg_pc2heg_vt'w
    --         )
    --         port map(
    --           clk         => clk,
    --           rst         => rst,
    --           ena         => '1',
    --           --
    --           i_data      => temp_mdt_full_data_av(hp_i),
    --           o_data      => hps_pc_mdt_full_data_aav(st_i)(hp_i)
    --       );
    --     end generate HP_GEN;
    --     TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
    --       alias temp_hp2bm_av is << signal.hps_tb.STATION_GEN(st_i).HPS.HPS.heg_gen(th_i).HEG.hp2bm_av : heg_hp2bm_avt(c_HP_NUM_SECTOR_STATION(st_i)-1 downto 0) >>;
    --     begin
    --       HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
    --         hps_heg_hp2bm_aaav(st_i)(th_i)(hp_i) <= temp_hp2bm_av(hp_i);
    --       end generate HP_GEN;
    --     end generate;
    --   else generate
    --     hps_pc_mdt_full_data_aav(st_i) <= (others => (others => '0'));
    --     hps_heg_hp2bm_aaav(st_i) <= (others => (others => (others => '0')));
    --   end generate;
    -- end generate;
    
    -- CONV_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
    --   ST_EN: if g_ST_ENABLE(st_i) = '1' generate
    --     TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
    --       HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
    --         hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i) <= convert(hps_heg_hp2bm_aaav(st_i)(th_i)(hp_i),hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i));
    --       end generate HP_GEN;
    --     end generate;
    --     HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
    --       hps_pc_mdt_full_data_aar(st_i)(hp_i) <= convert(hps_pc_mdt_full_data_aav(st_i)(hp_i),hps_pc_mdt_full_data_aar(st_i)(hp_i));
    --     --
    --     t2h_slc_e_PL : entity vamc_lib.vamc_spl
    --       generic map(
    --         -- pragma translate_off
    --         g_SIMULATION => '1',
    --         -- pragma translate_on
    --         -- g_PIPELINE_TYPE => "ring_buffer",
    --         g_DELAY_CYCLES  => 5,
    --         g_PIPELINE_WIDTH    => 32
    --       )
    --       port map(
    --         clk         => clk,
    --         rst         => rst,
    --         ena         => '1',
    --         --
    --         i_data      => std_logic_vector(i_tar2hps_slc_event_au(st_i)(hp_i)),
    --         o_data      => tar2hps_slc_event_a(st_i)(hp_i)
    --     );
    --     tar2hps_slc_event_au(st_i)(hp_i) <= unsigned(tar2hps_slc_event_a(st_i)(hp_i));
    --     t2h_hit_e_PL : entity vamc_lib.vamc_spl
    --     generic map(
    --       -- pragma translate_off
    --       g_SIMULATION => '1',
    --       -- pragma translate_on
    --       -- g_PIPELINE_TYPE => "ring_buffer",
    --       g_DELAY_CYCLES  => 5,
    --       g_PIPELINE_WIDTH    => 32
    --     )
    --     port map(
    --       clk         => clk,
    --       rst         => rst,
    --       ena         => '1',
    --       --
    --       i_data      => std_logic_vector(i_tar2hps_mdt_event_au(st_i)(hp_i)),
    --       o_data      => tar2hps_mdt_event_a(st_i)(hp_i)
    --   );
    --   tar2hps_mdt_event_au(st_i)(hp_i) <= unsigned(tar2hps_mdt_event_a(st_i)(hp_i));
    --     end generate HP_GEN;
    --   end generate;
    -- end generate;
  
    -- HIT_CSV_WR: process(clk)
    -- begin
    --   if rising_edge(clk) then
    --     if rst = '1' then
    --     else
    --       for st_i in 0 to c_MAX_NUM_ST - 1 loop
    --         for th_i in 0 to c_NUM_THREADS-1 loop
    --           for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 loop
    --             if hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data_valid = '1' or hps_pc_mdt_full_data_aar(st_i)(hp_i).data_valid = '1' then
    --               csv_file_2.write_integer(to_integer(tb_curr_sim_time)); -- ToS                 
    --               csv_file_2.write_integer(to_integer(tb_curr_tdc_time)); -- ToA                 
    --               csv_file_2.write_integer(to_integer(tar2hps_slc_event_au(st_i)(hp_i)));--to_integer(unsigned(tar2hps_slc_event_a(pc_st_id)(pm_i))));   -- event
    --               csv_file_2.write_integer(to_integer(tar2hps_mdt_event_au(st_i)(hp_i)));--to_integer(unsigned(tar2hps_mdt_event_a(pc_st_id)(pm_i))));   -- hit_id
    --               csv_file_2.write_integer(st_i);   -- station
    --               csv_file_2.write_integer(th_i);     -- hp_position   
    --               csv_file_2.write_integer(hp_i);     -- hp_position   
    --               -- HPS_PC
    --               csv_file_2.write_bool(hps_pc_mdt_full_data_aar(st_i)(hp_i).data_valid);
    --               csv_file_2.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).layer));
    --               csv_file_2.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).tube));
    --               csv_file_2.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).time_t0));
    --               csv_file_2.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).global_z));
    --               csv_file_2.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).global_x));
    --               -- HEG_BMIN
    --               csv_file_2.write_bool(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data_valid);
    --               csv_file_2.write_bool(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).mdt_valid);
    --               csv_file_2.write_integer(to_integer(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data.local_y));
    --               csv_file_2.write_integer(to_integer(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data.local_x));
    --               csv_file_2.write_integer(to_integer(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data.radius));
    --               csv_file_2.write_bool(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).data.mlayer);
    --               csv_file_2.writeline;
    --             end if;
    --           end loop;
    --         end loop;
    --       end loop;
    --     end if;
    --   end if;
    -- end process;  
  
  end generate;
  ----------------------------------------------------------------
  --
  ----------------------------------------------------------------
  OUT_CSV_HPS_PC: if g_OUT_CSV_HPS_PC = '1' generate
    constant OUT_FILE_1     : string  := "ov_" & g_PRJ_INFO & "_hps_pc_hits.csv";
    shared variable csv_file_1: csv_file_type;
    signal hps_pc_mdt_full_data_aav : hps_pc2heg_aavt;
    signal hps_pc_mdt_full_data_aar : hps_pc2heg_aart;
    signal tar2hps_slc_event_au : event_tdc_aut;
    signal tar2hps_slc_event_a : event_tdc_at;
    signal tar2hps_mdt_event_au : event_tdc_aut;
    signal tar2hps_mdt_event_a : event_tdc_at;
  begin
    open_csv: process
    begin
      wait until in_files_ok;
      puts("opening HPS PC HITs CSV file : " & OUT_FILE_1);
      csv_file_1.initialize(OUT_FILE_1,"wr");
      csv_file_1.write_string("# --------------------------");
      csv_file_1.write_string("# CSV files TS = " & in_files_ts);
      csv_file_1.write_string("# PRJ NAME = HPS PC output");
      csv_file_1.write_string("# PRJ CFG = " & g_PRJ_INFO);
      csv_file_1.write_string("# SIM TS  = " & "2022.09.15_12:05:34");--time'image(now));
      csv_file_1.write_string("# --------------------------");   
      --
      csv_file_1.write_word("ToS[100ps]");
      csv_file_1.write_word("ToA[781.25ps]");
      csv_file_1.write_word("event");          
      csv_file_1.write_word("muonFixedId");                 
      csv_file_1.write_word("station");          
      -- csv_file_1.write_word("thread");          
      csv_file_1.write_word("hp#");          
      -- HPS_PC
      csv_file_1.write_word("PC_dv");
      csv_file_1.write_word("PC_layer");
      csv_file_1.write_word("PC_tube");
      csv_file_1.write_word("PC_time_t0[781.25ps]");
      csv_file_1.write_word("PC_global_z[31.25um]");
      csv_file_1.write_word("PC_global_x[31.25um]");
      csv_file_1.writeline;
      wait;
    end process open_csv;
  
    SNIFFER_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
      ST_EN: if g_ST_ENABLE(st_i) = '1' generate
        alias temp_mdt_full_data_av is << signal.hps_tb.STATION_GEN(st_i).HPS.HPS.mdt_full_data_av : heg_pc2heg_avt(c_HP_NUM_SECTOR_STATION(st_i)-1 downto 0) >>;
      begin
        HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
          hps_pc_mdt_full_data_aav(st_i)(hp_i) <= temp_mdt_full_data_av(hp_i);
        end generate;
      else generate
        hps_pc_mdt_full_data_aav(st_i) <= (others => (others => '0'));
      end generate;
    end generate;
  
    CONV_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
      ST_EN: if g_ST_ENABLE(st_i) = '1' generate
        HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
          hps_pc_mdt_full_data_aar(st_i)(hp_i) <= convert(hps_pc_mdt_full_data_aav(st_i)(hp_i),hps_pc_mdt_full_data_aar(st_i)(hp_i));
        --
        t2h_slc_e_PL : entity vamc_lib.vamc_spl
          generic map(
            -- pragma translate_off
            g_SIMULATION => '1',
            -- pragma translate_on
            -- g_PIPELINE_TYPE => "ring_buffer",
            g_DELAY_CYCLES  => 3,
            g_PIPELINE_WIDTH    => 32
          )
          port map(
            clk         => clk,
            rst         => rst,
            ena         => '1',
            --
            i_data      => std_logic_vector(i_tar2hps_slc_event_au(st_i)(hp_i)),
            o_data      => tar2hps_slc_event_a(st_i)(hp_i)
        );
        tar2hps_slc_event_au(st_i)(hp_i) <= unsigned(tar2hps_slc_event_a(st_i)(hp_i));
        t2h_hit_e_PL : entity vamc_lib.vamc_spl
        generic map(
          -- pragma translate_off
          g_SIMULATION => '1',
          -- pragma translate_on
          -- g_PIPELINE_TYPE => "ring_buffer",
          g_DELAY_CYCLES  => 3,
          g_PIPELINE_WIDTH    => 32
        )
        port map(
          clk         => clk,
          rst         => rst,
          ena         => '1',
          --
          i_data      => std_logic_vector(i_tar2hps_mdt_event_au(st_i)(hp_i)),
          o_data      => tar2hps_mdt_event_a(st_i)(hp_i)
      );
      tar2hps_mdt_event_au(st_i)(hp_i) <= unsigned(tar2hps_mdt_event_a(st_i)(hp_i));
        end generate HP_GEN;
      end generate;
    end generate;
  
    HIT_CSV_WR: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
        else
          for st_i in 0 to c_MAX_NUM_ST - 1 loop
            -- for th_i in 0 to c_NUM_THREADS-1 loop
              for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 loop
                if hps_pc_mdt_full_data_aar(st_i)(hp_i).data_valid = '1' then
                  csv_file_1.write_integer(to_integer(tb_curr_sim_time)); -- ToS                 
                  csv_file_1.write_integer(to_integer(tb_curr_tdc_time)); -- ToA                 
                  csv_file_1.write_integer(to_integer(tar2hps_slc_event_au(st_i)(hp_i)));
                  csv_file_1.write_integer(to_integer(tar2hps_mdt_event_au(st_i)(hp_i)));
                  csv_file_1.write_integer(st_i);   -- station 
                  csv_file_1.write_integer(hp_i);     -- hp_position   
                  -- HPS_PC
                  csv_file_1.write_bool(hps_pc_mdt_full_data_aar(st_i)(hp_i).data_valid);
                  csv_file_1.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).layer));
                  csv_file_1.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).tube));
                  csv_file_1.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).time_t0));
                  csv_file_1.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).global_z));
                  csv_file_1.write_integer(to_integer(hps_pc_mdt_full_data_aar(st_i)(hp_i).global_x));
                  csv_file_1.writeline;
                end if;
              end loop;
            -- end loop;
          end loop;
        end if;
      end if;
    end process;  
  
  end generate;


end architecture sim;
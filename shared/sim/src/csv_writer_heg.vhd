--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: csv_writer_heg.vhd
-- Module: <<moduleName>>
-- File PATH: /csv_writer_heg.vhd
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

  use shared_lib.heg_sim_cstm_pkg.all;


library vamc_lib;

library hp_lib;
  use hp_lib.hp_pkg.all;
library heg_lib;
  use heg_lib.heg_pkg.all;
-- library hps_lib;
--   use hps_lib.hps_pkg.all;

entity csv_writer_heg is
  generic(
    g_PRJ_INFO              : string  := "not_defined";
    g_OUT_HEG2SF_CTR       : std_logic := '1';
    g_OUT_HEG2SF_SLC       : std_logic := '1';
    g_OUT_HEG2SF_HIT       : std_logic := '1';
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
    i_ucm2heg_file_ok       : in std_logic;
    i_ucm2heg_file_ts       : in string(1 to LINE_LENGTH_MAX);
    i_pc2heg_file_ok        : in std_logic;
    i_pc2heg_file_ts        : in string(1 to LINE_LENGTH_MAX);
    --
    i_ucm2heg_slc_event_au  : in event_xaut(c_NUM_THREADS -1 downto 0);
    i_pc2heg_mdt_event_au   : in event_tdc_aut;
    i_pc2heg_slc_event_au   : in event_tdc_aut;
    -- to Segment finder
    i_sf_control_aav        : in heg2sf_control_aavt; 
    i_sf_slc_data_aav       : in heg2sf_slc_data_aavt;
    i_sf_mdt_data_aav       : in heg2sf_mdt_data_aavt
  );
end entity csv_writer_heg;

architecture sim of csv_writer_heg is

--   type heg_pc2heg_aavt is array (c_MAX_NUM_ST -1 downto 0) of heg_pc2heg_avt(c_TOTAL_MAX_NUM_HP-1 downto 0);
--   type heg_hp2bm_aavt is array (c_NUM_THREADS -1 downto 0) of heg_hp2bm_avt(c_TOTAL_MAX_NUM_HP-1 downto 0);
--   type heg_hp2bm_aaavt is array (c_MAX_NUM_ST -1 downto 0) of heg_hp2bm_aavt;
--   type heg_pc2heg_aart is array (c_MAX_NUM_ST -1 downto 0) of heg_pc2heg_art(c_TOTAL_MAX_NUM_HP-1 downto 0);
--   type heg_hp2bm_aart is array (c_NUM_THREADS -1 downto 0) of heg_hp2bm_art(c_TOTAL_MAX_NUM_HP-1 downto 0);
--   type heg_hp2bm_aaart is array (c_MAX_NUM_ST -1 downto 0) of heg_hp2bm_aart;
--   --
--   type heg_heg2sfslc_art is array (c_NUM_THREADS -1 downto 0) of heg2sfslc_rt;
--   type heg_heg2sfslc_aart is array (c_MAX_NUM_ST -1 downto 0) of heg_heg2sfslc_art;
--   type hp_heg2hp_slc_art is array (c_NUM_THREADS -1 downto 0) of hp_heg2hp_slc_rt;
--   type hp_heg2hp_slc_aart is array (c_MAX_NUM_ST -1 downto 0) of hp_heg2hp_slc_art;

--   type hp_heg2hp_slc_b_art is array (c_NUM_THREADS -1 downto 0) of hp_heg2hp_slc_b_rt;
--   type hp_heg2hp_slc_b_aart is array (c_MAX_NUM_ST -1 downto 0) of hp_heg2hp_slc_b_art;
--   type heg_win_tubes_aart is array (c_NUM_THREADS -1 downto 0) of hp_win_tubes_avt(get_num_layers(0) -1 downto 0);
--   type heg_win_tubes_aaart is array (c_MAX_NUM_ST -1 downto 0) of heg_win_tubes_aart;

  signal sf_control_aar  : heg2sf_control_aart;
  signal sf_slc_data_aar : heg2sf_slc_data_aart;
  signal sf_mdt_data_aar : heg2sf_mdt_data_aart;

  signal in_files_ok : std_logic := '0';
  signal in_files_ts : string(1 to LINE_LENGTH_MAX);

begin
  in_files_ok <= i_ucm2heg_file_ok and i_pc2heg_file_ok;
  in_files_ts(1 to 15)  <= "not working yet";
  ----------------------------------------------------------------
  --
  ----------------------------------------------------------------
  OUT_HEG2SF_HIT_EN: if g_OUT_HEG2SF_HIT = '1' generate
    constant OUT_FILE_1     : string  := "ov_" & g_PRJ_INFO & "_heg2sf_hit.csv";
    shared variable csv_file: csv_file_type;
    signal heg2sf_hit_slc_event_au : event_xaaut(c_MAX_NUM_ST -1 downto 0);
    signal heg2sf_hit_mdt_event_au : event_xaaut(c_MAX_NUM_ST -1 downto 0);
    begin
    open_csv: process
    begin
      wait until in_files_ok;
      -- in_files_ts <= str_concat(in_files_ts,i_ucm2hps_file_ts,i_tar2hps_file_ts);
      puts("opening HEG to SF HITs CSV file : " & OUT_FILE_1);
      csv_file.initialize(OUT_FILE_1,"wr");
      csv_file.write_string("# --------------------------");
      csv_file.write_string("# CSV files TS = " & in_files_ts);
      -- csv_file.write_string("# HIT TS  : " & hit_file_ts);
      csv_file.write_string("# PRJ CFG = " & g_PRJ_INFO);
      csv_file.write_string("# SIM TS  = " & "2022.09.15_12:05:34");--time'image(now));
      csv_file.write_string("# --------------------------");   
      --
      csv_file.write_word("ToS[100ps]");
      csv_file.write_word("ToA[781.25ps]");
      csv_file.write_word("event");          
      csv_file.write_word("muonFixedId");                 
      csv_file.write_word("station");          
      csv_file.write_word("thread");          
      -- csv_file.write_word("hp#");          
      -- HPS_PC
      -- csv_file.write_word("PC_dv");
      -- csv_file.write_word("PC_layer");
      -- csv_file.write_word("PC_tube");
      -- csv_file.write_word("PC_time_t0[781.25ps]");
      -- csv_file.write_word("PC_global_z[31.25um]");
      -- csv_file.write_word("PC_global_x[31.25um]");
      -- HEG_BMIN
      -- csv_file.write_word("HP2BM_dv");
      -- csv_file.write_word("HP2BM_mdt_valid");
      csv_file.write_word("HP2BM_local_y[31.25um]");
      csv_file.write_word("HP2BM_local_x[31.25um]");
      csv_file.write_word("HP2BM_radius[31.25um]");
      csv_file.write_word("HP2BM_mlayer");
      csv_file.writeline;
      wait;
    end process open_csv;
  
    SNIFFER_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
      ST_EN: if g_ST_ENABLE(st_i) = '1' generate
        TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
          -- sf_control_aar(st_i)(th_i)  <= convert(i_sf_control_aav(st_i)(th_i),sf_control_aar(st_i)(th_i));
          -- sf_slc_data_aar(st_i)(th_i) <= convert(i_sf_slc_data_aav(st_i)(th_i),sf_slc_data_aar(st_i)(th_i));
          sf_mdt_data_aar(st_i)(th_i) <= convert(i_sf_mdt_data_aav(st_i)(th_i),sf_mdt_data_aar(st_i)(th_i));
        end generate;
      else generate
        -- hps_pc_mdt_full_data_aav(st_i) <= (others => (others => '0'));
        -- hps_heg_hp2bm_aaav(st_i) <= (others => (others => (others => '0')));
      end generate;
    end generate;
  
    --     CONV_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
      --       ST_EN: if g_ST_ENABLE(st_i) = '1' generate
      --         TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
      --           HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
      --             hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i) <= convert(hps_heg_hp2bm_aaav(st_i)(th_i)(hp_i),hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i));
      --           end generate HP_GEN;
      --         end generate;
      --         HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
      --           hps_pc_mdt_full_data_aar(st_i)(hp_i) <= convert(hps_pc_mdt_full_data_aav(st_i)(hp_i),hps_pc_mdt_full_data_aar(st_i)(hp_i));
      --         --
      --         t2h_slc_e_PL : entity vamc_lib.vamc_spl
      --           generic map(
      --             -- pragma translate_off
      --             g_SIMULATION => '1',
      --             -- pragma translate_on
      --             -- g_PIPELINE_TYPE => "ring_buffer",
      --             g_DELAY_CYCLES  => 5,
      --             g_PIPELINE_WIDTH    => 32
      --           )
      --           port map(
      --             clk         => clk,
      --             rst         => rst,
      --             ena         => '1',
      --             --
      --             i_data      => std_logic_vector(i_pc2heg_slc_event_au(st_i)(hp_i)),
      --             o_data      => pc2heg_slc_event_a(st_i)(hp_i)
      --         );
      --         pc2heg_slc_event_au(st_i)(hp_i) <= unsigned(pc2heg_slc_event_a(st_i)(hp_i));
      --         t2h_hit_e_PL : entity vamc_lib.vamc_spl
      --         generic map(
      --           -- pragma translate_off
      --           g_SIMULATION => '1',
      --           -- pragma translate_on
      --           -- g_PIPELINE_TYPE => "ring_buffer",
      --           g_DELAY_CYCLES  => 5,
      --           g_PIPELINE_WIDTH    => 32
      --         )
      --         port map(
      --           clk         => clk,
      --           rst         => rst,
      --           ena         => '1',
      --           --
      --           i_data      => std_logic_vector(i_pc2heg_mdt_event_au(st_i)(hp_i)),
      --           o_data      => pc2heg_mdt_event_a(st_i)(hp_i)
      --       );
      --       tar2hps_mdt_event_au(st_i)(hp_i) <= unsigned(pc2heg_mdt_event_a(st_i)(hp_i));
      --         end generate HP_GEN;
      --       end generate;
    --     end generate;
      
    HIT_CSV_WR: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
        else
          for st_i in 0 to c_MAX_NUM_ST - 1 loop
            for th_i in 0 to c_NUM_THREADS-1 loop
              if sf_mdt_data_aar(st_i)(th_i).data_valid = '1' then
                csv_file.write_integer(to_integer(tb_curr_sim_time)); -- ToS                 
                csv_file.write_integer(to_integer(tb_curr_tdc_time)); -- ToA                 
                csv_file.write_integer(to_integer(heg2sf_hit_slc_event_au(st_i)(th_i)));--to_integer(unsigned(pc2heg_slc_event_a(pc_st_id)(pm_i))));   -- event
                csv_file.write_integer(to_integer(heg2sf_hit_mdt_event_au(st_i)(th_i)));--to_integer(unsigned(pc2heg_mdt_event_a(pc_st_id)(pm_i))));   -- hit_id
                csv_file.write_integer(st_i);   -- station
                csv_file.write_integer(th_i);     -- hp_position 

                -- csv_file.write_bool(sf_mdt_data_aar(st_i)(th_i).data_valid);
                -- csv_file.write_bool(hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i).mdt_valid);
                csv_file.write_integer(to_integer(sf_mdt_data_aar(st_i)(th_i).localx));
                csv_file.write_integer(to_integer(sf_mdt_data_aar(st_i)(th_i).localy));
                csv_file.write_integer(to_integer(sf_mdt_data_aar(st_i)(th_i).radius));
                csv_file.write_bool(sf_mdt_data_aar(st_i)(th_i).mlayer);
                csv_file.writeline;
              end if;
            end loop;
          end loop;
        end if;
      end if;
    end process;  
  
  end generate;
  ----------------------------------------------------------------
  --
  ----------------------------------------------------------------
  OUT_HEG2SF_SLC_EN: if g_OUT_HEG2SF_SLC = '1' generate
    constant OUT_FILE_1     : string  := "ov_" & g_PRJ_INFO & "_heg2sf_slc.csv";
    shared variable csv_file: csv_file_type;
    signal heg2sf_slc_slc_event_au : event_xaaut(c_MAX_NUM_ST -1 downto 0);
    -- signal heg2sf_hit_mdt_event_au : event_xaaut(c_MAX_NUM_ST -1 downto 0);
  begin
    open_csv: process
    begin
      wait until in_files_ok;
      -- in_files_ts <= str_concat(in_files_ts,i_ucm2hps_file_ts,i_tar2hps_file_ts);
      puts("opening HEG to SF HITs CSV file : " & OUT_FILE_1);
      csv_file.initialize(OUT_FILE_1,"wr");
      csv_file.write_string("# --------------------------");
      csv_file.write_string("# CSV files TS = " & in_files_ts);
      -- csv_file.write_string("# HIT TS  : " & hit_file_ts);
      csv_file.write_string("# PRJ CFG = " & g_PRJ_INFO);
      csv_file.write_string("# SIM TS  = " & "2022.09.15_12:05:34");--time'image(now));
      csv_file.write_string("# --------------------------");   
      --
      csv_file.write_word("ToS[100ps]");
      csv_file.write_word("ToA[781.25ps]");
      csv_file.write_word("event");          
      -- csv_file.write_word("muonFixedId");                 
      csv_file.write_word("station");          
      csv_file.write_word("thread");          
      -- csv_file.write_word("hp#");          
      -- HPS_PC
      csv_file.write_word("slcid");
      csv_file.write_word("slid");
      csv_file.write_word("bcid");
      csv_file.write_word("mdtseg_dest");
      csv_file.write_word("ch_id");
      csv_file.write_word("ch_ieta");
      csv_file.write_word("vec_pos[1mm]");
      csv_file.write_word("vec_ang[1mrad]");
      csv_file.write_word("hewindow_pos[31.35um]");

      csv_file.writeline;
      wait;
    end process open_csv;

    SNIFFER_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
      ST_EN: if g_ST_ENABLE(st_i) = '1' generate
        TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
          -- sf_control_aar(st_i)(th_i)  <= convert(i_sf_control_aav(st_i)(th_i),sf_control_aar(st_i)(th_i));
          sf_slc_data_aar(st_i)(th_i) <= convert(i_sf_slc_data_aav(st_i)(th_i),sf_slc_data_aar(st_i)(th_i));
          -- sf_mdt_data_aar(st_i)(th_i) <= convert(i_sf_mdt_data_aav(st_i)(th_i),sf_mdt_data_aar(st_i)(th_i));
        end generate;
      else generate
        -- hps_pc_mdt_full_data_aav(st_i) <= (others => (others => '0'));
        -- hps_heg_hp2bm_aaav(st_i) <= (others => (others => (others => '0')));
      end generate;
    end generate;

    --     CONV_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
      --       ST_EN: if g_ST_ENABLE(st_i) = '1' generate
      --         TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
      --           HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
      --             hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i) <= convert(hps_heg_hp2bm_aaav(st_i)(th_i)(hp_i),hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i));
      --           end generate HP_GEN;
      --         end generate;
      --         HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
      --           hps_pc_mdt_full_data_aar(st_i)(hp_i) <= convert(hps_pc_mdt_full_data_aav(st_i)(hp_i),hps_pc_mdt_full_data_aar(st_i)(hp_i));
      --         --
      --         t2h_slc_e_PL : entity vamc_lib.vamc_spl
      --           generic map(
      --             -- pragma translate_off
      --             g_SIMULATION => '1',
      --             -- pragma translate_on
      --             -- g_PIPELINE_TYPE => "ring_buffer",
      --             g_DELAY_CYCLES  => 5,
      --             g_PIPELINE_WIDTH    => 32
      --           )
      --           port map(
      --          ;
      --         pc2heg_slc_event_au(st_i)(hp_i) <= unsigned(pc2heg_slc_event_a(st_i)(hp_i));
      --         t2h_hit_e_PL : entity vamc_lib.vamc_spl
      --         generic map(
      --           -- pragma translate_off
      --           g_SIMULATION => '1',
      --           -- pragma translate_on
      --           -- g_PIPELINE_TYPE => "ring_buffer",
      --           g_DELAY_CYCLES  => 5,
      --           g_PIPELINE_WIDTH    => 32
      --         )
      --         port map(
      --           clk         => clk,
      --           rst         => rst,
      --           ena         => '1',
      --           --
      --           i_data      => std_logic_vector(i_pc2heg_mdt_event_au(st_i)(hp_i)),
      --           o_data      => pc2heg_mdt_event_a(st_i)(hp_i)
      --       );
      --       tar2hps_mdt_event_au(st_i)(hp_i) <= unsigned(pc2heg_mdt_event_a(st_i)(hp_i));
      --         end generate HP_GEN;
      --       end generate;   clk         => clk,
      --             rst         => rst,
      --             ena         => '1',
      --             --
      --             i_data      => std_logic_vector(i_pc2heg_slc_event_au(st_i)(hp_i)),
      --             o_data      => pc2heg_slc_event_a(st_i)(hp_i)
      --         )
    --     end generate;

    HIT_CSV_WR: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
        else
          for st_i in 0 to c_MAX_NUM_ST - 1 loop
            for th_i in 0 to c_NUM_THREADS-1 loop
              if sf_slc_data_aar(st_i)(th_i).data_valid = '1' then
                csv_file.write_integer(to_integer(tb_curr_sim_time)); -- ToS                 
                csv_file.write_integer(to_integer(tb_curr_tdc_time)); -- ToA                 
                csv_file.write_integer(to_integer(heg2sf_slc_slc_event_au(st_i)(th_i)));--to_integer(unsigned(pc2heg_slc_event_a(pc_st_id)(pm_i))));   -- event
                -- csv_file.write_integer(to_integer(heg2sf_hit_mdt_event_au(st_i)(th_i)));--to_integer(unsigned(pc2heg_mdt_event_a(pc_st_id)(pm_i))));   -- hit_id
                csv_file.write_integer(st_i);   -- station
                csv_file.write_integer(th_i);     -- hp_position 
                --
                csv_file.write_integer(to_integer(sf_slc_data_aar(st_i)(th_i).muid.slcid));
                csv_file.write_integer(to_integer(sf_slc_data_aar(st_i)(th_i).muid.slid));
                csv_file.write_integer(to_integer(sf_slc_data_aar(st_i)(th_i).muid.bcid));
                csv_file.write_integer(to_integer(unsigned(sf_slc_data_aar(st_i)(th_i).mdtseg_dest)));
                csv_file.write_integer(to_integer(sf_slc_data_aar(st_i)(th_i).mdtid.chamber_id));
                csv_file.write_integer(to_integer(sf_slc_data_aar(st_i)(th_i).mdtid.chamber_ieta));
                csv_file.write_integer(to_integer(sf_slc_data_aar(st_i)(th_i).vec_pos));
                csv_file.write_integer(to_integer(sf_slc_data_aar(st_i)(th_i).vec_ang));
                csv_file.write_integer(to_integer(sf_slc_data_aar(st_i)(th_i).hewindow_pos));
                csv_file.writeline;
              end if;
            end loop;
          end loop;
        end if;
      end if;
    end process;  

  end generate;
    ----------------------------------------------------------------
  --
  ----------------------------------------------------------------
  OUT_HEG2SF_CTR_EN: if g_OUT_HEG2SF_CTR = '1' generate
    constant OUT_FILE_1     : string  := "ov_" & g_PRJ_INFO & "_heg2sf_ctr.csv";
    shared variable csv_file: csv_file_type;
    signal heg2sf_ctr_slc_event_au : event_xaaut(c_MAX_NUM_ST -1 downto 0);
    signal temp_sf_control_aar  : heg2sf_control_aart;

    -- signal heg2sf_hit_mdt_event_au : event_xaaut(c_MAX_NUM_ST -1 downto 0);
  begin
    open_csv: process
    begin
      wait until in_files_ok;
      -- in_files_ts <= str_concat(in_files_ts,i_ucm2hps_file_ts,i_tar2hps_file_ts);
      puts("opening HEG to SF HITs CSV file : " & OUT_FILE_1);
      csv_file.initialize(OUT_FILE_1,"wr");
      csv_file.write_string("# --------------------------");
      csv_file.write_string("# CSV files TS = " & in_files_ts);
      -- csv_file.write_string("# HIT TS  : " & hit_file_ts);
      csv_file.write_string("# PRJ CFG = " & g_PRJ_INFO);
      csv_file.write_string("# SIM TS  = " & "2022.09.15_12:05:34");--time'image(now));
      csv_file.write_string("# --------------------------");   
      --
      csv_file.write_word("ToS[100ps]");
      csv_file.write_word("ToA[781.25ps]");
      csv_file.write_word("event");          
      -- csv_file.write_word("muonFixedId");                 
      csv_file.write_word("station");          
      csv_file.write_word("thread");          
      -- csv_file.write_word("hp#");          
      -- HPS_PC
      csv_file.write_word("rst_event");
      csv_file.write_word("eof_event");
      csv_file.write_word("ena_event");
      csv_file.write_word("rst_val");
      csv_file.write_word("eof_val");
      csv_file.write_word("ena_val");


      csv_file.writeline;
      wait;
    end process open_csv;

    SNIFFER_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
      ST_EN: if g_ST_ENABLE(st_i) = '1' generate
        TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
          sf_control_aar(st_i)(th_i)  <= convert(i_sf_control_aav(st_i)(th_i),sf_control_aar(st_i)(th_i));
          -- sf_slc_data_aar(st_i)(th_i) <= convert(i_sf_slc_data_aav(st_i)(th_i),sf_slc_data_aar(st_i)(th_i));
          -- sf_mdt_data_aar(st_i)(th_i) <= convert(i_sf_mdt_data_aav(st_i)(th_i),sf_mdt_data_aar(st_i)(th_i));
        end generate;
      end generate;
    end generate;

  --     CONV_ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
    --       ST_EN: if g_ST_ENABLE(st_i) = '1' generate
    --         TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
    --           HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
    --             hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i) <= convert(hps_heg_hp2bm_aaav(st_i)(th_i)(hp_i),hps_heg_hp2bm_aaar(st_i)(th_i)(hp_i));
    --           end generate HP_GEN;
    --         end generate;
    --         HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
    --           hps_pc_mdt_full_data_aar(st_i)(hp_i) <= convert(hps_pc_mdt_full_data_aav(st_i)(hp_i),hps_pc_mdt_full_data_aar(st_i)(hp_i));
    --         --
    --         t2h_slc_e_PL : entity vamc_lib.vamc_spl
    --           generic map(
    --             -- pragma translate_off
    --             g_SIMULATION => '1',
    --             -- pragma translate_on
    --             -- g_PIPELINE_TYPE => "ring_buffer",
    --             g_DELAY_CYCLES  => 5,
    --             g_PIPELINE_WIDTH    => 32
    --           )
    --           port map(
    --          ;
    --         pc2heg_slc_event_au(st_i)(hp_i) <= unsigned(pc2heg_slc_event_a(st_i)(hp_i));
    --         t2h_hit_e_PL : entity vamc_lib.vamc_spl
    --         generic map(
    --           -- pragma translate_off
    --           g_SIMULATION => '1',
    --           -- pragma translate_on
    --           -- g_PIPELINE_TYPE => "ring_buffer",
    --           g_DELAY_CYCLES  => 5,
    --           g_PIPELINE_WIDTH    => 32
    --         )
    --         port map(
    --           clk         => clk,
    --           rst         => rst,
    --           ena         => '1',
    --           --
    --           i_data      => std_logic_vector(i_pc2heg_mdt_event_au(st_i)(hp_i)),
    --           o_data      => pc2heg_mdt_event_a(st_i)(hp_i)
    --       );
    --       tar2hps_mdt_event_au(st_i)(hp_i) <= unsigned(pc2heg_mdt_event_a(st_i)(hp_i));
    --         end generate HP_GEN;
    --       end generate;   clk         => clk,
    --             rst         => rst,
    --             ena         => '1',
    --             --
    --             i_data      => std_logic_vector(i_pc2heg_slc_event_au(st_i)(hp_i)),
    --             o_data      => pc2heg_slc_event_a(st_i)(hp_i)
    --         )
  --     end generate;

    HIT_CSV_WR: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          temp_sf_control_aar <= sf_control_aar;
        else
          for st_i in 0 to c_MAX_NUM_ST - 1 loop
            for th_i in 0 to c_NUM_THREADS-1 loop
              if sf_control_aar(st_i)(th_i).rst /= temp_sf_control_aar(st_i)(th_i).rst or
                  sf_control_aar(st_i)(th_i).eof /= temp_sf_control_aar(st_i)(th_i).eof or
                  sf_control_aar(st_i)(th_i).enable /= temp_sf_control_aar(st_i)(th_i).enable then
                
                
                csv_file.write_integer(to_integer(tb_curr_sim_time)); -- ToS                 
                csv_file.write_integer(to_integer(tb_curr_tdc_time)); -- ToA                 
                csv_file.write_integer(to_integer(heg2sf_ctr_slc_event_au(st_i)(th_i)));--to_integer(unsigned(pc2heg_slc_event_a(pc_st_id)(pm_i))));   -- event
                -- csv_file.write_integer(to_integer(heg2sf_hit_mdt_event_au(st_i)(th_i)));--to_integer(unsigned(pc2heg_mdt_event_a(pc_st_id)(pm_i))));   -- hit_id
                csv_file.write_integer(st_i);   -- station
                csv_file.write_integer(th_i);     -- hp_position 
                --
                if sf_control_aar(st_i)(th_i).rst /= temp_sf_control_aar(st_i)(th_i).rst then
                  csv_file.write_bool('1');
                else
                  csv_file.write_bool('0');
                end if;
                if sf_control_aar(st_i)(th_i).eof /= temp_sf_control_aar(st_i)(th_i).eof then
                  csv_file.write_bool('1');
                else
                  csv_file.write_bool('0');
                end if;
                if sf_control_aar(st_i)(th_i).enable /= temp_sf_control_aar(st_i)(th_i).enable then
                  csv_file.write_bool('1');
                else
                  csv_file.write_bool('0');
                end if;
                if sf_control_aar(st_i)(th_i).rst /= temp_sf_control_aar(st_i)(th_i).rst then
                  csv_file.write_bool(sf_control_aar(st_i)(th_i).rst);
                  temp_sf_control_aar(st_i)(th_i).rst <= sf_control_aar(st_i)(th_i).rst;
                else
                  csv_file.write_bool(sf_control_aar(st_i)(th_i).rst);
                end if;
                if sf_control_aar(st_i)(th_i).eof /= temp_sf_control_aar(st_i)(th_i).eof then
                  csv_file.write_bool(sf_control_aar(st_i)(th_i).eof);
                  temp_sf_control_aar(st_i)(th_i).eof <= sf_control_aar(st_i)(th_i).eof;
                else
                  csv_file.write_bool(sf_control_aar(st_i)(th_i).eof);
                end if;
                if sf_control_aar(st_i)(th_i).enable /= temp_sf_control_aar(st_i)(th_i).enable then
                  csv_file.write_bool(sf_control_aar(st_i)(th_i).enable);
                  temp_sf_control_aar(st_i)(th_i).enable <= sf_control_aar(st_i)(th_i).enable;
                else
                  csv_file.write_bool(sf_control_aar(st_i)(th_i).enable);
                end if;


                csv_file.writeline;
              end if;
            end loop;
          end loop;
        end if;
      end if;
    end process;  

  end generate;


end architecture sim;


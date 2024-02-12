--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: csv_writer_hps.vhd
-- Module: <<moduleName>>
-- File PATH: /shared/sim/src/csv_writer_hps.vhd
-- -----
-- File Created: Monday, 15th August 2022 1:15:54 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Monday, 15th August 2022 1:30:30 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
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
use shared_lib.l0mdt_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;

use shared_lib.tar_sim_pkg.all;

library vamc_lib;

-- library heg_lib;
-- use heg_lib.heg_pkg.all;
-- library hps_lib;
-- use hps_lib.hps_pkg.all;

entity csv_writer_hps is
  generic(
    g_PRJ_INFO              : string  := "A3B";
    g_ST_ENABLE             : std_logic_vector(3 downto 0) := (others => '0');
    g_OUT_HPS2SF_FILE       : string  := "not_defined.csv";
    g_OUT_HPS2NS_FILE       : string  := "not_defined.csv";
    g_OUT_SLC_FILE          : string  := "not_defined.csv";
    g_OUT_HIT_FILE          : string  := "not_defined.csv"
  );
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    enable                  : in std_logic;
    --
    tb_curr_tdc_time        : in unsigned(63 downto 0);
    --
    i_ucm2hps_file_ok       : in std_logic;
    i_ucm2hps_file_ts       : in string(1 to LINE_LENGTH_MAX);
    i_tar2hps_file_ok       : in std_logic;
    i_tar2hps_file_ts       : in string(1 to LINE_LENGTH_MAX);
    --
    i_ucm2hps_slc_event_ai  : in event_xaut(c_NUM_THREADS -1 downto 0);
    i_tar2hps_mdt_event_ai  : in event_tdc_aut
    -- TDC polmux from Tar
    -- i_tdc_hits_inn_av       : in tdcpolmux2tar_avt(g_HPS_MAX_HP -1 downto 0);
    -- i_tdc_hits_mid_av       : in tdcpolmux2tar_avt(g_HPS_MAX_HP -1 downto 0);
    -- i_tdc_hits_out_av       : in tdcpolmux2tar_avt(g_HPS_MAX_HP -1 downto 0);
    -- i_tdc_hits_ext_av       : in tdcpolmux2tar_avt(g_HPS_MAX_HP -1 downto 0);
    -- -- TDC Hits from Tar
    -- i_tar_hits_inn_av       : in tar2hps_avt(g_HPS_MAX_HP -1 downto 0);
    -- i_tar_hits_mid_av         : in tar2hps_avt(g_HPS_MAX_HP -1 downto 0);
    -- i_tar_hits_out_av         : in tar2hps_avt(g_HPS_MAX_HP -1 downto 0);
    -- i_tar_hits_ext_av         : in tar2hps_avt(g_HPS_MAX_HP -1 downto 0)

  );
end entity csv_writer_hps;

architecture sim of csv_writer_hps is

  -- -- alias hit_file_ok is  << signal.ult_tb.MDT.file_open : std_logic >>;
  -- -- alias hit_file_ts is  << signal.ult_tb.MDT.file_ts : string >>;

  constant g_OUT_FILE_1     : string  := "ov_tar2hps_" & g_PRJ_INFO & ".csv";
  constant g_OUT_FILE_2     : string  := "ov_tar2daq_" & g_PRJ_INFO & ".csv";
     
  shared variable csv_file_1: csv_file_type;
  shared variable csv_file_2: csv_file_type;

  -- -- alias slc_event_ai is  << signal.ult_tb.SLC.slc_event_ai : event_xaut >>;

  -- -- alias inn_slc_to_h2s_av is  << signal.ult_tb.ULT.inn_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- -- alias mid_slc_to_h2s_av is  << signal.ult_tb.ULT.mid_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- -- alias out_slc_to_h2s_av is  << signal.ult_tb.ULT.out_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- -- alias ext_slc_to_h2s_av is  << signal.ult_tb.ULT.ext_slc_to_h2s_plin_av : ucm2hps_avt >>;

  -- -- alias ucm2pl_av is  << signal.ult_tb.ULT.ucm2pl_av : ucm2pl_avt >>;
  -- signal ucm2pl_ar : ucm2pl_art(g_HPS_MAX_HP-1 downto 0);

  signal slc_event_au : event_tdc_aut;--(g_HPS_MAX_HP -1 downto 0);
  signal mdt_event_au : event_tdc_aut;--(g_HPS_MAX_HP -1 downto 0);
  signal slc_event_a : event_tdc_at;
  signal mdt_event_a : event_tdc_at;
  -- TDC polmux from Tar
  -- signal tdc_hits_inn_ar : tdcpolmux2tar_art(g_HPS_MAX_HP -1 downto 0);
  -- signal tdc_hits_mid_ar : tdcpolmux2tar_art(g_HPS_MAX_HP -1 downto 0);
  -- signal tdc_hits_out_ar : tdcpolmux2tar_art(g_HPS_MAX_HP -1 downto 0);
  -- signal tdc_hits_ext_ar : tdcpolmux2tar_art(g_HPS_MAX_HP -1 downto 0);
  -- TDC Hits from Tar
  -- signal tar_hits_inn_ar :tar2hps_art(g_HPS_MAX_HP -1 downto 0);
  -- signal tar_hits_mid_ar :tar2hps_art(g_HPS_MAX_HP -1 downto 0);
  -- signal tar_hits_out_ar :tar2hps_art(g_HPS_MAX_HP -1 downto 0);
  -- signal tar_hits_ext_ar :tar2hps_art(g_HPS_MAX_HP -1 downto 0);



  
begin

  gen_hps2pt: if g_OUT_HPS2SF_FILE /= "not_defined.csv" generate
  end generate gen_hps2pt;
  gen_hps2ns: if g_OUT_HPS2NS_FILE /= "not_defined.csv" generate
  end generate gen_hps2ns;
  gen_hps_slc: if g_OUT_SLC_FILE /= "not_defined.csv" generate
  end generate gen_hps_slc;
  gen_hps_hit: if g_OUT_HIT_FILE /= "not_defined.csv" generate
  end generate gen_hps_hit;

  -- -- slc_file_ts <= in_mdt_file_ts;

  -- open_csv: process
  -- begin
  --   wait until in_mdt_file_ok;
  --   puts("opening TAR2HPS CSV file : " & g_OUT_FILE_1);
  --   csv_file_1.initialize(g_OUT_FILE_1,"wr");
  --   csv_file_1.write_string("# --------------------------");
  --   csv_file_1.write_string("# HIT TS  : " & in_mdt_file_ts);
  --   -- csv_file_1.write_string("# HIT TS  : " & hit_file_ts);
  --   csv_file_1.write_string("# PRJ CFG : " & g_PRJ_INFO);
  --   csv_file_1.write_string("# SIM TS  : " & time'image(now));
  --   csv_file_1.write_string("# --------------------------");   
  --   --
  --   csv_file_1.write_word("ToA");
  --   csv_file_1.write_word("event");          
  --   csv_file_1.write_word("muonFixedId");                 
  --   csv_file_1.write_word("station");          
  --   csv_file_1.write_word("hp#");          
  --   -- tdc
  --   csv_file_1.write_word("ieta");
  --   csv_file_1.write_word("layer");
  --   csv_file_1.write_word("tube");
  --   csv_file_1.write_word("time");
  --   csv_file_1.writeline;
  --   puts("opening TAR2DAQ CSV file : " & g_OUT_FILE_2);
  --   csv_file_2.initialize(g_OUT_FILE_2,"wr");
  --   csv_file_2.write_string("# --------------------------");
  --   csv_file_2.write_string("# HIT TS  : " & in_mdt_file_ts);
  --   -- csv_file_2.write_string("# HIT TS  : " & hit_file_ts);
  --   csv_file_2.write_string("# PRJ CFG : " & g_PRJ_INFO);
  --   csv_file_2.write_string("# SIM TS  : " & time'image(now));
  --   csv_file_2.write_string("# --------------------------");    
  --   wait;
  -- end process open_csv;

  -- h_st_for : for st_i in 0 to 3 generate
  --   h_hp_for : for hp_i in c_HPS_MAX_ARRAY(st_i) -1 downto 0 generate

  --     H_PL : entity vamc_lib.vamc_spl
  --     generic map(
  --       -- pragma translate_off
  --       g_SIMULATION => '1',
  --       -- pragma translate_on
  --       g_PIPELINE_TYPE => "ring_buffer",
  --       g_DELAY_CYCLES  => 420,
  --       g_PIPELINE_WIDTH    => 32
  --     )
  --     port map(
  --       clk         => clk,
  --       rst         => rst,
  --       ena         => '1',
  --       --
  --       i_data      => std_logic_vector(i_mdt_event_ai(st_i)(hp_i)),
  --       o_data      => mdt_event_a(st_i)(hp_i)
  --     );
  --   end generate;
  -- end generate;

  -- c_st_for : for st_i in 0 to 3 generate
  --   c_hp_for : for hp_i in c_HPS_MAX_ARRAY(st_i) -1 downto 0 generate

  --     C_PL : entity vamc_lib.vamc_spl
  --     generic map(
  --       -- pragma translate_off
  --       g_SIMULATION => '1',
  --       -- pragma translate_on
  --       g_PIPELINE_TYPE => "ring_buffer",
  --       g_DELAY_CYCLES  => 420,
  --       g_PIPELINE_WIDTH    => 32
  --     )
  --     port map(
  --       clk         => clk,
  --       rst         => rst,
  --       ena         => '1',
  --       --
  --       i_data      => std_logic_vector(i_slc_event_ai(st_i)(hp_i)),
  --       o_data      => slc_event_a(st_i)(hp_i)
  --     );
  --   end generate;
  -- end generate;

  -- inn_loop : for i in c_HPS_MAX_ARRAY(0)-1 downto 0 generate
  --   tar_hits_inn_ar(i) <= convert(i_tar_hits_inn_av(i),tar_hits_inn_ar(i));
  --   tdc_hits_inn_ar(i) <= convert(i_tdc_hits_inn_av(i),tdc_hits_inn_ar(i));
  -- end generate ; 
  -- mid_loop : for i in c_HPS_MAX_ARRAY(1)-1 downto 0 generate
  --   tar_hits_mid_ar(i) <= convert(i_tar_hits_mid_av(i),tar_hits_mid_ar(i));
  --   tdc_hits_mid_ar(i) <= convert(i_tdc_hits_mid_av(i),tdc_hits_mid_ar(i));
  -- end generate ; 
  -- out_loop : for i in c_HPS_MAX_ARRAY(2)-1 downto 0 generate
  --   tar_hits_out_ar(i) <= convert(i_tar_hits_out_av(i),tar_hits_out_ar(i));
  --   tdc_hits_out_ar(i) <= convert(i_tdc_hits_out_av(i),tdc_hits_out_ar(i));
  -- end generate ; 
  -- ext_loop : for i in c_HPS_MAX_ARRAY(3)-1 downto 0 generate
  --   tar_hits_ext_ar(i) <= convert(i_tar_hits_ext_av(i),tar_hits_ext_ar(i));
  --   tdc_hits_ext_ar(i) <= convert(i_tdc_hits_ext_av(i),tdc_hits_ext_ar(i));
  -- end generate ;
  
  -- TAR2HPS_INN_GEN: if c_STATIONS_IN_SECTOR(0) = '1' generate
  --   constant pc_st_id : integer := 0;
  -- begin
  --   TAR2HPS_INN : process(clk, rst) begin
  --     if rising_edge(clk) then
  --       if rst = '1' then
  --       else     
  --           for pm_i in c_HPS_MAX_ARRAY(pc_st_id) -1 downto 0 loop
  --             if tar_hits_inn_ar(pm_i).data_valid = '1' then
  --               csv_file_1.write_integer(to_integer(tb_curr_tdc_time)); -- ToA                 
  --               csv_file_1.write_integer(to_integer(unsigned(slc_event_a(pc_st_id)(pm_i))));   -- event
  --               csv_file_1.write_integer(to_integer(unsigned(mdt_event_a(pc_st_id)(pm_i))));   -- hit_id
  --               csv_file_1.write_integer(pc_st_id);   -- station
  --               csv_file_1.write_integer(pm_i);     -- hp_position   
  --               -- tar info
  --               csv_file_1.write_integer(to_integer(tar_hits_inn_ar(pm_i).chamber_ieta));
  --               csv_file_1.write_integer(to_integer(tar_hits_inn_ar(pm_i).layer));
  --               csv_file_1.write_integer(to_integer(tar_hits_inn_ar(pm_i).tube));
  --               csv_file_1.write_integer(to_integer(tar_hits_inn_ar(pm_i).time));
  --               csv_file_1.writeline;
  --             end if;
  --           end loop;
  --       end if;
  --     end if;
  --   end process;
  -- end generate TAR2HPS_INN_GEN;

  -- TAR2HPS_MID_GEN: if c_STATIONS_IN_SECTOR(1) = '1' generate
  --   constant pc_st_id : integer := 1;
  -- begin
  --   TAR2HPS_MID : process(clk, rst) begin
  --     if rising_edge(clk) then
  --       if rst = '1' then
  --       else     
  --           for pm_i in c_HPS_MAX_ARRAY(pc_st_id) -1 downto 0 loop
  --             if tar_hits_mid_ar(pm_i).data_valid = '1' then
  --               csv_file_1.write_integer(to_integer(tb_curr_tdc_time)); -- ToA                 
  --               csv_file_1.write_integer(to_integer(unsigned(slc_event_a(pc_st_id)(pm_i))));   -- event
  --               csv_file_1.write_integer(to_integer(unsigned(mdt_event_a(pc_st_id)(pm_i))));   -- hit_id
  --               csv_file_1.write_integer(pc_st_id);   -- station
  --               csv_file_1.write_integer(pm_i);     -- hp_position   
  --               -- tar info
  --               csv_file_1.write_integer(to_integer(tar_hits_mid_ar(pm_i).chamber_ieta));
  --               csv_file_1.write_integer(to_integer(tar_hits_mid_ar(pm_i).layer));
  --               csv_file_1.write_integer(to_integer(tar_hits_mid_ar(pm_i).tube));
  --               csv_file_1.write_integer(to_integer(tar_hits_mid_ar(pm_i).time));
  --               csv_file_1.writeline;
  --             end if;
  --           end loop;
  --       end if;
  --     end if;
  --   end process;
  -- end generate TAR2HPS_MID_GEN;

  -- TAR2HPS_OUT_GEN: if c_STATIONS_IN_SECTOR(2) = '1' generate
  --   constant pc_st_id : integer := 2;
  -- begin
  --   TAR2HPS_OUT : process(clk, rst) begin
  --     if rising_edge(clk) then
  --       if rst = '1' then
  --       else     
  --           for pm_i in c_HPS_MAX_ARRAY(pc_st_id) -1 downto 0 loop
  --             if tar_hits_out_ar(pm_i).data_valid = '1' then
  --               csv_file_1.write_integer(to_integer(tb_curr_tdc_time)); -- ToA                 
  --               csv_file_1.write_integer(to_integer(unsigned(slc_event_a(pc_st_id)(pm_i))));   -- event
  --               csv_file_1.write_integer(to_integer(unsigned(mdt_event_a(pc_st_id)(pm_i))));   -- hit_id
  --               csv_file_1.write_integer(pc_st_id);   -- station
  --               csv_file_1.write_integer(pm_i);     -- hp_position   
  --               -- tar info
  --               csv_file_1.write_integer(to_integer(tar_hits_out_ar(pm_i).chamber_ieta));
  --               csv_file_1.write_integer(to_integer(tar_hits_out_ar(pm_i).layer));
  --               csv_file_1.write_integer(to_integer(tar_hits_out_ar(pm_i).tube));
  --               csv_file_1.write_integer(to_integer(tar_hits_out_ar(pm_i).time));
  --               csv_file_1.writeline;
  --             end if;
  --           end loop;
  --       end if;
  --     end if;
  --   end process;
  -- end generate TAR2HPS_OUT_GEN;

  -- TAR2HPS_EXT_GEN: if c_STATIONS_IN_SECTOR(3) = '1' generate
  --   constant pc_st_id : integer := 3;
  -- begin
  --   TAR2HPS_EXT : process(clk, rst) begin
  --     if rising_edge(clk) then
  --       if rst = '1' then
  --       else     
  --           for pm_i in c_HPS_MAX_ARRAY(pc_st_id) -1 downto 0 loop
  --             if tar_hits_ext_ar(pm_i).data_valid = '1' then
  --               csv_file_1.write_integer(to_integer(tb_curr_tdc_time)); -- ToA                 
  --               csv_file_1.write_integer(to_integer(unsigned(slc_event_a(pc_st_id)(pm_i))));   -- event
  --               csv_file_1.write_integer(to_integer(unsigned(mdt_event_a(pc_st_id)(pm_i))));   -- hit_id
  --               csv_file_1.write_integer(pc_st_id);   -- station
  --               csv_file_1.write_integer(pm_i);     -- hp_position   
  --               -- tar info
  --               csv_file_1.write_integer(to_integer(tar_hits_ext_ar(pm_i).chamber_ieta));
  --               csv_file_1.write_integer(to_integer(tar_hits_ext_ar(pm_i).layer));
  --               csv_file_1.write_integer(to_integer(tar_hits_ext_ar(pm_i).tube));
  --               csv_file_1.write_integer(to_integer(tar_hits_ext_ar(pm_i).time));
  --               csv_file_1.writeline;
  --             end if;
  --           end loop;
  --       end if;
  --     end if;
  --   end process;
  -- end generate TAR2HPS_EXT_GEN;
  
end architecture sim;
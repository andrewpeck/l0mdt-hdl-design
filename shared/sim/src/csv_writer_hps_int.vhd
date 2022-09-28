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
--------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.std_logic_misc.all;

library shared_lib;
  use shared_lib.common_ieee_pkg.all;
  use shared_lib.l0mdt_constants_pkg.all;
  use shared_lib.l0mdt_dataformats_pkg.all;
  use shared_lib.common_constants_pkg.all;
  use shared_lib.common_types_pkg.all;
  use shared_lib.config_pkg.all;
  use shared_lib.detector_param_pkg.all;
  use shared_lib.detector_time_param_pkg.all;
  -- use shared_lib.l0mdt_sim_cstm_pkg.all;
  -- use shared_lib.vhdl_textio_csv_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;
use ctrl_lib.HPS_CTRL_DEF.all;

package csv_writer_hps_int_pkg is
  type hps_pc2heg_aavt is array (c_MAX_NUM_ST -1 downto 0) of heg_pc2heg_avt(c_TOTAL_MAX_NUM_HP-1 downto 0);
  type heg_hp2bm_aavt is array (c_NUM_THREADS -1 downto 0) of heg_hp2bm_avt(c_TOTAL_MAX_NUM_HP-1 downto 0);
  type heg_hp2bm_aaavt is array (c_MAX_NUM_ST -1 downto 0) of heg_hp2bm_aavt;
  -- type mon_avt is array (c_MAX_NUM_ST -1 downto 0) of std_logic_vector(HPS_MON_t'w -1 downto 0);
  -- type ucm2hps_aavt is array (c_MAX_NUM_ST -1 downto 0) of ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  -- type tar2hps_aavt is array (c_MAX_NUM_ST -1 downto 0) of tar2hps_avt(c_TOTAL_MAX_NUM_HP -1 downto 0);
  -- type hps2pt_aavt is array (c_MAX_NUM_ST -1 downto 0) of sf2ptcalc_avt(c_NUM_THREADS -1 downto 0);
end package ;

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
  use shared_lib.detector_param_pkg.all;
  use shared_lib.vhdl_tb_utils_pkg.all;
  use shared_lib.l0mdt_sim_cstm_pkg.all;
  use shared_lib.vhdl_textio_csv_pkg.all;

-- use shared_lib.tar_sim_pkg.all;

library vamc_lib;

library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library work;
use work.csv_writer_hps_int_pkg.all;

entity csv_writer_hps_int is
  generic(
    g_PRJ_INFO              : string  := "not_defined";
    g_ST_ENABLE             : std_logic_vector(3 downto 0) := (others => '0')
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
end entity csv_writer_hps_int;

architecture sim of csv_writer_hps_int is
  signal in_files_ok : std_logic := '0';
  signal in_files_ts : string(1 to LINE_LENGTH_MAX);

  constant OUT_FILE_1     : string  := "ov_" & g_PRJ_INFO & "_hps_int.csv";
  shared variable csv_file_1: csv_file_type;

  signal slc_event_au : event_tdc_aut;
  signal mdt_event_au : event_tdc_aut;
  signal slc_event_a : event_tdc_at;
  signal mdt_event_a : event_tdc_at;

  -- -- alias slc_event_ai is  << signal.ult_tp.SLC.slc_event_ai : event_xaut >>;

  -- alias mdt_full_data_av is  << signal.hps_tb.STATION_GEN(0).HPS.HPS.mdt_full_data_av : heg_pc2heg_avt(c_TOTAL_MAX_NUM_HP-1 downto 0) >>;
  signal hps_pc_mdt_full_data_aav : hps_pc2heg_aavt;
  signal hps_heg_hp2bm_aaav : heg_hp2bm_aaavt;
  -- -- alias mid_slc_to_h2s_av is  << signal.ult_tp.ULT.mid_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- -- alias out_slc_to_h2s_av is  << signal.ult_tp.ULT.out_slc_to_h2s_plin_av : ucm2hps_avt >>;
  -- -- alias ext_slc_to_h2s_av is  << signal.ult_tp.ULT.ext_slc_to_h2s_plin_av : ucm2hps_avt >>;

  -- -- alias ucm2pl_av is  << signal.ult_tp.ULT.ucm2pl_av : ucm2pl_avt >>;
  -- signal ucm2pl_ar : ucm2pl_art(g_HPS_MAX_HP-1 downto 0);

begin
  in_files_ok <= i_ucm2hps_file_ok and i_tar2hps_file_ok;
  in_files_ts(1 to 15)  <= "not working yet";

  open_csv: process
  begin
    wait until in_files_ok;
    -- in_files_ts <= str_concat(in_files_ts,i_ucm2hps_file_ts,i_tar2hps_file_ts);
    puts("opening HPS INTERNALS CSV file : " & OUT_FILE_1);
    csv_file_1.initialize(OUT_FILE_1,"wr");
    csv_file_1.write_string("# --------------------------");
    csv_file_1.write_string("# CSV files TS = " & in_files_ts);
    -- csv_file_1.write_string("# HIT TS  : " & hit_file_ts);
    csv_file_1.write_string("# PRJ CFG = " & g_PRJ_INFO);
    csv_file_1.write_string("# SIM TS  = " & "2022.09.15_12:05:34");--time'image(now));
    csv_file_1.write_string("# --------------------------");   
    --
    csv_file_1.write_word("ToS[100ps]");
    csv_file_1.write_word("ToA[0.78125ns]");
    csv_file_1.write_word("event");          
    csv_file_1.write_word("muonFixedId");                 
    csv_file_1.write_word("station");          
    csv_file_1.write_word("hp#");          
    -- tdc
    csv_file_1.write_word("ieta");
    csv_file_1.write_word("layer");
    csv_file_1.write_word("tube");
    csv_file_1.write_word("time[0.78125ns]");
    csv_file_1.writeline;
    wait;
  end process open_csv;

  ST_GEN: for st_i in 0 to c_MAX_NUM_ST - 1 generate
    ST_EN: if g_ST_ENABLE(st_i) = '1' generate
      alias temp_mdt_full_data_av is  
        << signal.hps_tb.STATION_GEN(st_i).HPS.HPS.mdt_full_data_av : heg_pc2heg_avt(c_TOTAL_MAX_NUM_HP-1 downto 0) >>;
    begin
      TH_GEN: for th_i in 0 to c_NUM_THREADS-1 generate
        alias temp_hp2bm_av is  
          << signal.hps_tb.STATION_GEN(st_i).HPS.HPS.heg_gen(th_i).HEG.hp2bm_av : heg_hp2bm_avt(c_HP_NUM_SECTOR_STATION(st_i)-1 downto 0) >>;
      begin
        HP_GEN: for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i)-1 generate
          hps_heg_hp2bm_aaav(st_i)(th_i)(hp_i) <= temp_hp2bm_av(hp_i);
        end generate HP_GEN;
      end generate;
      hps_pc_mdt_full_data_aav(st_i) <= temp_mdt_full_data_av;
    else generate
      hps_pc_mdt_full_data_aav <= (others => (others => (others => '0')));
      hps_heg_hp2bm_aaav <= (others => (others => (others => (others => '0'))));
    end generate;
  end generate;


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
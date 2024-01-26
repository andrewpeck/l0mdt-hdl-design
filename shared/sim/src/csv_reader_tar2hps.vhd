--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: csv_reader_tar2hps.vhd
-- Module: <<moduleName>>
-- File PATH: /shared/sim/src/csv_reader_tar2hps.vhd
-- -----
-- File Created: Monday, 15th August 2022 1:15:01 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Saturday, 10th September 2022 7:06:32 pm
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

use shared_lib.hps_sim_pkg.all;

library vamc_lib;

-- library heg_lib;
-- use heg_lib.heg_pkg.all;
-- library hps_lib;
-- use hps_lib.hps_pkg.all;

entity csv_reader_tar2hps is
  generic(
    g_PRJ_INFO            : string  := "not defined";
    g_ST_ENABLE           : std_logic_vector(3 downto 0) := (others => '0');
    g_IN_TAR2HPS_FILE     : string  := "not_defined.csv";
    g_verbose             : integer := 2
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    ena                   : in std_logic;
    --
    tb_curr_tdc_time      : in unsigned(63 downto 0);
    --
    o_file_ok             : out std_logic;
    o_file_ts             : out string(1 to LINE_LENGTH_MAX);
    --
    o_mdt_event_ai        : out event_tdc_aut;--event_xaut(3 downto 0);
    o_slc_event_ai        : out event_tdc_aut;--event_xaut(3 downto 0);
    -- TDC Hits from Tar
    o_tar_hits_inn_av     : out tar2hps_avt(c_TOTAL_MAX_NUM_HP -1 downto 0);
    o_tar_hits_mid_av     : out tar2hps_avt(c_TOTAL_MAX_NUM_HP -1 downto 0);
    o_tar_hits_out_av     : out tar2hps_avt(c_TOTAL_MAX_NUM_HP -1 downto 0);
    o_tar_hits_ext_av     : out tar2hps_avt(c_TOTAL_MAX_NUM_HP -1 downto 0)

  );
end entity csv_reader_tar2hps;

architecture sim of csv_reader_tar2hps is
  type sim_tar2hps_rt is record
    ToS          : integer;
    ToA          : integer;
    event        : integer;
    muonFixedId  : integer;
    station      : integer;
    hp           : integer;
    ieta         : integer;
    layer        : integer;
    tube         : integer;
    time         : integer;
  end record sim_tar2hps_rt;
  	
  -- signal mdt_event_ai     : event_tdc_aut := (others => (others => (others => '0')));

  shared variable csv_file  : csv_file_type;
  signal file_open          : std_logic := '0';   
  signal file_ts            : string(1 to LINE_LENGTH_MAX);
  
  constant tar_event_r0 : eve_tar2hps_rt := (
    ToS => (others => '0'),
    ToA => (others => '0'),
    event_id => (others => '0'),
    muonFixedId => (others => '0'),
    station => (others => '0'),
    hp => (others => '0'),
    tar2hps => (
      data_valid => '0',
      chamber_ieta => (others => '0'),
      layer => (others => '0'),
      tube => (others => '0'),
      time => (others => '0')
    )
  );
  signal tar_event_r  : eve_tar2hps_rt;
  type tar2hps_fifo_at is array (c_TOTAL_MAX_NUM_HP -1 downto 0) of eve_tar2hps_art;
  type tar2hps_fifo_aat is array (c_MAX_NUM_ST -1 downto 0) of tar2hps_fifo_at; 
  signal tar2hps_fifo : tar2hps_fifo_aat := (others => (others => (others => tar_event_r0)));

  type infifo_hit_counts_ait is array (c_TOTAL_MAX_NUM_HP -1 downto 0) of integer;
  type tar2hps_fifo_counters_aait is array (c_MAX_NUM_ST -1 downto 0) of infifo_hit_counts_ait;
  signal tar2hps_fifo_counters : tar2hps_fifo_counters_aait := (others => (others => 0));
begin

  o_file_ok <= file_open;
  o_file_ts <= file_ts;
  
  open_csv: process
    variable timestamp : string(1 to LINE_LENGTH_MAX);
    variable aux : string(1 to LINE_LENGTH_MAX);
  begin
    -- if first_read = '1' then
    puts("--------------------------------");
    puts("opening TAR2HPS CSV file : " & g_IN_TAR2HPS_FILE);
    csv_file.initialize(g_IN_TAR2HPS_FILE,"rd");
    csv_file.readline;
    while csv_file.read_isheader loop 
      aux := csv_file.read_string(' ');
      -- puts(aux);
      while not csv_file.end_of_line loop
        aux := csv_file.read_string('=');
        -- puts(aux);
        if aux(1 to 6) = "SIM TS" then
          timestamp := csv_file.read_string(NUL);
          file_ts <= timestamp;
          puts("TS of input file = ",timestamp);
        end if;
        if aux(1 to 7) = "PRJ CFG" then
          timestamp := csv_file.read_string(NUL);
          file_ts <= timestamp;
          puts("Prj origin of input file = ",timestamp);
        end if;
        -- if aux(1 to 4) = "Side" then
        --   puts("     Side = ",csv_file.read_string(' '));
        -- end if;
        -- if aux(1 to 6) = "Sector" then
        --   puts("   Sector = ",csv_file.read_string(' '));
        -- end if;
        -- if aux(1 to 4) = "Area" then
        --   puts("     Area = ",csv_file.read_string(' '));
        -- end if;
      end loop;
      csv_file.readline;
    end loop;
      file_open <= '1';
      puts("--------------------------------");

    -- end if;
    wait;
  end process open_csv;

  READ_TAR: process(clk)
    variable first_read           : std_logic := '1';
    variable tar2hps_vr : sim_tar2hps_rt;
    variable row_counter          : integer := 0;
    variable tar_event_vr  : eve_tar2hps_rt;
    variable tar2hps_fifo_counters_v : tar2hps_fifo_counters_aait := (others => (others => 0));
  begin
    if rising_edge(clk) then
      if rst = '1' then
        tar2hps_fifo <= (others => (others => (others => tar_event_r0)));
        o_mdt_event_ai <= (others => (others => (others => '0')));
        o_slc_event_ai <= (others => (others => (others => '0')));
      else
        if ena = '1' then
          -- write to DUT
          FIFO_RD : for st_i in 0 to c_MAX_NUM_ST - 1 loop
            for hp_i in 0 to c_HP_NUM_SECTOR_STATION(st_i) - 1 loop
              if(tar2hps_fifo_counters_v(st_i)(hp_i) > 0) then
                case( st_i ) is
                  when 0 => o_tar_hits_inn_av(hp_i) <= convert(tar2hps_fifo(st_i)(hp_i)(0).tar2hps,o_tar_hits_inn_av(hp_i));
                  when 1 => o_tar_hits_mid_av(hp_i) <= convert(tar2hps_fifo(st_i)(hp_i)(0).tar2hps,o_tar_hits_mid_av(hp_i));
                  when 2 => o_tar_hits_out_av(hp_i) <= convert(tar2hps_fifo(st_i)(hp_i)(0).tar2hps,o_tar_hits_ext_av(hp_i));
                  when 3 => o_tar_hits_ext_av(hp_i) <= convert(tar2hps_fifo(st_i)(hp_i)(0).tar2hps,o_tar_hits_out_av(hp_i));
                  when others => assert FALSE report "Error station in FIFO_RD" severity note;
                end case ;
                o_mdt_event_ai(st_i)(hp_i) <= tar2hps_fifo(st_i)(hp_i)(0).muonFixedId;
                o_slc_event_ai(st_i)(hp_i) <= tar2hps_fifo(st_i)(hp_i)(0).event_id;
                for mv_i in TB_TAR2HPS_FIFO_WIDTH -1 downto 1 loop
                  tar2hps_fifo(st_i)(hp_i)(mv_i - 1) <= tar2hps_fifo(st_i)(hp_i)(mv_i);
                end loop;
                  tar2hps_fifo_counters_v(st_i)(hp_i) := tar2hps_fifo_counters_v(st_i)(hp_i) - 1;
              else
                o_mdt_event_ai(st_i)(hp_i) <= (others => '0');
                o_slc_event_ai(st_i)(hp_i) <= (others => '0');
                case( st_i ) is
                  when 0 => o_tar_hits_inn_av(hp_i) <= zero(o_tar_hits_inn_av(hp_i));
                  when 1 => o_tar_hits_mid_av(hp_i) <= zero(o_tar_hits_mid_av(hp_i));
                  when 2 => o_tar_hits_out_av(hp_i) <= zero(o_tar_hits_out_av(hp_i));
                  when 3 => o_tar_hits_ext_av(hp_i) <= zero(o_tar_hits_ext_av(hp_i));
                  when others => assert FALSE report "Error station in FIFO_RD" severity note;
                end case ;
              end if;
            end loop;
          end loop ; -- FIFO_RD
          -- read from CSV
          if first_read = '1' then
            csv_file.readline;
            tar2hps_vr.ToS          :=csv_file.read_integer;
            tar2hps_vr.ToA          :=csv_file.read_integer;
            tar2hps_vr.event        :=csv_file.read_integer;
            tar2hps_vr.muonFixedId  :=csv_file.read_integer;
            tar2hps_vr.station      :=csv_file.read_integer;
            tar2hps_vr.hp           :=csv_file.read_integer;
            tar2hps_vr.ieta         :=csv_file.read_integer;
            tar2hps_vr.layer        :=csv_file.read_integer;
            tar2hps_vr.tube         :=csv_file.read_integer;
            tar2hps_vr.time         :=csv_file.read_integer;
            if g_verbose > 1 then
              puts("##### TAR2HPS( " & integer'image(row_counter) &
              " ): "& integer'image(tar2hps_vr.ToS        ) &
              " ): "& integer'image(tar2hps_vr.ToA        ) &
              " : " & integer'image(tar2hps_vr.event      ) &
              " : " & integer'image(tar2hps_vr.muonFixedId) &
              " : " & integer'image(tar2hps_vr.station    ) &
              " : " & integer'image(tar2hps_vr.hp         ) &
              " : " & integer'image(tar2hps_vr.ieta       ) &
              " : " & integer'image(tar2hps_vr.layer      ) &
              " : " & integer'image(tar2hps_vr.tube       ) &
              " : " & integer'image(tar2hps_vr.time       ) 
              );
            end if;
            tar_event_vr :=(
              ToS => to_unsigned(tar2hps_vr.ToS,64),
              ToA => to_unsigned(tar2hps_vr.ToA,64),
              event_id => to_unsigned(tar2hps_vr.event,32),
              muonFixedId => to_unsigned(tar2hps_vr.muonFixedId,32),
              station => to_unsigned(tar2hps_vr.station,8),
              hp => to_unsigned(tar2hps_vr.hp,4),
              tar2hps => (
                data_valid => '1',
                chamber_ieta => to_unsigned(tar2hps_vr.ieta,VEC_MDTID_CHAMBER_IETA_LEN),
                layer => to_unsigned(tar2hps_vr.layer,TAR2HPS_LAYER_LEN),
                tube => to_unsigned(tar2hps_vr.tube,TAR2HPS_TUBE_LEN),
                time => to_unsigned(tar2hps_vr.time,TAR2HPS_TIME_LEN)
              )
            );
            row_counter := row_counter +1;
            tar_event_r <= tar_event_vr;
            first_read := '0';
          end if;
          RL : while true loop
            if (tar_event_vr.ToA < tb_curr_tdc_time) then
              if (csv_file.end_of_file = false) then
                FIFO_WR : for st_i in 0 to c_MAX_NUM_ST - 1 loop
                  if c_ENABLED_ST(st_i) = '1' and g_ST_ENABLE(st_i) = '1' and to_integer(tar_event_vr.station) = st_i then
                    if c_HP_SECTOR_STATION(st_i)(to_integer(tar_event_vr.hp)) = '1' then
                      tar2hps_fifo(st_i)(to_integer(tar_event_vr.hp))(tar2hps_fifo_counters_v(st_i)(to_integer(tar_event_vr.hp))) <= tar_event_vr;
                      tar2hps_fifo_counters_v(st_i)(to_integer(tar_event_vr.hp)) := tar2hps_fifo_counters_v(st_i)(to_integer(tar_event_vr.hp) ) + 1;
                    end if;
                  end if;
                end loop ; -- FIFO_WR
                csv_file.readline;
                tar2hps_vr.ToS          :=csv_file.read_integer;
                tar2hps_vr.ToA          :=csv_file.read_integer;
                tar2hps_vr.event        :=csv_file.read_integer;
                tar2hps_vr.muonFixedId  :=csv_file.read_integer;
                tar2hps_vr.station      :=csv_file.read_integer;
                tar2hps_vr.hp           :=csv_file.read_integer;
                tar2hps_vr.ieta         :=csv_file.read_integer;
                tar2hps_vr.layer        :=csv_file.read_integer;
                tar2hps_vr.tube         :=csv_file.read_integer;
                tar2hps_vr.time         :=csv_file.read_integer;
                if g_verbose > 1 then
                  puts("##### TAR2HPS( " & integer'image(row_counter) &
                  " ): "& integer'image(tar2hps_vr.ToS        ) &
                  " : "& integer'image(tar2hps_vr.ToA        ) &
                  " : " & integer'image(tar2hps_vr.event      ) &
                  " : " & integer'image(tar2hps_vr.muonFixedId) &
                  " : " & integer'image(tar2hps_vr.station    ) &
                  " : " & integer'image(tar2hps_vr.hp         ) &
                  " : " & integer'image(tar2hps_vr.ieta       ) &
                  " : " & integer'image(tar2hps_vr.layer      ) &
                  " : " & integer'image(tar2hps_vr.tube       ) &
                  " : " & integer'image(tar2hps_vr.time       ) 
                  );
                end if;
                tar_event_vr :=(
                  ToS => to_unsigned(tar2hps_vr.ToS,64),
                  ToA => to_unsigned(tar2hps_vr.ToA,64),
                  event_id => to_unsigned(tar2hps_vr.event,32),
                  muonFixedId => to_unsigned(tar2hps_vr.muonFixedId,32),
                  station => to_unsigned(tar2hps_vr.station,8),
                  hp => to_unsigned(tar2hps_vr.hp,4),
                  tar2hps => (
                    data_valid => '1',
                    chamber_ieta => to_unsigned(tar2hps_vr.ieta,VEC_MDTID_CHAMBER_IETA_LEN),
                    layer => to_unsigned(tar2hps_vr.layer,TAR2HPS_LAYER_LEN),
                    tube => to_unsigned(tar2hps_vr.tube,TAR2HPS_TUBE_LEN),
                    time => to_unsigned(tar2hps_vr.time,TAR2HPS_TIME_LEN)
                  )
                );
                row_counter := row_counter +1;
                tar_event_r <= tar_event_vr;
              else
                exit;
              end if;
            else
              exit;
            end if;
          end loop;
        end if;
      end if;
    end if;
  end process;
  
end architecture sim;
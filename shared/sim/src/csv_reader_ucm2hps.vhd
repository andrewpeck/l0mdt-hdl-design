--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: csv_reader_ucm2hps.vhd
-- Module: <<moduleName>>
-- File PATH: /shared/sim/src/csv_reader_ucm2hps.vhd
-- -----
-- File Created: Monday, 15th August 2022 1:15:27 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Saturday, 10th September 2022 6:49:02 pm
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

use shared_lib.hps_sim_pkg.all;
use shared_lib.l0mdt_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;

library vamc_lib;

-- library heg_lib;
-- use heg_lib.heg_pkg.all;
-- library hps_lib;
-- use hps_lib.hps_pkg.all;

entity csv_reader_ucm2hps is
  generic(
    g_PRJ_INFO            : string  := "not defined";
    g_ST_ENABLE           : std_logic_vector(3 downto 0) := (others => '0');
    g_IN_UCM2HPS_FILE     : string  := "not_defined.csv";
    g_verbose             : integer := 2
  );
  port (
    clk                     : in std_logic;
    rst                     : in std_logic;
    ena                     : in std_logic;
    --
    tb_curr_tdc_time        : in unsigned(63 downto 0);
    --
    o_file_ok               : out std_logic;
    o_file_ts               : out string;
    --
    o_slc_event_ai          : out event_xaut(c_NUM_THREADS -1 downto 0);
    --
    o_ucm2hps_inn_av     : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_ucm2hps_mid_av     : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_ucm2hps_out_av     : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    o_ucm2hps_ext_av     : out ucm2hps_avt(c_NUM_THREADS -1 downto 0)

  );
end entity csv_reader_ucm2hps;

architecture sim of csv_reader_ucm2hps is
  type sim_ucm2hps_rt is record
    ToS           : integer;
    ToA           : integer;
    event         : integer;
    thread        : integer;
    station       : integer;
    slc_id        : integer;
    slid          : integer;
    bcid          : integer;
    mdtseg_Dest   : integer;
    chamber_id    : integer;
    chamber_ieta  : integer;
    vec_pos       : integer;
    vec_ang       : integer;
  end record sim_ucm2hps_rt;
  constant ucm_event_r0 : eve_ucm2hps_rt := (
    ToS => (others => '0'),
    ToA => (others => '0'),
    event_id => (others => '0'),
    thread => (others => '0'),
    station => (others => '0'),
    ucm2hps => (
      data_valid => '0',
      muid => (
        slcid => (others => '0'),
        slid => (others => '0'),
        bcid => (others => '0')
      ),
      mdtseg_dest => (others => '0'),
      mdtid => (
        chamber_id => (others => '0'),
        chamber_ieta => (others => '0')
      ),
      vec_pos => (others => '0'),
      vec_ang => (others => '0')
    )
  );
  shared variable csv_file  : csv_file_type;
  signal file_open          : std_logic := '0';   
  signal file_ts            : string(1 to LINE_LENGTH_MAX);
  --
  signal slc_event_ai       : event_xaaut(c_MAX_NUM_ST -1 downto 0);
   
  signal ucm_event_r  : eve_ucm2hps_rt;
  type ucm2hps_fifo_at is array (c_NUM_THREADS -1 downto 0) of eve_ucm2hps_art;
  type ucm2hps_fifo_aat is array (c_MAX_NUM_ST -1 downto 0) of ucm2hps_fifo_at; 
  signal ucm2hps_fifo : ucm2hps_fifo_aat := (others => (others => (others => ucm_event_r0)));

  type infifo_slc_counts_ait is array (c_NUM_THREADS -1 downto 0) of integer;
  type ucm2hps_fifo_counters_aait is array (c_MAX_NUM_ST -1 downto 0) of infifo_slc_counts_ait;
  signal ucm2hps_fifo_counters : ucm2hps_fifo_counters_aait := (others => (others => 0));

begin

  o_file_ok <= file_open;
  o_file_ts <= file_ts;
  
  open_csv: process
    variable timestamp : string(1 to LINE_LENGTH_MAX);
    variable aux : string(1 to LINE_LENGTH_MAX);
  begin
    -- if first_read = '1' then
    puts("--------------------------------");
    puts("opening UCM2HPS CSV file : " & g_IN_UCM2HPS_FILE);
    csv_file.initialize(g_IN_UCM2HPS_FILE,"rd");
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

 READ_UCM: process(clk)
  variable first_read           : std_logic := '1';
  variable ucm2hps_vr : sim_ucm2hps_rt;
  variable row_counter          : integer := 0;
  variable ucm_event_vr  : eve_ucm2hps_rt;
  variable ucm2hps_fifo_counters_v : ucm2hps_fifo_counters_aait := (others => (others => 0));
 begin
  if rising_edge(clk) then
    if rst = '1' then
      ucm2hps_fifo <= (others => (others => (others => ucm_event_r0)));
      -- o_mdt_event_ai <= (others => (others => (others => '0')));
      o_slc_event_ai <= (others => (others => '0'));
      slc_event_ai <= (others => (others => (others => '0')));
    else
      if ena = '1' then
        -- write to DUT
        FIFO_RD : for st_i in 0 to c_MAX_NUM_ST - 1 loop
          if g_ST_ENABLE(st_i) then
            for th_i in 0 to c_NUM_THREADS - 1 loop
              if(ucm2hps_fifo_counters_v(st_i)(th_i) > 0) then
                case( st_i ) is
                  when 0 => o_ucm2hps_inn_av(th_i) <= convert(ucm2hps_fifo(st_i)(th_i)(0).ucm2hps,o_ucm2hps_inn_av(th_i));
                  when 1 => o_ucm2hps_mid_av(th_i) <= convert(ucm2hps_fifo(st_i)(th_i)(0).ucm2hps,o_ucm2hps_mid_av(th_i));
                  when 2 => o_ucm2hps_out_av(th_i) <= convert(ucm2hps_fifo(st_i)(th_i)(0).ucm2hps,o_ucm2hps_ext_av(th_i));
                  when 3 => o_ucm2hps_ext_av(th_i) <= convert(ucm2hps_fifo(st_i)(th_i)(0).ucm2hps,o_ucm2hps_out_av(th_i));
                  when others => assert FALSE report "Error station in FIFO_RD" severity note;
                end case ;
                o_slc_event_ai(th_i) <= ucm2hps_fifo(st_i)(th_i)(0).event_id;
                slc_event_ai(st_i)(th_i) <= ucm2hps_fifo(st_i)(th_i)(0).event_id;
                for mv_i in TB_ucm2HPS_FIFO_WIDTH -1 downto 1 loop
                  ucm2hps_fifo(st_i)(th_i)(mv_i - 1) <= ucm2hps_fifo(st_i)(th_i)(mv_i);
                end loop;
                  ucm2hps_fifo_counters_v(st_i)(th_i) := ucm2hps_fifo_counters_v(st_i)(th_i) - 1;
              else
                -- o_mdt_event_ai(st_i)(th_i) <= (others => '0');
                -- o_slc_event_ai(th_i) <= (others => '0');
                case( st_i ) is
                  when 0 => o_ucm2hps_inn_av(th_i) <= zero(o_ucm2hps_inn_av(th_i)); o_slc_event_ai(th_i) <= (others => '0');  
                  when 1 => o_ucm2hps_mid_av(th_i) <= zero(o_ucm2hps_mid_av(th_i)); o_slc_event_ai(th_i) <= (others => '0');
                  when 2 => o_ucm2hps_out_av(th_i) <= zero(o_ucm2hps_out_av(th_i)); o_slc_event_ai(th_i) <= (others => '0');
                  when 3 => o_ucm2hps_ext_av(th_i) <= zero(o_ucm2hps_ext_av(th_i)); o_slc_event_ai(th_i) <= (others => '0');
                  when others => assert FALSE report "Error station in FIFO_RD" severity note;
                end case ;
              end if;
            end loop;
          end if ;

        end loop ; -- FIFO_RD
        -- read from CSV
        if first_read = '1' then
          csv_file.readline;
          ucm2hps_vr.ToS           :=csv_file.read_integer;
          ucm2hps_vr.ToA           :=csv_file.read_integer;
          ucm2hps_vr.event         :=csv_file.read_integer;
          ucm2hps_vr.thread        :=csv_file.read_integer;
          ucm2hps_vr.station       :=csv_file.read_integer;
          ucm2hps_vr.slc_id        :=csv_file.read_integer;
          ucm2hps_vr.slid          :=csv_file.read_integer;
          ucm2hps_vr.bcid          :=csv_file.read_integer;
          ucm2hps_vr.mdtseg_Dest   :=csv_file.read_integer;
          ucm2hps_vr.chamber_id    :=csv_file.read_integer;
          ucm2hps_vr.chamber_ieta  :=csv_file.read_integer;
          ucm2hps_vr.vec_pos       :=csv_file.read_integer;
          ucm2hps_vr.vec_ang       :=csv_file.read_integer;
          if g_verbose > 1 then
            puts("##### UCM2HPS( " & integer'image(row_counter) &
            " ): "& integer'image(ucm2hps_vr.ToS          ) &
            " : " & integer'image(ucm2hps_vr.ToA          ) &
            " : " & integer'image(ucm2hps_vr.event        ) &
            " : " & integer'image(ucm2hps_vr.thread       ) &
            " : " & integer'image(ucm2hps_vr.station      ) &
            " : " & integer'image(ucm2hps_vr.slc_id       ) &
            " : " & integer'image(ucm2hps_vr.slid         ) &
            " : " & integer'image(ucm2hps_vr.bcid         ) &
            " : " & integer'image(ucm2hps_vr.mdtseg_Dest  ) &
            " : " & integer'image(ucm2hps_vr.chamber_id   ) &
            " : " & integer'image(ucm2hps_vr.chamber_ieta ) &
            " : " & integer'image(ucm2hps_vr.vec_pos      ) &
            " : " & integer'image(ucm2hps_vr.vec_ang      )
            );
          end if;
          ucm_event_vr :=(
            ToS => to_unsigned(ucm2hps_vr.ToS,64),
            ToA => to_unsigned(ucm2hps_vr.ToA,64),
            event_id => to_unsigned(ucm2hps_vr.event,32),
            thread => to_unsigned(ucm2hps_vr.thread,4),
            station => to_unsigned(ucm2hps_vr.station,8),
            ucm2hps => (
              data_valid => '1',
              muid => (
                slcid => to_unsigned(ucm2hps_vr.slc_id,SLC_COMMON_SLCID_LEN),
                slid => to_unsigned(ucm2hps_vr.slid,SL_TRAILER_SLID_LEN),
                bcid => to_unsigned(ucm2hps_vr.bcid,SL_HEADER_BCID_LEN)
              ),
              mdtseg_dest => std_logic_vector(to_unsigned(ucm2hps_vr.mdtseg_dest,UCM2HPS_MDTSEG_DEST_LEN)),
              mdtid => (
                chamber_id => to_unsigned(ucm2hps_vr.chamber_id,VEC_MDTID_CHAMBER_ID_LEN),
                chamber_ieta => to_unsigned(ucm2hps_vr.chamber_ieta,VEC_MDTID_CHAMBER_IETA_LEN)
              ),
              vec_pos => to_unsigned(ucm2hps_vr.vec_pos,UCM2HPS_VEC_POS_LEN),
              vec_ang => to_unsigned(ucm2hps_vr.vec_ang,UCM2HPS_VEC_ANG_LEN)
            )
          );

          row_counter := row_counter +1;
          ucm_event_r <= ucm_event_vr;
          first_read := '0';
        end if;
        RL : while true loop
          if (ucm_event_vr.ToA < tb_curr_tdc_time) then
            if (csv_file.end_of_file = false) then
              FIFO_WR : for st_i in 0 to c_MAX_NUM_ST - 1 loop
                if c_ENABLED_ST(st_i) = '1' and g_ST_ENABLE(st_i) = '1' and to_integer(ucm_event_vr.station) = st_i then
                    ucm2hps_fifo(st_i)(to_integer(ucm_event_vr.thread))(ucm2hps_fifo_counters_v(st_i)(to_integer(ucm_event_vr.thread))) <= ucm_event_vr;
                    ucm2hps_fifo_counters_v(st_i)(to_integer(ucm_event_vr.thread)) := ucm2hps_fifo_counters_v(st_i)(to_integer(ucm_event_vr.thread) ) + 1;
                end if;
              end loop ; -- FIFO_WR
                csv_file.readline;
                ucm2hps_vr.ToS           :=csv_file.read_integer;
                ucm2hps_vr.ToA           :=csv_file.read_integer;
                ucm2hps_vr.event         :=csv_file.read_integer;
                ucm2hps_vr.thread        :=csv_file.read_integer;
                ucm2hps_vr.station       :=csv_file.read_integer;
                ucm2hps_vr.slc_id        :=csv_file.read_integer;
                ucm2hps_vr.slid          :=csv_file.read_integer;
                ucm2hps_vr.bcid          :=csv_file.read_integer;
                ucm2hps_vr.mdtseg_Dest   :=csv_file.read_integer;
                ucm2hps_vr.chamber_id    :=csv_file.read_integer;
                ucm2hps_vr.chamber_ieta  :=csv_file.read_integer;
                ucm2hps_vr.vec_pos       :=csv_file.read_integer;
                ucm2hps_vr.vec_ang       :=csv_file.read_integer;
                if g_verbose > 1 then
                  puts("##### UCM2HPS( " & integer'image(row_counter) &
                  " ): "& integer'image(ucm2hps_vr.ToS          ) &
                  " : " & integer'image(ucm2hps_vr.ToA          ) &
                  " : " & integer'image(ucm2hps_vr.event        ) &
                  " : " & integer'image(ucm2hps_vr.thread       ) &
                  " : " & integer'image(ucm2hps_vr.station      ) &
                  " : " & integer'image(ucm2hps_vr.slc_id       ) &
                  " : " & integer'image(ucm2hps_vr.slid         ) &
                  " : " & integer'image(ucm2hps_vr.bcid         ) &
                  " : " & integer'image(ucm2hps_vr.mdtseg_Dest  ) &
                  " : " & integer'image(ucm2hps_vr.chamber_id   ) &
                  " : " & integer'image(ucm2hps_vr.chamber_ieta ) &
                  " : " & integer'image(ucm2hps_vr.vec_pos      ) &
                  " : " & integer'image(ucm2hps_vr.vec_ang      )
                  );
                end if;
                ucm_event_vr :=(
                  ToS => to_unsigned(ucm2hps_vr.ToS,64),
                  ToA => to_unsigned(ucm2hps_vr.ToA,64),
                  event_id => to_unsigned(ucm2hps_vr.event,32),
                  thread => to_unsigned(ucm2hps_vr.thread,4),
                  station => to_unsigned(ucm2hps_vr.station,8),
                  ucm2hps => (
                    data_valid => '1',
                    muid => (
                      slcid => to_unsigned(ucm2hps_vr.slc_id,SLC_COMMON_SLCID_LEN),
                      slid => to_unsigned(ucm2hps_vr.slid,SL_TRAILER_SLID_LEN),
                      bcid => to_unsigned(ucm2hps_vr.bcid,SL_HEADER_BCID_LEN)
                    ),
                    mdtseg_dest => std_logic_vector(to_unsigned(ucm2hps_vr.mdtseg_dest,UCM2HPS_MDTSEG_DEST_LEN)),
                    mdtid => (
                      chamber_id => to_unsigned(ucm2hps_vr.chamber_id,VEC_MDTID_CHAMBER_ID_LEN),
                      chamber_ieta => to_unsigned(ucm2hps_vr.chamber_ieta,VEC_MDTID_CHAMBER_IETA_LEN)
                    ),
                    vec_pos => to_unsigned(ucm2hps_vr.vec_pos,UCM2HPS_VEC_POS_LEN),
                    vec_ang => to_unsigned(ucm2hps_vr.vec_ang,UCM2HPS_VEC_ANG_LEN)
                  )
                );
      
                row_counter := row_counter +1;
                ucm_event_r <= ucm_event_vr;
            else
              exit;
            end if;
          else
            exit;
          end if;
        end loop;
      end if ;
    end if;
  end if;
 end process READ_UCM;
  
end architecture sim;
--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Test Bench Module for Logic Trigger Path
--  Description: Hit input vector reader and injector
--
--------------------------------------------------------------------------------
--  Revisions:
--      2020.11.23 Creation 
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

entity ult_tb_reader_tdc is
  generic (
    IN_HIT_FILE       : string  := "csm_TB_A3_Barrel_yt_v04.txt";
    g_verbose         : integer := 1
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    enable            : in integer;
    --
    tb_curr_tdc_time  : in unsigned(63 downto 0) := (others => '0');
    -- Hits from Tar
    i_mdt_tdc_inn_av  : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => (others => '0'));
    i_mdt_tdc_mid_av  : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => (others => '0'));
    i_mdt_tdc_out_av  : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => (others => '0'));
    i_mdt_tdc_ext_av  : out tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => (others => '0'))


  );
end entity ult_tb_reader_tdc;

architecture sim of ult_tb_reader_tdc is

  -- signal mdt_tdc_station  : pol2tar_tb_at;
  signal mdt_tdc_station  : input_mdt_art;

  type infifo_hit_counts is array (integer range <>) of integer;

  -- type infifo_hit_mem_at is array (integer range <>) of pol2tar_tb_at;
  type infifo_hit_mem_at is array (integer range <>) of input_mdt_art;

  signal mdt_tdc_event_r  : input_mdt_rt;
  signal mdt_new_event    : input_mdt_rt;

  -- TDC Hits from Tar
  signal i_mdt_tdc_inn_ar :  tdcpolmux2tar_art (c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal i_mdt_tdc_mid_ar :  tdcpolmux2tar_art (c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal i_mdt_tdc_out_ar :  tdcpolmux2tar_art (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal i_mdt_tdc_ext_ar :  tdcpolmux2tar_art (c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  signal mdt_inn_fifo     : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => zero(mdt_tdc_station));
  signal mdt_mid_fifo     : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => zero(mdt_tdc_station));
  signal mdt_out_fifo     : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => zero(mdt_tdc_station));
  signal mdt_ext_fifo     : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => zero(mdt_tdc_station));
  
  signal mdt_inn_counts   : infifo_hit_counts(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => 0);
  signal mdt_mid_counts   : infifo_hit_counts(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => 0);
  signal mdt_out_counts   : infifo_hit_counts(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => 0);
  signal mdt_ext_counts   : infifo_hit_counts(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => 0);

  signal mdt_event_ai     : event_tdc_aut := (others => (others => (others => '0')));


  shared variable csv_file  : csv_file_type;
  signal  file_open         : std_logic := '0';   
  signal file_ts            : string(1 to LINE_LENGTH_MAX);
  
begin

  open_csv: process
    variable timestamp : string(1 to LINE_LENGTH_MAX);

    variable aux : string(1 to LINE_LENGTH_MAX);
  begin
    -- if first_read = '1' then
    puts("--------------------------------");
    puts("opening MDT CSV file : " & IN_HIT_FILE);
    csv_file.initialize(IN_HIT_FILE,"rd");
    csv_file.readline;
    while csv_file.read_isheader loop 
      aux := csv_file.read_string(' ');
      while not csv_file.end_of_line loop
        aux := csv_file.read_string(':');
        if aux(1 to 2) = "TS" then
          timestamp := csv_file.read_string(NUL);
          file_ts <= timestamp;
          puts("TimeStamp = ",timestamp);
        end if;
        if aux(1 to 4) = "Side" then
          puts("     Side = ",csv_file.read_string(' '));
        end if;
        if aux(1 to 6) = "Sector" then
          puts("   Sector = ",csv_file.read_string(' '));
        end if;
        if aux(1 to 4) = "Area" then
          puts("     Area = ",csv_file.read_string(' '));
        end if;
      end loop;
      csv_file.readline;
    end loop;
      file_open <= '1';
      puts("--------------------------------");

    -- end if;
    wait;
  end process open_csv;
  HIT_READ: process ( rst, clk)

    -- variable csv_file: csv_file_type;


    variable ToA  : integer;
    variable i_station        : integer;
    variable Chamber_id       : integer;
    variable Chamber_ieta     : integer;
    variable mdt_time_coarse  : integer;
    variable mdt_time_fine    : integer;
    variable tube_global      : integer;
    variable tube_local       : integer;
    variable tube_layer       : integer;
    variable tube_z           : integer;
    variable tube_rho         : integer;
    variable drift_time       : real;
    variable event            : integer;
    variable muonFixedId      : integer;
    variable csm              : integer;
    variable mezz             : integer;
    variable channel          : integer;
    variable t0               : real;
    variable TOF              : real;

    variable dummy_text  : string(1 to 100);
    variable ok : boolean;

    -- file input_mdt_tar_file       : text open read_mode is "/mnt/d/L0MDT/dev/hdl/l0mdt-fpga-design/shared/sim/vhdl_input_vect/csm_TB_A3_Barrel.txt";
    -- file input_mdt_tar_file       : text open read_mode is IN_HIT_FILE;
    variable row                  : line;
    variable row_counter          : integer := 0;

    -- variable tdc_time             : UNSIG_64;
    variable v_mdt_event          : input_mdt_rt;

    variable next_event_time      : integer := 0;
    variable tb_time              : integer := 0;

    variable first_read           : std_logic := '1';

    variable v_mdt_inn_counts     : infifo_hit_counts(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => 0);
    variable v_mdt_mid_counts     : infifo_hit_counts(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => 0);
    variable v_mdt_out_counts     : infifo_hit_counts(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => 0);
    variable v_mdt_ext_counts     : infifo_hit_counts(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => 0);

  begin

    -- tb_curr_time <= tb_time;

    if rising_edge(clk) then
      if(rst= '1') then

      else

        if enable = 1 then
        -- write to DUT

          for wr_i in c_HPS_NUM_MDT_CH_INN -1 downto 0 loop
            if(v_mdt_inn_counts(wr_i) > 0) then
              i_mdt_tdc_inn_av(wr_i) <= convert(mdt_inn_fifo(wr_i)(0).tdc,i_mdt_tdc_inn_av(wr_i));
              mdt_event_ai(0)(wr_i) <= mdt_inn_fifo(wr_i)(0).event;
              -- for test input read
              i_mdt_tdc_inn_ar(wr_i) <= mdt_inn_fifo(wr_i)(0).tdc;
              --
              for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
                mdt_inn_fifo(wr_i)(mv_i - 1) <= mdt_inn_fifo(wr_i)(mv_i);
              end loop;
              v_mdt_inn_counts(wr_i) := v_mdt_inn_counts(wr_i) - 1;
            else
              mdt_event_ai(0)(wr_i) <= (others => '0');
              i_mdt_tdc_inn_av(wr_i) <= zero(i_mdt_tdc_inn_av(wr_i));
              i_mdt_tdc_inn_ar(wr_i) <= zero(i_mdt_tdc_inn_ar(wr_i));
            end if;
          end loop;

          for wr_i in c_HPS_NUM_MDT_CH_MID -1 downto 0 loop
            if(v_mdt_mid_counts(wr_i) > 0) then
              i_mdt_tdc_mid_av(wr_i) <= convert(mdt_mid_fifo(wr_i)(0).tdc,i_mdt_tdc_mid_av(wr_i));
              mdt_event_ai(1)(wr_i) <= mdt_mid_fifo(wr_i)(0).event;

              -- for test input read
              i_mdt_tdc_mid_ar(wr_i) <= mdt_mid_fifo(wr_i)(0).tdc;
              --
              for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
                mdt_mid_fifo(wr_i)(mv_i - 1) <= mdt_mid_fifo(wr_i)(mv_i);
              end loop;
              v_mdt_mid_counts(wr_i) := v_mdt_mid_counts(wr_i) - 1;
            else
              mdt_event_ai(1)(wr_i) <= (others => '0');
              i_mdt_tdc_mid_av(wr_i) <= zero(i_mdt_tdc_mid_av(wr_i));
              i_mdt_tdc_mid_ar(wr_i) <= zero(i_mdt_tdc_mid_ar(wr_i));
            end if;
          end loop;

          for wr_i in c_HPS_NUM_MDT_CH_OUT -1 downto 0 loop
            if(v_mdt_out_counts(wr_i) > 0) then
              i_mdt_tdc_out_av(wr_i) <= convert(mdt_out_fifo(wr_i)(0).tdc,i_mdt_tdc_out_av(wr_i));
              mdt_event_ai(2)(wr_i) <= mdt_out_fifo(wr_i)(0).event;

              -- for test input read
              i_mdt_tdc_out_ar(wr_i) <= mdt_out_fifo(wr_i)(0).tdc;
              --
              for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
                mdt_out_fifo(wr_i)(mv_i - 1) <= mdt_out_fifo(wr_i)(mv_i);
              end loop;
              v_mdt_out_counts(wr_i) := v_mdt_out_counts(wr_i) - 1;
            else
              mdt_event_ai(2)(wr_i) <= (others => '0');
              i_mdt_tdc_out_av(wr_i) <= zero(i_mdt_tdc_out_av(wr_i));
              i_mdt_tdc_out_ar(wr_i) <= zero(i_mdt_tdc_out_ar(wr_i));
            end if;
          end loop;

          for wr_i in c_HPS_NUM_MDT_CH_EXT -1 downto 0 loop
            if(v_mdt_ext_counts(wr_i) > 0) then
              i_mdt_tdc_ext_av(wr_i) <= convert(mdt_ext_fifo(wr_i)(0).tdc,i_mdt_tdc_ext_av(wr_i));
              mdt_event_ai(3)(wr_i) <= mdt_ext_fifo(wr_i)(0).event;

              -- for test input read
              i_mdt_tdc_ext_ar(wr_i) <= mdt_ext_fifo(wr_i)(0).tdc;
              --
              for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
                mdt_ext_fifo(wr_i)(mv_i - 1) <= mdt_ext_fifo(wr_i)(mv_i);
              end loop;
              v_mdt_ext_counts(wr_i) := v_mdt_ext_counts(wr_i) - 1;
            else
              mdt_event_ai(3)(wr_i) <= (others => '0');
              i_mdt_tdc_ext_av(wr_i) <= zero(i_mdt_tdc_ext_av(wr_i));
              i_mdt_tdc_ext_ar(wr_i) <= zero(i_mdt_tdc_ext_ar(wr_i));
            end if;
          end loop;

          -- first read from input vector file
          if first_read = '1' then
            -- if g_verbose > 0 then
            --   puts("opening MDT CSV file : " & IN_HIT_FILE);
            -- end if;
            -- csv_file.initialize(IN_HIT_FILE,"rd");
            -- csv_file.readline;
            -- while csv_file.read_isheader loop 
            --   puts("H : ",csv_file.read_string);
            --   csv_file.readline;
            -- end loop;
            csv_file.readline;

            ToA              := csv_file.read_integer;
            mdt_time_coarse  := csv_file.read_integer;
            mdt_time_fine    := csv_file.read_integer;
            tube_local       := csv_file.read_integer;
            tube_global      := csv_file.read_integer;
            tube_layer       := csv_file.read_integer;
            Chamber_id       := csv_file.read_integer;
            Chamber_ieta     := csv_file.read_integer - 1;
            i_station        := csv_file.read_integer;
            tube_z           := csv_file.read_integer;
            tube_rho         := csv_file.read_integer;
            drift_time       := csv_file.read_real;
            event            := csv_file.read_integer;
            muonFixedId      := csv_file.read_integer;
            csm              := csv_file.read_integer;
            mezz             := csv_file.read_integer;
            channel          := csv_file.read_integer;
            t0               := csv_file.read_real;
            TOF              := csv_file.read_real;
            
            if g_verbose > 1 then
              puts("##### MDT( " & integer'image(row_counter) &
              " ): "& integer'image(ToA             ) &
              " : " & integer'image(i_station       ) &
              " : " & integer'image(Chamber_id      ) &
              " : " & integer'image(Chamber_ieta    ) &
              " : " & integer'image(mdt_time_coarse ) &
              " : " & integer'image(mdt_time_fine   ) &
              " : " & integer'image(tube_global     ) &
              " : " & integer'image(tube_local      ) &
              " : " & integer'image(tube_layer      ) &
              " : " & integer'image(tube_z          ) &
              " : " & integer'image(tube_rho        ) &
              " : " & real'image(drift_time      ) &
              " : " & integer'image(event           ) &
              " : " & integer'image(muonFixedId     ) &
              " : " & integer'image(csm             ) &
              " : " & integer'image(mezz            ) &
              " : " & integer'image(channel         ) &
              " : " & real'image(t0              ) &
              " : " & real'image(TOF             )
              );
            end if;

            v_mdt_event := (
              ToA => to_unsigned(ToA,64),
              Station => to_unsigned(i_Station,8),
              Chamber => to_unsigned(chamber_ieta,SLC_CHAMBER_LEN),
              event => to_unsigned(event , 32),
              -- tar => (  
              --   tube => to_unsigned(tube_global,MDT_TUBE_LEN),
              --   layer => to_unsigned(tube_layer,MDT_LAYER_LEN),
              --   chamber_ieta => to_unsigned(chamber_ieta,SLC_CHAMBER_LEN),
              --   time => to_unsigned((mdt_time_coarse * 32) + mdt_time_fine ,TDC_COARSETIME_LEN + 5), -- & to_unsigned(mdt_time_fine,TDC_COARSETIME_LEN),
              --   data_valid => '1'
              -- ),
              tdc => (
                data_valid => '1',
                tdc => (
                  chanid => to_unsigned(channel,TDC_CHANID_LEN),
                  edgemode => (others => '0'),
                  coarsetime => to_unsigned(mdt_time_coarse,TDC_COARSETIME_LEN),
                  finetime => to_unsigned(mdt_time_fine,TDC_FINETIME_LEN),
                  pulsewidth => ( others => '0')
                ),
                csmid => to_unsigned( chamber_ieta, TDCPOLMUX2TAR_CSMID_LEN),
                tdcid => to_unsigned( mezz, TDCPOLMUX2TAR_TDCID_LEN)
              )
            );

            -- readline(input_mdt_tar_file,row); -- reads header and ignores
            -- readline(input_mdt_tar_file,row);
            -- read(row, v_mdt_event);
            mdt_tdc_event_r <= v_mdt_event;
            row_counter := row_counter +1;

            -- report "Read line : " & integer'image(row_counter);
            first_read := '0';
          end if;


          -- read from input vector file
          RL : while true loop
            if (v_mdt_event.ToA < tb_curr_tdc_time) then
              -- puts("toa - ",to_integer(v_mdt_event.ToA)," ::: tdc - ",to_integer(tb_curr_tdc_time));
              -- puts("v_mdt_event.station - ",to_integer(v_mdt_event.station)," ::: tdc - ",to_integer(v_mdt_event.chamber));
              -- i_mdt_tar_av <= mdt_tdc_event_r.tar;
              if (csv_file.end_of_file = false) then

                if to_integer(v_mdt_event.station) = 0 then
                  if c_HPS_ENABLED_HP_INN(to_integer(v_mdt_event.chamber)) = '1' then
                    mdt_inn_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_inn_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event;
                    v_mdt_inn_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_inn_counts(to_integer(v_mdt_event.chamber) ) + 1;
                  end if;
                elsif to_integer(v_mdt_event.station) = 1 then
                  if c_HPS_ENABLED_HP_MID(to_integer(v_mdt_event.chamber)) = '1' then
                    mdt_mid_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_mid_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event;
                    v_mdt_mid_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_mid_counts(to_integer(v_mdt_event.chamber) ) + 1;
                  end if;
                elsif to_integer(v_mdt_event.station) = 2 then
                  if c_HPS_ENABLED_HP_OUT(to_integer(v_mdt_event.chamber)) = '1' then
                    mdt_out_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_out_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event;
                    v_mdt_out_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_out_counts(to_integer(v_mdt_event.chamber) ) + 1;
                  end if;
                elsif to_integer(v_mdt_event.station) = 3 then
                  if c_HPS_ENABLED_HP_EXT(to_integer(v_mdt_event.chamber)) = '1' then
                    mdt_ext_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_ext_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event;
                    v_mdt_ext_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_ext_counts(to_integer(v_mdt_event.chamber) ) + 1;
                  end if;
                else
                  -- ERROR
                end if;
                csv_file.readline;

                ToA              := csv_file.read_integer;
                mdt_time_coarse  := csv_file.read_integer;
                mdt_time_fine    := csv_file.read_integer;
                tube_local       := csv_file.read_integer;
                tube_global      := csv_file.read_integer;
                tube_layer       := csv_file.read_integer;
                Chamber_id       := csv_file.read_integer;
                Chamber_ieta     := csv_file.read_integer - 1;
                i_station        := csv_file.read_integer;
                tube_z           := csv_file.read_integer;
                tube_rho         := csv_file.read_integer;
                drift_time       := csv_file.read_real;
                event            := csv_file.read_integer;
                muonFixedId      := csv_file.read_integer;
                csm              := csv_file.read_integer;
                mezz             := csv_file.read_integer;
                channel          := csv_file.read_integer;
                t0               := csv_file.read_real;
                TOF              := csv_file.read_real;
    
                if g_verbose > 1 then
    
                  puts("##### MDT( " & integer'image(row_counter) &
                  " ): "& integer'image(ToA             ) &
                  " : " & integer'image(i_station       ) &
                  " : " & integer'image(Chamber_id      ) &
                  " : " & integer'image(Chamber_ieta    ) &
                  " : " & integer'image(mdt_time_coarse ) &
                  " : " & integer'image(mdt_time_fine   ) &
                  " : " & integer'image(tube_global     ) &
                  " : " & integer'image(tube_local      ) &
                  " : " & integer'image(tube_layer      ) &
                  " : " & integer'image(tube_z          ) &
                  " : " & integer'image(tube_rho        ) &
                  " : " & real'image(drift_time      ) &
                  " : " & integer'image(event           ) &
                  " : " & integer'image(muonFixedId     ) &
                  " : " & integer'image(csm             ) &
                  " : " & integer'image(mezz            ) &
                  " : " & integer'image(channel         ) &
                  " : " & real'image(t0              ) &
                  " : " & real'image(TOF             )
                  );

                end if;
    
                v_mdt_event := (
                  ToA => to_unsigned(ToA,64),
                  Station => to_unsigned(i_Station,8),
                  Chamber => to_unsigned(chamber_ieta,SLC_CHAMBER_LEN),
              event => to_unsigned(event , 32),

                  -- tar => (  
                  --   tube => to_unsigned(tube_global,MDT_TUBE_LEN),
                  --   layer => to_unsigned(tube_layer,MDT_LAYER_LEN),
                  --   chamber_ieta => to_unsigned(chamber_ieta,SLC_CHAMBER_LEN),
                  --   time => to_unsigned((mdt_time_coarse * 32) + mdt_time_fine ,TDC_COARSETIME_LEN + 5), -- & to_unsigned(mdt_time_fine,TDC_COARSETIME_LEN),
                  --   data_valid => '1'
                  -- ),
                  tdc => (
                    data_valid => '1',
                    tdc => (
                      chanid => to_unsigned(channel,TDC_CHANID_LEN),
                      edgemode => (others => '0'),
                      coarsetime => to_unsigned(mdt_time_coarse,TDC_COARSETIME_LEN),
                      finetime => to_unsigned(mdt_time_fine,TDC_FINETIME_LEN),
                      pulsewidth => ( others => '0')
                    ),
                    csmid => to_unsigned( chamber_ieta, TDCPOLMUX2TAR_CSMID_LEN),
                    tdcid => to_unsigned( mezz, TDCPOLMUX2TAR_TDCID_LEN)
                  )
                );
                row_counter := row_counter +1;
    
                -- readline(input_mdt_tar_file,row); -- reads header and ignores
                -- readline(input_mdt_tar_file,row);
                -- read(row, v_mdt_event);
                mdt_tdc_event_r <= v_mdt_event;

                -- readline(input_mdt_tar_file,row);
                -- read(row, v_mdt_event);
                -- mdt_tdc_event_r <= v_mdt_event;
                -- report "Read line : " & integer'image(row_counter);
              else
                exit;
              end if;
            else
              -- i_mdt_tar_av <= zero(i_mdt_tar_av);
              exit;
            end if;
          end loop;





        end if;

        mdt_inn_counts <= v_mdt_inn_counts;
        mdt_mid_counts <= v_mdt_mid_counts;
        mdt_out_counts <= v_mdt_out_counts;
        mdt_ext_counts <= v_mdt_ext_counts;



        -- tb_curr_time <= tb_curr_time + '1';
      end if;
    end if;

  end process;

  
end architecture sim;
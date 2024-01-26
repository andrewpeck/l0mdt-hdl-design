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

-- library project_lib;
-- use project_lib.gldl_ult_tp_sim_pkg.all;
-- use project_lib.ult_textio_rd_tdc_pkg.all;

entity ult_tb_reader_tar is
  generic (
    IN_HIT_FILE       : string  := "csm_TB_A3_Barrel_yt_v04.txt"
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    enable            : in integer;
    --
    tb_curr_tdc_time  : in unsigned(63 downto 0) := (others => '0');
    -- Hits from Tar
    i_mdt_tar_inn_av  : out tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => (others => '0'));
    i_mdt_tar_mid_av  : out tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => (others => '0'));
    i_mdt_tar_out_av  : out tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => (others => '0'));
    i_mdt_tar_ext_av  : out tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => (others => '0'))

  );
end entity ult_tb_reader_tar;

architecture sim of ult_tb_reader_tar is

  signal mdt_tar_station  : tar2hps_tb_at;

  type infifo_hit_counts is array (integer range <>) of integer;

  type infifo_hit_mem_at is array (integer range <>) of tar2hps_tb_at;

  signal mdt_tar_event_r  : input_mdt_rt;
  signal mdt_new_event    : input_mdt_rt;

  -- TDC Hits from Tar
  signal i_mdt_tar_inn_ar :  tar2hps_art (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal i_mdt_tar_mid_ar :  tar2hps_art (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal i_mdt_tar_out_ar :  tar2hps_art (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal i_mdt_tar_ext_ar :  tar2hps_art (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  signal mdt_inn_fifo     : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => zero(mdt_tar_station));
  signal mdt_mid_fifo     : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => zero(mdt_tar_station));
  signal mdt_out_fifo     : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => zero(mdt_tar_station));
  signal mdt_ext_fifo     : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => zero(mdt_tar_station));
  
  signal mdt_inn_counts   : infifo_hit_counts(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => 0);
  signal mdt_mid_counts   : infifo_hit_counts(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => 0);
  signal mdt_out_counts   : infifo_hit_counts(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => 0);
  signal mdt_ext_counts   : infifo_hit_counts(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => 0);
  
begin
  
  
  HIT_READ: process ( rst, clk)

    -- file input_mdt_tar_file       : text open read_mode is "/mnt/d/L0MDT/dev/hdl/l0mdt-fpga-design/shared/sim/vhdl_input_vect/csm_TB_A3_Barrel.txt";
    file input_mdt_tar_file       : text open read_mode is IN_HIT_FILE;
    variable row                  : line;
    variable row_counter          : integer := 0;

    -- variable tdc_time             : UNSIG_64;
    variable v_mdt_event            : input_mdt_rt;

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
              i_mdt_tar_inn_av(wr_i) <= convert(mdt_inn_fifo(wr_i)(0));
              -- for test input read
              i_mdt_tar_inn_ar(wr_i) <= mdt_inn_fifo(wr_i)(0);
              --
              for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
                mdt_inn_fifo(wr_i)(mv_i - 1) <= mdt_inn_fifo(wr_i)(mv_i);
              end loop;
              v_mdt_inn_counts(wr_i) := v_mdt_inn_counts(wr_i) - 1;
            else
              i_mdt_tar_inn_av(wr_i) <= zero(i_mdt_tar_inn_av(wr_i));
              i_mdt_tar_inn_ar(wr_i) <= zero(i_mdt_tar_inn_ar(wr_i));
            end if;
          end loop;

          for wr_i in c_HPS_NUM_MDT_CH_MID -1 downto 0 loop
            if(v_mdt_mid_counts(wr_i) > 0) then
              i_mdt_tar_mid_av(wr_i) <= convert(mdt_mid_fifo(wr_i)(0));
              -- for test input read
              i_mdt_tar_mid_ar(wr_i) <= mdt_mid_fifo(wr_i)(0);
              --
              for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
                mdt_mid_fifo(wr_i)(mv_i - 1) <= mdt_mid_fifo(wr_i)(mv_i);
              end loop;
              v_mdt_mid_counts(wr_i) := v_mdt_mid_counts(wr_i) - 1;
            else
              i_mdt_tar_mid_av(wr_i) <= zero(i_mdt_tar_mid_av(wr_i));
              i_mdt_tar_mid_ar(wr_i) <= zero(i_mdt_tar_mid_ar(wr_i));
            end if;
          end loop;

          for wr_i in c_HPS_NUM_MDT_CH_OUT -1 downto 0 loop
            if(v_mdt_out_counts(wr_i) > 0) then
              i_mdt_tar_out_av(wr_i) <= convert(mdt_out_fifo(wr_i)(0));
              -- for test input read
              i_mdt_tar_out_ar(wr_i) <= mdt_out_fifo(wr_i)(0);
              --
              for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
                mdt_out_fifo(wr_i)(mv_i - 1) <= mdt_out_fifo(wr_i)(mv_i);
              end loop;
              v_mdt_out_counts(wr_i) := v_mdt_out_counts(wr_i) - 1;
            else
              i_mdt_tar_out_av(wr_i) <= zero(i_mdt_tar_out_av(wr_i));
              i_mdt_tar_out_ar(wr_i) <= zero(i_mdt_tar_out_ar(wr_i));
            end if;
          end loop;

          for wr_i in c_HPS_NUM_MDT_CH_EXT -1 downto 0 loop
            if(v_mdt_ext_counts(wr_i) > 0) then
              i_mdt_tar_ext_av(wr_i) <= convert(mdt_ext_fifo(wr_i)(0));
              -- for test input read
              i_mdt_tar_ext_ar(wr_i) <= mdt_ext_fifo(wr_i)(0);
              --
              for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
                mdt_ext_fifo(wr_i)(mv_i - 1) <= mdt_ext_fifo(wr_i)(mv_i);
              end loop;
              v_mdt_ext_counts(wr_i) := v_mdt_ext_counts(wr_i) - 1;
            else
              i_mdt_tar_ext_av(wr_i) <= zero(i_mdt_tar_ext_av(wr_i));
              i_mdt_tar_ext_ar(wr_i) <= zero(i_mdt_tar_ext_ar(wr_i));
            end if;
          end loop;

          -- first read from input vector file
          if (not endfile(input_mdt_tar_file)) and first_read = '1' then
            row_counter := row_counter +1;
            readline(input_mdt_tar_file,row); -- reads header and ignores
            readline(input_mdt_tar_file,row);
            read(row, v_mdt_event);
            mdt_tar_event_r <= v_mdt_event;
            report "Read line : " & integer'image(row_counter);
            first_read := '0';
          end if;


          -- read from input vector file
          RL : while true loop
            if (v_mdt_event.ToA < tb_curr_tdc_time) then
              -- i_mdt_tar_av <= mdt_tar_event_r.tar;
              if (endfile(input_mdt_tar_file) = false) then

                if to_integer(v_mdt_event.station) = 0 then
                  if c_HPS_ENABLED_HP_INN(to_integer(v_mdt_event.chamber)) = '1' then
                    mdt_inn_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_inn_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event.tar;
                    v_mdt_inn_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_inn_counts(to_integer(v_mdt_event.chamber) ) + 1;
                  end if;
                elsif to_integer(v_mdt_event.station) = 1 then
                  if c_HPS_ENABLED_HP_MID(to_integer(v_mdt_event.chamber)) = '1' then
                    mdt_mid_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_mid_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event.tar;
                    v_mdt_mid_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_mid_counts(to_integer(v_mdt_event.chamber) ) + 1;
                  end if;
                elsif to_integer(v_mdt_event.station) = 2 then
                  if c_HPS_ENABLED_HP_OUT(to_integer(v_mdt_event.chamber)) = '1' then
                    mdt_out_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_out_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event.tar;
                    v_mdt_out_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_out_counts(to_integer(v_mdt_event.chamber) ) + 1;
                  end if;
                elsif to_integer(v_mdt_event.station) = 3 then
                  if c_HPS_ENABLED_HP_EXT(to_integer(v_mdt_event.chamber)) = '1' then
                    mdt_ext_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_ext_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event.tar;
                    v_mdt_ext_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_ext_counts(to_integer(v_mdt_event.chamber) ) + 1;
                  end if;
                else
                  -- ERROR
                end if;
                row_counter := row_counter +1;
                readline(input_mdt_tar_file,row);
                read(row, v_mdt_event);
                mdt_tar_event_r <= v_mdt_event;
                report "Read line : " & integer'image(row_counter);
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
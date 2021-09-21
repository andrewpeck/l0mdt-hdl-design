--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Test Bench Module for Logic Trigger Path
--  Description: SLC input vector reader and injector
--
--------------------------------------------------------------------------------
--  Revisions:
--      2020.11.24 Creation 
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
use shared_lib.detector_param_pkg.all;

library project_lib;
use project_lib.ult_tb_sim_pkg.all;
use project_lib.vhdl_tb_utils_pkg.all;
use project_lib.vhdl_textio_csv_pkg.all;
-- use project_lib.ult_textio_rd_slc_pkg.all;


entity ult_tb_reader_slc is
  generic (
    IN_SLC_FILE         : string  := "slc_TB_A3_Barrel_yt_v04.txt"
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    enable                : in integer;
    --
    tb_curr_tdc_time      : in unsigned(63 downto 0) := (others => '0');
    -- Sector Logic Candidates
    i_main_primary_slc    : out slc_rx_bus_avt(2 downto 0) := (others => (others => '0'));  -- is the main SL used
    i_main_secondary_slc  : out slc_rx_bus_avt(2 downto 0) := (others => (others => '0'));  -- only used in the big endcap
    i_plus_neighbor_slc   : out slc_rx_rvt := (others => '0');
    i_minus_neighbor_slc  : out slc_rx_rvt := (others => '0')
  );
end entity ult_tb_reader_slc;

architecture sim of ult_tb_reader_slc is

  -- Sector Logic Candidates
  signal i_main_primary_slc_ar      : slc_rx_bus_at(2 downto 0);  -- is the main SL used
  signal i_main_secondary_slc_ar    : slc_rx_bus_at(2 downto 0);  -- only used in the big endcap
  signal i_plus_neighbor_slc_ar     : slc_rx_rt;
  signal i_minus_neighbor_slc_ar    : slc_rx_rt;

  type infifo_slc_counts is array (integer range <>) of integer;

  type infifo_slc_mem_at is array (integer range <>) of slc_tb_at;

  signal slc_element          : slc_tb_at := structify(std_logic_vector(to_unsigned(0,SLC_RX_LEN * TB_SLC_FIFO_WIDTH)));

  signal slc_event_r          : input_slc_b_rt;
  signal slc_new_event        : input_slc_b_rt;

  signal slc_main_prim_fifo   : infifo_slc_mem_at(2 downto 0) := (others => nullify(slc_element));
  signal slc_main_seco_fifo   : infifo_slc_mem_at(2 downto 0) := (others => nullify(slc_element));
  signal slc_neig_plus_fifo   : infifo_slc_mem_at(0 downto 0) := (others => nullify(slc_element));
  signal slc_neig_minu_fifo   : infifo_slc_mem_at(0 downto 0) := (others => nullify(slc_element));

  signal slc_main_prim_counts : infifo_slc_counts(2 downto 0) := (others => 0);
  signal slc_main_seco_counts : infifo_slc_counts(2 downto 0) := (others => 0);
  signal slc_neig_plus_counts : infifo_slc_counts(0 downto 0) := (others => 0);
  signal slc_neig_minu_counts : infifo_slc_counts(0 downto 0) := (others => 0);
  
  
begin
  
  SLC_READ: process ( rst, clk)


    variable csv_file: csv_file_reader_type;

    variable BCID         : integer; 
    variable ToA          : integer; 
    variable nTC          : integer; 
    variable TC_sent      : integer; 
    variable TC_id        : integer; 
    variable Eta          : real; 
    variable Phi          : real; 
    variable pT_thr       : integer; 
    variable Charge       : integer; 
    variable Coincidence  : integer; 
    variable z_RPC0       : integer; 
    variable z_RPC1       : integer; 
    variable z_RPC2       : integer; 
    variable z_RPC3       : integer; 

    variable header       : sl_header_rt;
    variable trailer      : sl_trailer_rt;
    variable common       : slc_common_rt;
    variable specific     : slc_barrel_rt;

    -- file input_slc_file         : text open read_mode is "/mnt/d/L0MDT/dev/hdl/l0mdt-fpga-design/shared/sim/vhdl_input_vect/slc_TB_A3_Barrel.txt";
    -- file input_slc_file         : text open read_mode is IN_SLC_FILE;
    variable row                : line;
    variable row_counter        : integer := 0;
    -- variable tdc_time           : UNSIG_64;
    variable v_slc_event        : input_slc_b_rt;
    -- variable next_event_time    : integer := 0;
    -- variable tb_time            : integer := 0;
    variable first_read         : std_logic := '1';

    variable v_slc_main_prim_counts : infifo_slc_counts(3 -1 downto 0) := (others => 0);
    variable v_slc_main_seco_counts : infifo_slc_counts(3 -1 downto 0) := (others => 0);
    variable v_slc_neig_plus_counts : infifo_slc_counts(1 -1 downto 0) := (others => 0);
    variable v_slc_neig_minu_counts : infifo_slc_counts(1 -1 downto 0) := (others => 0);

  begin

    -- puts("opening CSV files : " & IN_SLC_FILE);
    -- csv_file.initialize(IN_SLC_FILE);

    if rising_edge(clk) then
      if rst = '1' then

      else

        if enable = 1 then

          -- write to DUT

          for wr_i in 2 downto 0 loop
            if(v_slc_main_prim_counts(wr_i) > 0) then
              i_main_primary_slc(wr_i) <= vectorify(slc_main_prim_fifo(wr_i)(0));
              -- for test input read
              i_main_primary_slc_ar(wr_i) <= slc_main_prim_fifo(wr_i)(0);
              --
              for mv_i in TB_SLC_FIFO_WIDTH -1 downto 1 loop
                slc_main_prim_fifo(wr_i)(mv_i - 1) <= slc_main_prim_fifo(wr_i)(mv_i);
              end loop;
              v_slc_main_prim_counts(wr_i) := v_slc_main_prim_counts(wr_i) - 1;
            else
              i_main_primary_slc(wr_i) <= nullify(i_main_primary_slc(wr_i));
              i_main_primary_slc_ar(wr_i) <= nullify(i_main_primary_slc_ar(wr_i));
            end if;
          end loop;

          -- read from file
          -- first read from input vector file
          if first_read = '1' then
            puts("opening CSV files : " & IN_SLC_FILE);
            csv_file.initialize(IN_SLC_FILE);
            csv_file.readline;
            csv_file.readline;
            -- extract(csv_file,v_slc_event);
            BCID := csv_file.read_integer;
            ToA := csv_file.read_integer;
            puts("BCID = ", BCID);
            puts("ToA = ", ToA);
            puts("---------");
            -- puts(slc_event_r.ToA)
            -- slc_event_r.
            -- row_counter := row_counter +1;
            -- readline(input_slc_file,row); -- reads header and ignores
            -- readline(input_slc_file,row);
            -- read(row, v_slc_event);
            -- slc_event_r <= v_slc_event;
            -- report "Read line : " & integer'image(row_counter);
            first_read := '0';
          end if;

          /*
            -- read from file
            -- first read from input vector file
            if (not endfile(input_slc_file)) and first_read = '1' then
              row_counter := row_counter +1;
              readline(input_slc_file,row); -- reads header and ignores
              readline(input_slc_file,row);
              read(row, v_slc_event);
              slc_event_r <= v_slc_event;
              report "Read line : " & integer'image(row_counter);
              first_read := '0';
            end if;
            

            -- read from input vector file
            RL : while true loop
              if (v_slc_event.ToA < tb_curr_tdc_time) then
                -- i_mdt_tar_av <= mdt_tar_event_r.tar;
                if (endfile(input_slc_file) = false) then

                  if v_slc_event.slc.common.slcid < 3 then
                    slc_main_prim_fifo(2 - to_integer(v_slc_event.slc.common.slcid))(v_slc_main_prim_counts(2 - to_integer(v_slc_event.slc.common.slcid))) <= v_slc_event.slc;
                    v_slc_main_prim_counts(2 - to_integer(v_slc_event.slc.common.slcid)) := v_slc_main_prim_counts(2 - to_integer(v_slc_event.slc.common.slcid)) + 1;
                  end if;

                  row_counter := row_counter +1;
                  readline(input_slc_file,row);
                  read(row, v_slc_event);
                  slc_event_r <= v_slc_event;
                  report "Read line : " & integer'image(row_counter);
                else
                  exit;
                end if;
              else
                -- i_mdt_tar_av <= nullify(i_mdt_tar_av);
                exit;
              end if;
            end loop;
          */

        end if;
        

      end if;
    end if;

    csv_file.dispose;
  end process;
  
end architecture sim;
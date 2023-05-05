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

use shared_lib.vhdl_tb_utils_pkg.all;

library project_lib;
use project_lib.ult_tb_sim_pkg.all;
use project_lib.ult_tb_sim_cstm_pkg.all;
-- use project_lib.vhdl_tb_utils_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;


entity ult_tb_reader_slc is
  generic (
    IN_SLC_FILE         : string  := "slc_TB_A3_Barrel_yt_v04.txt";
    g_verbose         : integer := 1
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    enable                : in integer;
    --
    tb_curr_tdc_time      : in unsigned(63 downto 0) := (others => '0');
    -- Sector Logic Candidates
    o_main_primary_slc    : out slc_rx_avt(2 downto 0) := (others => (others => '0'));  -- is the main SL used
    o_main_secondary_slc  : out slc_rx_avt(2 downto 0) := (others => (others => '0'));  -- only used in the big endcap
    o_plus_neighbor_slc   : out slc_rx_vt := (others => '0');
    o_minus_neighbor_slc  : out slc_rx_vt := (others => '0')

    -- o_slc_event_ai : out event_aut(c_MAX_NUM_SL -1 downto 0) := (others => (others => '0'))
  );
end entity ult_tb_reader_slc;

architecture sim of ult_tb_reader_slc is

  -- Sector Logic Candidates
  -- signal o_main_primary_slc_ar      : slc_rx_bus_at(2 downto 0);  -- is the main SL used
  -- signal o_main_secondary_slc_ar    : slc_rx_bus_at(2 downto 0);  -- only used in the big endcap
  -- signal o_plus_neighbor_slc_ar     : slc_rx_rt;
  -- signal o_minus_neighbor_slc_ar    : slc_rx_rt;

  signal temp_slc_rx_vt : slc_rx_vt;
  constant SLC_RX_LEN : integer := temp_slc_rx_vt'length;

  type infifo_slc_counts is array (integer range <>) of integer;

  type infifo_slc_mem_at is array (integer range <>) of slc_tb_art;
  type infifo_event_mem_at is array (integer range <>) of input_slc_art;

  signal slc_element_temp     : slc_tb_art;-- := zero(slc_element);
  signal slc_element          : slc_tb_art := zero(slc_element_temp);
  -- signal slc_element          : slc_tb_art := convert(std_logic_vector(to_unsigned(0,SLC_RX_LEN * TB_SLC_FIFO_WIDTH)),slc_element);
  signal event_element_temp   : input_slc_art;-- := zero(event_element);
  signal event_element        : input_slc_art := zero(event_element_temp);
  -- signal event_element        : input_slc_art := convert(std_logic_vector(to_unsigned(0,INPUT_SLC_LEN * TB_SLC_FIFO_WIDTH)),event_element);

  signal slc_event_r          : input_slc_rt;
  signal slc_new_event        : input_slc_rt;

  signal event_main_prim_fifo : infifo_event_mem_at(2 downto 0) := (others => zero(event_element));
  signal slc_event_ai         : event_aut(c_MAX_NUM_SL -1 downto 0) := (others => (others => '0'));

  signal slc_main_prim_fifo   : infifo_slc_mem_at(2 downto 0) := (others => zero(slc_element));
  signal slc_main_seco_fifo   : infifo_slc_mem_at(2 downto 0) := (others => zero(slc_element));
  signal slc_neig_plus_fifo   : infifo_slc_mem_at(0 downto 0) := (others => zero(slc_element));
  signal slc_neig_minu_fifo   : infifo_slc_mem_at(0 downto 0) := (others => zero(slc_element));

  signal slc_main_prim_counts : infifo_slc_counts(2 downto 0) := (others => 0);
  signal slc_main_seco_counts : infifo_slc_counts(2 downto 0) := (others => 0);
  signal slc_neig_plus_counts : infifo_slc_counts(0 downto 0) := (others => 0);
  signal slc_neig_minu_counts : infifo_slc_counts(0 downto 0) := (others => 0);
  
  shared variable csv_file: csv_file_type;
  signal  file_open         : std_logic := '0';
  signal file_ts : string(1 to LINE_LENGTH_MAX);
    
  
begin

  open_csv: process
    variable timestamp : string(1 to LINE_LENGTH_MAX);

    variable aux : string(1 to LINE_LENGTH_MAX);
  begin
    -- if first_read = '1' then
      -- if g_verbose > 0 then
      puts("--------------------------------");
      puts("opening SLC CSV");
      puts("     file = " , IN_SLC_FILE);
      csv_file.initialize(IN_SLC_FILE,"rd");
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
      -- csv_file.readline;
      file_open <= '1';
      puts("--------------------------------");
    -- end if;
    wait;
  end process open_csv;
  
  SLC_READ: process ( rst, clk)


    -- variable csv_file: csv_file_type;

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
    variable event        : integer;

    variable header       : sl_header_rt;
    variable trailer      : sl_trailer_rt;
    variable common       : slc_common_rt;
    variable specific_r     : slc_barrel_rt;
    variable specific_v     : slc_barrel_vt;

    variable tcoverflow : std_logic;

    variable ol : line;

    -- file input_slc_file         : text open read_mode is "/mnt/d/L0MDT/dev/hdl/l0mdt-fpga-design/shared/sim/vhdl_input_vect/slc_TB_A3_Barrel.txt";
    -- file input_slc_file         : text open read_mode is IN_SLC_FILE;
    variable row                : line;
    variable row_counter        : integer := 0;
    -- variable tdc_time           : UNSIG_64;
    variable v_slc_event        : input_slc_rt;
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
              -- o_main_primary_slc(wr_i) <= convert(slc_main_prim_fifo(wr_i)(0));
              o_main_primary_slc(wr_i) <= convert(event_main_prim_fifo(wr_i)(0).slc,o_main_primary_slc(wr_i));
              --
              slc_event_ai(wr_i + 2) <= event_main_prim_fifo(wr_i)(0).event;
              -- for test input read
              -- o_main_primary_slc_ar(wr_i) <= slc_main_prim_fifo(wr_i)(0);
              --
              for mv_i in TB_SLC_FIFO_WIDTH -1 downto 1 loop
                slc_main_prim_fifo(wr_i)(mv_i - 1) <= slc_main_prim_fifo(wr_i)(mv_i);
              end loop;
              v_slc_main_prim_counts(wr_i) := v_slc_main_prim_counts(wr_i) - 1;
            else
              slc_event_ai(wr_i + 2) <= (others => '0');
              o_main_primary_slc(wr_i) <= zero(o_main_primary_slc(wr_i));
              -- o_main_primary_slc_ar(wr_i) <= zero(o_main_primary_slc_ar(wr_i));
            end if;
          end loop;
-- /*
          -- read from file
          -- first read from input vector file
          if first_read = '1' then
            -- if g_verbose > 0 then
            --   puts("opening SLC CSV files : " & IN_SLC_FILE);
            -- end  if;
            -- csv_file.initialize(IN_SLC_FILE,"rd");
            -- csv_file.readline;
            -- while csv_file.read_isheader loop 
            --   puts("H : ",csv_file.read_string);
            --   csv_file.readline;
            -- end loop;
            csv_file.readline;
            -- extract(csv_file,v_slc_event);
            BCID        := csv_file.read_integer;
            ToA         := csv_file.read_integer;
            nTC         := csv_file.read_integer;
            TC_sent     := csv_file.read_integer;
            TC_id       := csv_file.read_integer;
            Eta         := csv_file.read_real;
            Phi         := csv_file.read_real;
            pT_thr      := csv_file.read_integer;
            Charge      := csv_file.read_integer;
            Coincidence := csv_file.read_integer;
            z_RPC0      := csv_file.read_integer;
            z_RPC1      := csv_file.read_integer;
            z_RPC2      := csv_file.read_integer;
            z_RPC3      := csv_file.read_integer;
            event       := csv_file.read_integer;

            -- puts("BCID = ", BCID);
            -- puts("ToA = ", ToA);
            if g_verbose > 1 then
              puts("##### SLC( " & integer'image(row_counter) &
              " ): " & integer'image(BCID) &
              " : " & integer'image(ToA) &
              " : " & integer'image(nTC) &
              " : " & integer'image(TC_sent) &
              " : " & integer'image(TC_id) &
              " : " & real'image(Eta) &
              " : " & real'image(Phi) &
              " : " & integer'image(pT_thr) &
              " : " & integer'image(Charge) &
              " : " & integer'image(Coincidence) &
              " : " & integer'image(z_RPC0) &
              " : " & integer'image(z_RPC1) &
              " : " & integer'image(z_RPC2) &
              " : " & integer'image(z_RPC3) &
              " : " & integer'image(event));
            end if;
            if nTC > 3 then 
              tcoverflow := '1';
            else
              tcoverflow := '0';
            end if;

            header := (
              h_reserved => (others => '1'),
              tcoverflow => tcoverflow,
              nmtc_sl    => to_unsigned(nTC, SL_HEADER_NSLC_LEN),
              nmtc_mdt   => (others => '1'),
              nslc       => (others => '1'),
              bcid       => to_unsigned(BCID, SL_HEADER_BCID_LEN)
            );

            trailer :=(
              t_reserved => (others => '1'),
              crc        => (others => '1'),
              fiberid    => (others => '1'),
              slid       => (others => '1'),
              comma      => (others => '1')
            );

            common := (
              header      => header,
              slcid       => to_unsigned(TC_id, SL_HEADER_NSLC_LEN),
              tcsent      => std_logic(to_unsigned(TC_sent,1)(0)),
              poseta      => to_signed(integer(Eta * SLC_COMMON_POSETA_MULT), SLC_COMMON_POSETA_LEN) ,
              posphi      => to_unsigned(integer((Phi * SLC_COMMON_POSPHI_MULT/1000.0)), SLC_COMMON_POSPHI_LEN) , 
              sl_pt       => ( others => '0'),
              sl_ptthresh => to_unsigned(pT_thr, SLC_COMMON_SL_PTTHRESH_LEN) , 
              sl_charge   => std_logic(to_unsigned(Charge,1)(0)), 
              cointype    => std_logic_vector(to_unsigned(Coincidence,SLC_COMMON_COINTYPE_LEN)), 
              trailer     => trailer
            );

            specific_r :=(
              -- b_reserved  => (others => '0'),
              rpc0_posz   => to_signed(integer(real(z_RPC0) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC0_POSZ_LEN) ,
              rpc1_posz   => to_signed(integer(real(z_RPC1) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC1_POSZ_LEN) ,
              rpc2_posz   => to_signed(integer(real(z_RPC2) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC2_POSZ_LEN) ,
              rpc3_posz   => to_signed(integer(real(z_RPC3) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC3_POSZ_LEN)
            );

            v_slc_event := (
              ToA => to_unsigned(ToA , 64) ,
              event => to_unsigned(event , 32) ,
              slc => (
                data_Valid  => '1',
                common      => common,
                specific    => std_logic_vector(convert(specific_r,specific_v))
              )
            );
            row_counter := row_counter + 1;
            -- readline(input_slc_file,row); -- reads header and ignores
            -- readline(input_slc_file,row);
            -- read(row, v_slc_event);
            slc_event_r <= v_slc_event;
            -- report "Read line : " & integer'image(row_counter);
            first_read := '0';
          end if;
          -- */

          
          -- -- read from file
          -- -- first read from input vector file
          -- if (not endfile(input_slc_file)) and first_read = '1' then
          --   row_counter := row_counter +1;
          --   readline(input_slc_file,row); -- reads header and ignores
          --   readline(input_slc_file,row);
          --   read(row, v_slc_event);
          --   slc_event_r <= v_slc_event;
          --   report "Read line : " & integer'image(row_counter);
          --   first_read := '0';
          -- end if;
          

          -- read from input vector file
          -- puts("loop  :  ",to_integer(v_slc_event.ToA)," - ",to_integer(tb_curr_tdc_time));
          RL : while true loop

            if (v_slc_event.ToA < tb_curr_tdc_time) then
              -- i_mdt_tar_av <= mdt_tar_event_r.tar;
              if (csv_file.end_of_file = false) then

                if v_slc_event.slc.common.slcid < 4 then
                  slc_main_prim_fifo(2 - to_integer(v_slc_event.slc.common.slcid))(v_slc_main_prim_counts(2 - to_integer(v_slc_event.slc.common.slcid))) <= v_slc_event.slc;
                  event_main_prim_fifo(2 - to_integer(v_slc_event.slc.common.slcid))(v_slc_main_prim_counts(2 - to_integer(v_slc_event.slc.common.slcid))) <= v_slc_event;
                  v_slc_main_prim_counts(2 - to_integer(v_slc_event.slc.common.slcid)) := v_slc_main_prim_counts(2 - to_integer(v_slc_event.slc.common.slcid)) + 1;
                end if;

                csv_file.readline;
                -- extract(csv_file,v_slc_event);
                BCID        := csv_file.read_integer;
                ToA         := csv_file.read_integer;
                nTC         := csv_file.read_integer;
                TC_sent     := csv_file.read_integer;
                TC_id       := csv_file.read_integer;
                Eta         := csv_file.read_real;
                Phi         := csv_file.read_real;
                pT_thr      := csv_file.read_integer;
                Charge      := csv_file.read_integer;
                Coincidence := csv_file.read_integer;
                z_RPC0      := csv_file.read_integer;
                z_RPC1      := csv_file.read_integer;
                z_RPC2      := csv_file.read_integer;
                z_RPC3      := csv_file.read_integer;
                event       := csv_file.read_integer;

                -- puts("BCID = ", BCID);
                -- puts("ToA = ", ToA);
                if g_verbose > 1 then
                  puts("##### SLC( " & integer'image(row_counter) &
                  " ): " & integer'image(BCID) &
                  " : " & integer'image(ToA) &
                  " : " & integer'image(nTC) &
                  " : " & integer'image(TC_sent) &
                  " : " & integer'image(TC_id) &
                  " : " & real'image(Eta) &
                  " : " & real'image(Phi) &
                  " : " & integer'image(pT_thr) &
                  " : " & integer'image(Charge) &
                  " : " & integer'image(Coincidence) &
                  " : " & integer'image(z_RPC0) &
                  " : " & integer'image(z_RPC1) &
                  " : " & integer'image(z_RPC2) &
                  " : " & integer'image(z_RPC3) &
                  " : " & integer'image(event));
                end if;
                if nTC > 3 then 
                  tcoverflow := '1';
                else
                  tcoverflow := '0';
                end if;

                header := (
                  h_reserved => (others => '1'),
                  tcoverflow => tcoverflow,
                  nmtc_sl    => to_unsigned(nTC, SL_HEADER_NSLC_LEN),
                  nmtc_mdt   => (others => '1'),
                  nslc       => (others => '1'),
                  bcid       => to_unsigned(BCID, SL_HEADER_BCID_LEN)
                );

                trailer :=(
                  t_reserved => (others => '1'),
                  crc        => (others => '1'),
                  fiberid    => (others => '1'),
                  slid       => (others => '1'),
                  comma      => (others => '1')
                );

                common := (
                  header      => header,
                  slcid       => to_unsigned(TC_id, SL_HEADER_NSLC_LEN),
                  tcsent      => std_logic(to_unsigned(TC_sent,1)(0)),
                  poseta      => to_signed(integer(Eta * SLC_COMMON_POSETA_MULT), SLC_COMMON_POSETA_LEN) ,
                  posphi      => to_unsigned(integer((Phi * SLC_COMMON_POSPHI_MULT/1000.0)), SLC_COMMON_POSPHI_LEN) , 
                  sl_pt       => ( others => '0'),
                  sl_ptthresh => to_unsigned(pT_thr, SLC_COMMON_SL_PTTHRESH_LEN) , 
                  sl_charge   => std_logic(to_unsigned(Charge,1)(0)), 
                  cointype    => std_logic_vector(to_unsigned(Coincidence,SLC_COMMON_COINTYPE_LEN)), 
                  trailer     => trailer
                );

                specific_r :=(
                  -- b_reserved  => (others => '0'),
                  rpc0_posz   => to_signed(integer(real(z_RPC0) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC0_POSZ_LEN) ,
                  rpc1_posz   => to_signed(integer(real(z_RPC1) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC1_POSZ_LEN) ,
                  rpc2_posz   => to_signed(integer(real(z_RPC2) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC2_POSZ_LEN) ,
                  rpc3_posz   => to_signed(integer(real(z_RPC3) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC3_POSZ_LEN)
                );

                v_slc_event := (
                  ToA => to_unsigned(ToA , 64) ,
                  event => to_unsigned(event , 32) ,
                  slc => (
                    data_Valid  => '1',
                    common      => common,
                    specific    => std_logic_vector(convert(specific_r,specific_v))
                  )
                );
                row_counter := row_counter + 1;
                -- readline(input_slc_file,row); -- reads header and ignores
                -- readline(input_slc_file,row);
                -- read(row, v_slc_event);
                slc_event_r <= v_slc_event;
                -- row_counter := row_counter +1;
                -- readline(input_slc_file,row);
                -- read(row, v_slc_event);
                -- slc_event_r <= v_slc_event;
                -- report "Read line : " & integer'image(row_counter);
              else
                -- csv_file.dispose;
                exit;
              end if;
            else
              -- i_mdt_tar_av <= zero(i_mdt_tar_av);
              exit;
            end if;
          end loop;
          

        end if;
        

      end if;
    end if;

    
  end process;
  
end architecture sim;
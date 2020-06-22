--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use std.standard.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library ucm_hps_lib;
use ucm_hps_lib.ucm_hps_pkg.all;
use ucm_hps_lib.l0mdt_textio_pkg.all;

entity ucm_hps_tb is
  -- TB, no ports
end entity ucm_hps_tb;

architecture beh of ucm_hps_tb is
  -- testbench clk
  -- constant TB_clk_period : time := 0.78 ns;
  -- signal clk : std_logic := '0';

  -- clk
  constant HW_clk_period : time := 4.0 ns;
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal rst: std_logic;
  
  signal glob_en : std_logic := '1';

    -- SLc
    signal i_slc_data_av       : slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
    -- MDT hit
    signal i_mdt_tar_inn_av    : tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    signal i_mdt_tar_mid_av    : tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    signal i_mdt_tar_out_av    : tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    signal i_mdt_tar_ext_av    : tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- to pt calc
    signal o_sf2pt_inn_av      : sf2pt_avt(c_NUM_THREADS -1 downto 0);
    signal o_sf2pt_mid_av      : sf2pt_avt(c_NUM_THREADS -1 downto 0);
    signal o_sf2pt_out_av      : sf2pt_avt(c_NUM_THREADS -1 downto 0);
    signal o_sf2pt_ext_av      : sf2pt_avt(c_NUM_THREADS -1 downto 0);
    -- pipelin
    signal o_uCM2pl_av         : pipelines_avt(MAX_NUM_SL -1 downto 0);

  signal cand1  : slc_rx_data_rt;
  signal barrel1 : slc_barrel_rt;

  -- signal line_Example : string;
  signal mdt_tar_station : tar2hps_tb_at;
  signal tb_curr_time : unsigned(63 downto 0) := (others => '0');

  -- input fifos
  -- signal tar_base : tar2hps_rt;
  -- constant INFIFO_WIDTH : integer := 32;
  type infifo_counts is array (integer range <>) of integer;

  type infifo_mem_at is array (integer range <>) of tar2hps_tb_at;

  signal mdt_inn        : infifo_mem_at(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => nullify(mdt_tar_station));
  signal mdt_mid        : infifo_mem_at(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => nullify(mdt_tar_station));
  signal mdt_out        : infifo_mem_at(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => nullify(mdt_tar_station));
  signal mdt_ext        : infifo_mem_at(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => nullify(mdt_tar_station));

  signal mdt_inn_counts : infifo_counts(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => 0);
  signal mdt_mid_counts : infifo_counts(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => 0);
  signal mdt_out_counts : infifo_counts(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => 0);
  signal mdt_ext_counts : infifo_counts(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => 0);

  ------------------------------------
  signal mdt_tar_event : input_tar_rt;

begin
  
  DUT : entity ucm_hps_lib.ucm_hps
  port map(
    clk                 => clk,
    rst            => rst,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av       => i_slc_data_av,
    -- MDT hit
    i_mdt_tar_inn_av    => i_mdt_tar_inn_av,
    i_mdt_tar_mid_av    => i_mdt_tar_mid_av,
    i_mdt_tar_out_av    => i_mdt_tar_out_av,
    i_mdt_tar_ext_av    => i_mdt_tar_ext_av,
    -- to pt calc
    o_sf2pt_inn_av      => o_sf2pt_inn_av,
    o_sf2pt_mid_av      => o_sf2pt_mid_av,
    o_sf2pt_out_av      => o_sf2pt_out_av,
    o_sf2pt_ext_av      => o_sf2pt_ext_av,
    -- MDT hit
    o_uCM2pl_av        => o_uCM2pl_av
  );
  
  -------------------------------------------------------------------------------------
	-- TB clock Generator
	-------------------------------------------------------------------------------------
  -- CLK_TB : process begin
  --   clk <= '0';
  --   wait for TB_CLK_period/2;
  --   clk <= '1';
  --   wait for TB_CLK_period/2;
  -- end process;

 	-------------------------------------------------------------------------------------
	-- HW clock Generator
	-------------------------------------------------------------------------------------
  CLK_320 : process begin
    clk <= '0';
    wait for HW_CLK_period/2;
    clk <= '1';
    wait for HW_CLK_period/2;
  end process;

 	-------------------------------------------------------------------------------------
	-- Reset Generator
	-------------------------------------------------------------------------------------
	rst_process: process
	begin
		rst<='1';
		wait for HW_CLK_period;
		rst<='0';
		wait for HW_CLK_period*reset_init_cycles;
		rst<= '1';
		wait;
  end process;
 	-------------------------------------------------------------------------------------
	-- candidates
  -------------------------------------------------------------------------------------

  -------------------------------------------------------------------------------------
	-- hits
  -------------------------------------------------------------------------------------
 

  CSM_read: process ( rst, clk)

    file input_mdt_tar_file       : text open read_mode is "/mnt/d/L0MDT/dev/l0mdt-fpga-design/ucm_hps/sim/csm_TB_C2Barrel.txt";
    variable row                  : line;
    variable row_counter          : integer := 0;

    -- variable tdc_time             : UNSIG_64;
    variable mdt_event            : input_tar_rt;

    variable next_event_time      : integer := 0;
    variable tb_time              : integer := 0;

    variable first_read           : std_logic := '1';

    variable v_mdt_inn_counts     : infifo_counts(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => 0);
    variable v_mdt_mid_counts     : infifo_counts(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => 0);
    variable v_mdt_out_counts     : infifo_counts(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => 0);
    variable v_mdt_ext_counts     : infifo_counts(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => 0);

  begin

    -- tb_curr_time <= tb_time;

    
    if rising_edge(clk) then
      if(rst= '1') then

      else
        ---------------------------------------------------------------
        -- SLC
        ---------------------------------------------------------------

        
        ---------------------------------------------------------------
        -- MDT 
        ---------------------------------------------------------------
        -- write to DUT

        for wr_i in c_HPS_NUM_MDT_CH_INN -1 downto 0 loop
          if(v_mdt_inn_counts(wr_i) > 0) then
            i_mdt_tar_inn_av(wr_i) <= vectorify(mdt_inn(wr_i)(0));
            for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
              mdt_inn(wr_i)(mv_i - 1) <= mdt_inn(wr_i)(mv_i);
            end loop;
            v_mdt_inn_counts(wr_i) := v_mdt_inn_counts(wr_i) - 1;
          else
            i_mdt_tar_inn_av(wr_i) <= nullify(i_mdt_tar_inn_av(wr_i));
          end if;
        end loop;

        for wr_i in c_HPS_NUM_MDT_CH_MID -1 downto 0 loop
          if(v_mdt_mid_counts(wr_i) > 0) then
            i_mdt_tar_mid_av(wr_i) <= vectorify(mdt_mid(wr_i)(0));
            for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
              mdt_mid(wr_i)(mv_i - 1) <= mdt_MID(wr_i)(mv_i);
            end loop;
            v_mdt_mid_counts(wr_i) := v_mdt_mid_counts(wr_i) - 1;
          else
            i_mdt_tar_mid_av(wr_i) <= nullify(i_mdt_tar_mid_av(wr_i));
          end if;
        end loop;

        for wr_i in c_HPS_NUM_MDT_CH_OUT -1 downto 0 loop
          if(v_mdt_out_counts(wr_i) > 0) then
            i_mdt_tar_out_av(wr_i) <= vectorify(mdt_out(wr_i)(0));
            for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
              mdt_out(wr_i)(mv_i - 1) <= mdt_out(wr_i)(mv_i);
            end loop;
            v_mdt_out_counts(wr_i) := v_mdt_out_counts(wr_i) - 1;
          else
            i_mdt_tar_out_av(wr_i) <= nullify(i_mdt_tar_out_av(wr_i));
          end if;
        end loop;

        for wr_i in c_HPS_NUM_MDT_CH_EXT -1 downto 0 loop
          if(v_mdt_ext_counts(wr_i) > 0) then
            i_mdt_tar_ext_av(wr_i) <= vectorify(mdt_ext(wr_i)(0));
            for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
              mdt_ext(wr_i)(mv_i - 1) <= mdt_ext(wr_i)(mv_i);
            end loop;
            v_mdt_ext_counts(wr_i) := v_mdt_ext_counts(wr_i) - 1;
          else
            i_mdt_tar_ext_av(wr_i) <= nullify(i_mdt_tar_ext_av(wr_i));
          end if;
        end loop;
        
        -- first read from input vector file
        if (not endfile(input_mdt_tar_file)) and first_read = '1' then
          row_counter := row_counter +1;
          readline(input_mdt_tar_file,row); -- reads header and ignores
          readline(input_mdt_tar_file,row);
          read(row, mdt_event);
          mdt_tar_event <= mdt_event;
          report "Read line : " & integer'image(row_counter);
          first_read := '0';
        end if;

        -- read from input vector file
        RL : while true loop
          if (mdt_event.global_time / 32 < tb_curr_time) then
            -- i_mdt_tar_av <= mdt_tar_event.tar;
            if (endfile(input_mdt_tar_file) = false) then
              
              if to_integer(mdt_event.station) = 0 then
                mdt_inn(to_integer(mdt_event.chamber))(v_mdt_inn_counts(to_integer(mdt_event.chamber))) <= mdt_event.tar;
                v_mdt_inn_counts(to_integer(mdt_event.chamber)) := v_mdt_inn_counts(to_integer(mdt_event.chamber)) + 1;
              elsif to_integer(mdt_event.station) = 1 then
                mdt_mid(to_integer(mdt_event.chamber))(v_mdt_mid_counts(to_integer(mdt_event.chamber))) <= mdt_event.tar;
                v_mdt_mid_counts(to_integer(mdt_event.chamber)) := v_mdt_mid_counts(to_integer(mdt_event.chamber)) + 1;
              elsif to_integer(mdt_event.station) = 2 then
                mdt_out(to_integer(mdt_event.chamber))(v_mdt_out_counts(to_integer(mdt_event.chamber))) <= mdt_event.tar;
                v_mdt_out_counts(to_integer(mdt_event.chamber)) := v_mdt_out_counts(to_integer(mdt_event.chamber)) + 1;
              elsif to_integer(mdt_event.station) = 3 then
                mdt_ext(to_integer(mdt_event.chamber))(v_mdt_ext_counts(to_integer(mdt_event.chamber))) <= mdt_event.tar;
                v_mdt_ext_counts(to_integer(mdt_event.chamber)) := v_mdt_ext_counts(to_integer(mdt_event.chamber)) + 1;
              else
                -- ERROR
              end if;
              row_counter := row_counter +1;
              readline(input_mdt_tar_file,row);
              read(row, mdt_event);
              mdt_tar_event <= mdt_event;
              report "Read line : " & integer'image(row_counter);
            else
              exit;
            end if;
          else
            -- i_mdt_tar_av <= nullify(i_mdt_tar_av);
            exit;
          end if;
        end loop;



       

      end if;

      mdt_inn_counts <= v_mdt_inn_counts;
      mdt_mid_counts <= v_mdt_mid_counts;
      mdt_out_counts <= v_mdt_out_counts;
      mdt_ext_counts <= v_mdt_ext_counts;



      tb_curr_time <= tb_curr_time + '1';
    end if;

  end process;

end architecture beh;
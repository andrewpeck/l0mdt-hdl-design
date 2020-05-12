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
use shared_lib.common_pkg.all;

library ucm_hps_lib;
use ucm_hps_lib.l0mdt_textio_pkg.all;

entity ucm_hps_tb is
  -- TB, no ports
end entity ucm_hps_tb;

architecture beh of ucm_hps_tb is
  -- testbench clk
  constant TB_clk_period : time := 0.78 ns;
  signal TB_clk : std_logic := '0';

  -- clk
  constant HW_clk_period : time := 4.0 ns;
  signal HW_clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal reset_b : std_logic;
  
  signal glob_en : std_logic := '1';

  -- SLc in
  signal i_slc_data_av       : slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
  -- MDT hit
  signal i_mdt_tar_av        : tar2hps_aavt(MAX_NUM_HPS -1 downto 0);
  -- to pt calc
  signal o_sf2pt_av          : sf2pt_aavt(MAX_NUM_HPS -1 downto 0);
  -- pipeline
  signal o_uCM2pl_vav        : pipeline_vavt;

  signal cand1  : slc_rx_data_rt;
  signal barrel1 : slc_barrel_rt;

  -- signal line_Example : string;
  signal mdt_tar_event : input_tar_rt;
  signal tb_curr_time : integer;

 

  ------------------------------------
  -- signal tb_motor : std_logic_vector(3 downto 0);

begin
  
  DUT : entity ucm_hps_lib.ucm_hps
  port map(
    clk                 => HW_clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av       => i_slc_data_av,
    -- MDT hit
    i_mdt_tar_av        => i_mdt_tar_av,
    -- to pt calc
    o_sf2pt_av          => o_sf2pt_av,
    -- MDT hit
    o_uCM2pl_vav        => o_uCM2pl_vav
  );
  
  -------------------------------------------------------------------------------------
	-- TB clock Generator
	-------------------------------------------------------------------------------------
  CLK_TB : process begin
    TB_clk <= '0';
    wait for TB_CLK_period/2;
    TB_clk <= '1';
    wait for TB_CLK_period/2;
  end process;

 	-------------------------------------------------------------------------------------
	-- HW clock Generator
	-------------------------------------------------------------------------------------
  CLK_320 : process begin
    HW_clk <= '0';
    wait for HW_CLK_period/2;
    HW_clk <= '1';
    wait for HW_CLK_period/2;
  end process;

 	-------------------------------------------------------------------------------------
	-- Reset Generator
	-------------------------------------------------------------------------------------
	rst_process: process
	begin
		reset_b <='1';
		wait for HW_CLK_period;
		reset_b<='0';
		wait for HW_CLK_period*reset_init_cycles;
		reset_b <= '1';
		wait;
  end process;
 	-------------------------------------------------------------------------------------
	-- candidates
  -------------------------------------------------------------------------------------

  -------------------------------------------------------------------------------------
	-- hits
  -------------------------------------------------------------------------------------
 

  CSM_read: process ( reset_b, TB_clk)

    file input_file                : text open read_mode is "/mnt/d/L0MDT/dev/l0mdt-fpga-design/ucm_hps/sim/csm_TB_C2Barrel.txt";
    variable row                   : line;
    variable row_counter           : integer := 0;

    variable tdc_time : UNSIG_64;
    variable mdt_event : input_tar_rt;

    variable next_event_time : integer := 0;
    variable tb_time : integer := 0;

    variable first_read : std_logic := '1';

  begin

    tb_curr_time <= tb_time;

    if(reset_b = '0') then

    elsif rising_edge(TB_clk) then

      -- first read from input vector file
      if (not endfile(input_file)) and first_read = '1' then
        row_counter := row_counter +1;
        readline(input_file,row); -- reads header and ignores
        readline(input_file,row);
        read(row, mdt_event);
        mdt_tar_event <= mdt_event;
        -- report "Read line : " & integer'image(row_counter);
        first_read := '0';
      end if;
      
      -- read from input vector file
      if (mdt_event.global_time < tb_time) then
        i_mdt_tar_av <= mdt_tar_event.tar;
        if (not endfile(input_file)) then
          row_counter := row_counter +1;
          readline(input_file,row);
          read(row, mdt_event);
          mdt_tar_event <= mdt_event;
          report "Read line : " & integer'image(row_counter);
        end if;
      else
        i_mdt_tar_av <= nullify(i_mdt_tar_av);
      end if;

      tb_time := tb_time +1;

    end if;

  end process;

end architecture beh;
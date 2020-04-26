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

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_tb is
  -- TB, no ports
end entity ucm_tb;

architecture beh of ucm_tb is
  -- clk
  constant clk_period : time := 4.0 ns;
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 5;
  signal reset_b : std_logic := '0';
  
  signal glob_en : std_logic := '1';

  -- SLc in
  signal i_slc_data_av          : slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
  -- to hps
  signal o_uCM2hps_pam_ar       : ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
  signal o_uCM2hps_data_av      : ucm2hps_aavt(MAX_NUM_HPS -1 downto 0);
  -- pipeline
  signal o_uCM2pl_av            : pipeline_avt(MAX_NUM_SL -1 downto 0);

  ------------------------------------
  signal tb_motor : std_logic_vector(3 downto 0);

begin
  
  UCM : entity work.top_ucm
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av          => i_slc_data_av,
    -- pam out
    o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_data_av      => o_uCM2hps_data_av,
    -- MDT hit
    o_uCM2pl_av            => o_uCM2pl_av
  );
  
 	-------------------------------------------------------------------------------------
	-- clock Generator
	-------------------------------------------------------------------------------------
  CLK_320 : process begin
    clk <= '0';
    wait for CLK_period/2;
    clk <= '1';
    wait for CLK_period/2;
  end process;

 	-------------------------------------------------------------------------------------
	-- Reset Generator
	-------------------------------------------------------------------------------------
	rst_process: process
	begin
		reset_b<='0';
		wait for CLK_period;
		reset_b<='1';
		wait for CLK_period*reset_init_cycles;
		reset_b <= '0';
		wait;
  end process;
  

  feed_1_slc : process(clk,reset_b)

  begin
    if Reset_b = '0' then

    elsif rising_edge(clk) then

      case tb_motor is
        when x"0"=>
          tb_motor <= x"1";
        when x"0" =>
        tb_motor <= x"2";
          i_slc_data_av(0) <= nullify;
          i_slc_data_av(1) <= nullify;
          i_slc_data_av(2) <= nullify;
          i_slc_data_av(3) <= nullify;
          i_slc_data_av(4) <= nullify;
        when others =>
          -- nothing to do 
    end if;

  end process;


  
end architecture beh;
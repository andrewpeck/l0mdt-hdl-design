library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library gbt_sc;
use gbt_sc.sca_pkg.all;

library ctrl_lib;
use ctrl_lib.HAL_CTRL.all;

library shared_lib;
use shared_lib.config_pkg.all;

library hal;

entity gbt_ctrl_wrap_tb is

end gbt_ctrl_wrap_tb;

architecture gbt_ctrl_wrap_tb_arc of gbt_ctrl_wrap_tb is

	signal clock : std_logic;
	signal reset : std_logic := '0';
	signal mon : HAL_CSM_CSM_SC_MON_t;
	signal ctrl : HAL_CSM_CSM_SC_CTRL_t;
	CONSTANT clk_period : TIME := 2.5 ns;


	signal ic_data_i : std_logic_vector(1 downto 0) := "11";
	signal ic_data_o : std_logic_vector(1 downto 0);

	signal ec_data_i : std_logic_vector(1 downto 0);
	signal ec_data_o : std_logic_vector(1 downto 0);	

	signal ic_data_i_s : std_logic_vector(1 downto 0);

	signal sca0_data_i  : std_logic_vector(1 downto 0);
	signal sca0_data_o  : std_logic_vector(1 downto 0);

	signal sca1_data_i  : std_logic_vector(1 downto 0);
	signal sca1_data_o  : std_logic_vector(1 downto 0);

	signal sca2_data_i  : std_logic_vector(1 downto 0);
	signal sca2_data_o  : std_logic_vector(1 downto 0);

	signal sca3_data_i  : std_logic_vector(1 downto 0);
	signal sca3_data_o  : std_logic_vector(1 downto 0);

begin

	clock <= not clock after 1.25 ns;


	gbt_controller_wrapper_inst : entity hal.gbt_controller_wrapper 
	generic map (
    	g_CLK_FREQ        => 40,
    	g_SCAS_PER_LPGBT  => 4
    )
  	port map(
    -- reset
    reset_i => reset,

    mon  => mon,
    ctrl =>  ctrl,

    clk40   => clock,

    -- master
    ic_data_i =>  ic_data_i,
    ic_data_o =>  ic_data_o,

    -- slave
    ec_data_i =>  ec_data_i,
    ec_data_o => ec_data_o,
    
    ic_data_i_s =>  ic_data_i_s,

    sca0_data_i =>  sca0_data_i,
    sca0_data_o => sca0_data_o,

    sca1_data_i => sca1_data_i,
    sca1_data_o => sca1_data_o,

    sca2_data_i => sca2_data_i,
    sca2_data_o => sca2_data_o,
    
    sca3_data_i => sca3_data_i,
    sca3_data_o => sca3_data_o
    );

  	Pulse : PROCESS
  	BEGIN
  	    WAIT FOR clk_period * 5;
  	    ctrl.master.ic.tx_gbtx_addr <= x"75";
  	    wait for clk_period;
		ctrl.master.ic.tx_register_addr <= x"0010";
		wait for clk_period;
		ctrl.master.ic.tx_num_bytes_to_read <= x"0001";
		wait for clk_period;
		ctrl.master.ic.tx_data_to_gbtx <= x"10";
		wait for clk_period;
		ctrl.master.ic.tx_wr <= '1';
		wait for clk_period;
		ctrl.master.ic.tx_wr <= '0';
		wait for clk_period;
		ctrl.master.ic.tx_start_write <= '1';
		wait for clk_period;
		ctrl.master.ic.tx_start_write <= '0';
		wait;
	END PROCESS;

	
end gbt_ctrl_wrap_tb_arc;
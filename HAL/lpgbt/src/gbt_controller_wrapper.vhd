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


entity gbt_controller_wrapper is
  generic(
    g_CLK_FREQ       : integer := 40;
    g_SCAS_PER_LPGBT : integer := 4;
    g_CSM_ID         : integer := 0
    );
  port(
    -- reset
    reset_i : in std_logic;

    mon  : out HAL_CSM_CSM_SC_MON_t;
    ctrl : in  HAL_CSM_CSM_SC_CTRL_t;

    clk40   : in std_logic;

    -- master
    ic_data_i : in  std_logic_vector (1 downto 0);
    ic_data_o : out std_logic_vector (1 downto 0);

    -- slave
    ec_data_i : in  std_logic_vector (1 downto 0);
    ec_data_o : out std_logic_vector (1 downto 0);
    
    ic_data_i_s : in  std_logic_vector (1 downto 0);

    sca0_data_i : in  std_logic_vector (1 downto 0);
    sca0_data_o : out std_logic_vector (1 downto 0);

    sca1_data_i : in  std_logic_vector (1 downto 0);
    sca1_data_o : out std_logic_vector (1 downto 0);

    sca2_data_i : in  std_logic_vector (1 downto 0);
    sca2_data_o : out std_logic_vector (1 downto 0);
    
    sca3_data_i : in  std_logic_vector (1 downto 0);
    sca3_data_o : out std_logic_vector (1 downto 0)

    );
end gbt_controller_wrapper;

architecture structural of gbt_controller_wrapper is

COMPONENT ila_0
PORT (
  clk : IN STD_LOGIC;
  probe0 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
  probe1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
  probe2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
  probe3 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
  probe4 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
  probe5 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
  probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe10 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
  probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe12 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe13 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
  probe14 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe15 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe16 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe17 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
  probe18 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
  probe19 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
  probe20 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe21 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe22 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
  probe23 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
  probe24 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  probe25 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  probe26 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  probe27 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  probe28 : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
);
END COMPONENT;

  -- master
  signal master_rx_frame, slave_rx_frame
    : std_logic_vector (7 downto 0) := (others => '0');

  signal master_rx_empty, slave_rx_empty
    : std_logic := '0';

  -- inputs, internal 40MHz copy
  signal ic_data_i_int, ec_data_i_int,
    sca0_data_i_int, sca1_data_i_int, sca2_data_i_int, sca3_data_i_int
    : std_logic_vector (1 downto 0);

  -- outputs, internal copy
  signal ic_data_o_int, ec_data_o_int,
    sca0_data_o_int, sca1_data_o_int, sca2_data_o_int, sca3_data_o_int
    : std_logic_vector (1 downto 0);

  signal lpgbt_version : std_logic_vector (1 downto 0);
 
  signal tx_rd_reg             : std_logic;
  signal tx_start_read_reg     : std_logic;
  signal tx_start_write_m      : std_logic;
  signal tx_start_write_s      : std_logic;
  signal tx_start_read_m       : std_logic;
  signal tx_start_read_s       : std_logic;
  signal tx_start_read_reg_m   : std_logic;
  signal tx_start_read_reg2_m  : std_logic;
  signal tx_start_read_reg_s   : std_logic; 
  signal tx_start_read_reg2_s  : std_logic;
  signal tx_start_write_reg_m  : std_logic;
  signal tx_start_write_reg2_m : std_logic;
  signal tx_start_write_reg_s  : std_logic;
  signal tx_start_write_reg2_s : std_logic; 
  signal tx_wr_reg_m           : std_logic;
  signal tx_wr_reg2_m          : std_logic;
  signal tx_wr_reg_s           : std_logic;
  signal tx_wr_reg2_s          : std_logic;
  signal tx_wr_m               : std_logic;
  signal tx_wr_s               : std_logic;
  signal sca_reset             : std_logic;
  signal sca_reset_reg         : std_logic;
  signal sca_reset_reg2        : std_logic;
  signal sca_command           : std_logic;
  signal sca_command_reg       : std_logic;
  signal sca_command_reg2      : std_logic;  
  signal sca_connect           : std_logic;
  signal sca_connect_reg       : std_logic;
  signal sca_connect_reg2      : std_logic;
  signal reply_received        : std_logic;
  signal rx_valid_single_m     : std_logic;
  signal rx_valid_single_s     : std_logic;

  signal vio_rx_reset : std_logic;
  signal vio_tx_reset : std_logic;
  signal vio_tx_start_write : std_logic;
  signal vio_tx_start_read : std_logic;
  signal vio_tx_gbtx_address : std_logic_vector(7 downto 0);
  signal vio_tx_register_addr : std_logic_vector(15 downto 0);
  signal vio_tx_num_bytes_to_read : std_logic_vector(15 downto 0);
  signal vio_tx_wr : std_logic;
  signal vio_tx_data_to_gbtx : std_logic_vector(7 downto 0);
  signal ctrl_reg : HAL_CSM_CSM_SC_CTRL_t;
  signal ctrl_s : HAL_CSM_CSM_SC_CTRL_t;
  

begin

--  VIO : vio_gbt
--  PORT MAP (
--    clk => clk40,
--    probe_out0(0) => vio_rx_reset,
--    probe_out1(0) => vio_tx_reset,
--    probe_out2(0) => vio_tx_start_write,
--    probe_out3(0) => vio_tx_start_read,
--    probe_out4 => vio_tx_gbtx_address,
--    probe_out5 => vio_tx_register_addr,
--    probe_out6 => vio_tx_num_bytes_to_read,
--    probe_out7(0) => vio_tx_wr,
--    probe_out8 => vio_tx_data_to_gbtx
--  );

  mon.master.ic.rx_data_from_gbtx   <= master_rx_frame;
  mon.slave.ic.rx_data_from_gbtx    <= slave_rx_frame;
  
  --------------------------------------------------------------------------------
  -- register inputs/outputs for timing
  --------------------------------------------------------------------------------

  process (clk40) is
  begin
    if (rising_edge(clk40)) then

      ic_data_o   <= ic_data_o_int;
      ec_data_o   <= ec_data_o_int;
      sca0_data_o <= sca0_data_o_int;
      sca1_data_o <= sca1_data_o_int;
      sca2_data_o <= sca2_data_o_int;
      sca3_data_o <= sca3_data_o_int;

      ic_data_i_int   <= ic_data_i;
      ec_data_i_int   <= ec_data_i;
      sca0_data_i_int <= sca0_data_i;
      sca1_data_i_int <= sca1_data_i;
      sca2_data_i_int <= sca2_data_i;
      sca3_data_i_int <= sca3_data_i;
      
      tx_wr_reg_m   <= ctrl.master.ic.tx_wr;
      tx_wr_reg2_m  <= tx_wr_reg_m;
      tx_wr_m       <= tx_wr_reg_m and (not tx_wr_reg2_m);
      
      tx_wr_reg_s   <= ctrl.slave.ic.tx_wr;
      tx_wr_reg2_s  <= tx_wr_reg_s;
      tx_wr_s       <= tx_wr_reg_s and (not tx_wr_reg2_s);
           
      tx_start_write_reg_m  <= ctrl.master.ic.tx_start_write;
      tx_start_write_reg2_m <= tx_start_write_reg_m;
      tx_start_write_m      <= tx_start_write_reg_m and (not tx_start_write_reg2_m);
      
      tx_start_write_reg_s  <= ctrl.slave.ic.tx_start_write;
      tx_start_write_reg2_s <= tx_start_write_reg_s;
      tx_start_write_s      <= tx_start_write_reg_s and (not tx_start_write_reg2_s);      
      
      tx_start_read_reg_m  <= ctrl.master.ic.tx_start_read;
      tx_start_read_reg2_m <= tx_start_read_reg_m;
      tx_start_read_m      <= tx_start_read_reg_m and (not tx_start_read_reg2_m);
      
      tx_start_read_reg_s  <= ctrl.slave.ic.tx_start_read;
      tx_start_read_reg2_s <= tx_start_read_reg_s;
      tx_start_read_s      <= tx_start_read_reg_s and (not tx_start_read_reg2_s);
      
      sca_command_reg       <= ctrl.master.start_command;   
      sca_command_reg2      <= sca_command_reg;
      sca_command           <= sca_command_reg and (not sca_command_reg2);
      
      sca_reset_reg         <= ctrl.master.start_reset;
      sca_reset_reg2        <= sca_reset_reg;
      sca_reset             <= sca_reset_reg and (not sca_reset_reg2);
      
      sca_connect_reg       <= ctrl.master.start_connect;
      sca_connect_reg2      <= sca_connect_reg;
      sca_connect           <= sca_connect_reg and (not sca_connect_reg2);
      
      if(reply_received = '1') then
            mon.master.sca_rx.rx(0).rx_received <= '1';
      end if;
      
      if(sca_command = '1' ) then
            mon.master.sca_rx.rx(0).rx_received <= '0';
      end if;

      if(tx_start_read_m = '1') then
            mon.master.ic.rx_valid <= '0';
      elsif(rx_valid_single_m = '1') then
            mon.master.ic.rx_valid <= '1';
      end if;
      
      if(tx_start_read_s = '1') then
            mon.slave.ic.rx_valid <= '0';
      elsif(rx_valid_single_s = '1') then
            mon.slave.ic.rx_valid <= '1';
      end if;

    end if;
  end process;

  --------------------------------------------------------------------------------
  -- Slave LPGBT (no SCAs)
  --------------------------------------------------------------------------------
  


  slave_gbtsc_top_inst : entity gbt_sc.gbtsc_top

    generic map (
      g_IC_FIFO_DEPTH => 8,
      g_ToLpGBT       => 1,             -- 1 = LPGBT, 0=GBTX
      g_SCA_COUNT     => 0,
      g_LPGBT_VERS    => c_LPGBT_VER
      )
    port map (

      -- lpGBT Version
      --lpgbt_vers_i => ctrl.frame_format,

      -- tx to lpgbt etc
      tx_clk_i  => clk40,
      tx_clk_en => '1',

      -- rx from lpgbt etc
      rx_clk_i  => clk40,
      rx_clk_en => '1',

      -- IC/EC data from controller
      ic_data_i => ec_data_i_int,       -- to/from slave lpgbt
      ic_data_o => ec_data_o_int,       -- to/from slave lpgbt

      -- multiplexed IC/EC data from all lpgbts

      ec_data_i => (others => (others => '1')),
      ec_data_o => open,

      -- reset
      rx_reset_i => reset_i or ctrl.slave.rx_reset,
      tx_reset_i => reset_i or ctrl.slave.tx_reset,

      -- connect all of the following to AXI slave

      tx_start_write_i => tx_start_write_s, --ctrl.slave.ic.tx_start_write,
      tx_start_read_i  => tx_start_read_s, --ctrl.slave.ic.tx_start_read,

      tx_gbtx_address_i  => ctrl.slave.ic.tx_gbtx_addr,
      tx_register_addr_i => ctrl.slave.ic.tx_register_addr,
      tx_nb_to_be_read_i => ctrl.slave.ic.tx_num_bytes_to_read,

      -- ic tx
      wr_clk_i          => clk40,
      tx_wr_i           => tx_wr_s, --ctrl.slave.ic.tx_wr, 
      tx_data_to_gbtx_i => ctrl.slave.ic.tx_data_to_gbtx,
      tx_ready_o        => mon.slave.ic.tx_ready,  --! IC core ready for a transaction

      -- ic rx
      rd_clk_i            => clk40,
      rx_rd_i             => '1',
      rx_data_from_gbtx_o => slave_rx_frame,
      rx_empty_o          => slave_rx_empty,

      -- SCA Control
      sca_enable_i        => (others => '0'),
      start_reset_cmd_i   => '0',
      start_connect_cmd_i => '0',
      start_command_i     => '0',
      inject_crc_error    => '0',
      tx_address_i        => (others => '0'),
      tx_transID_i        => (others => '0'),
      tx_channel_i        => (others => '0'),
      tx_command_i        => (others => '0'),
      tx_data_i           => (others => '0'),

      -- SCA Command
      rx_address_o  => open,
      rx_channel_o  => open,
      rx_control_o  => open,
      rx_data_o     => open, --mon.slave.ic.rx_data,
      rx_error_o    => open,
      rx_len_o      => open,
      rx_received_o => open,
      rx_transID_o  => open
      );

  --------------------------------------------------------------------------------
  -- Master LPGBT (w/SCAs)
  --------------------------------------------------------------------------------

  master_gbtsc_top_inst : entity gbt_sc.gbtsc_top
    generic map (
      g_IC_FIFO_DEPTH => 8,
      g_ToLpGBT       => 1,             -- 1 = LPGBT, 0=GBTX
      g_SCA_COUNT     => g_SCAS_PER_LPGBT,
      g_LPGBT_VERS    => c_LPGBT_VER
      )
    port map (

      -- tx to lpgbt etc
      tx_clk_i  => clk40,
      tx_clk_en => '1',

      -- rx from lpgbt etc
      rx_clk_i  => clk40,
      rx_clk_en => '1',

      -- IC/EC data from controller
      ic_data_i => ic_data_i_int,   -- data from LpGBT
      ic_data_o => ic_data_o_int,

      -- multiplexed IC/EC data from all lpgbts

      ec_data_o(0) => sca0_data_o_int,
      ec_data_o(1) => sca1_data_o_int,
      ec_data_o(2) => sca2_data_o_int,
      ec_data_o(3) => sca3_data_o_int,

      ec_data_i(0) => sca0_data_i_int,
      ec_data_i(1) => sca1_data_i_int,
      ec_data_i(2) => sca2_data_i_int,
      ec_data_i(3) => sca3_data_i_int,

      -- reset
      rx_reset_i => reset_i or ctrl.master.rx_reset,
      tx_reset_i => reset_i or ctrl.master.tx_reset,

      -- connect all of the following to AXI slave

      tx_start_write_i => tx_start_write_m, --ctrl.master.ic.tx_start_write,
      tx_start_read_i  => tx_start_read_m,  --ctrl.master.ic.tx_start_read,

      tx_gbtx_address_i  => ctrl.master.ic.tx_gbtx_addr,
      tx_register_addr_i => ctrl.master.ic.tx_register_addr,
      tx_nb_to_be_read_i => ctrl.master.ic.tx_num_bytes_to_read,

      -- ic tx
      wr_clk_i          => clk40,
      tx_wr_i           => tx_wr_m, -- ctrl.master.ic.tx_wr,  --Panos use of one clock cycle signal
      tx_data_to_gbtx_i => ctrl.master.ic.tx_data_to_gbtx,
      tx_ready_o        => mon.master.ic.tx_ready,  --! IC core ready for a transaction

      -- ic rx
      rd_clk_i            => clk40,
      rx_rd_i             => '1',--tx_rd, --ctrl.slave.ic.tx_wr, --tx_rd,
      rx_data_from_gbtx_o => master_rx_frame,
      rx_empty_o          => master_rx_empty,

      sca_enable_i        => ctrl.master.sca_enable,
      start_reset_cmd_i   => sca_reset, --ctrl.master.start_reset,
      start_connect_cmd_i => sca_connect, --ctrl.master.start_connect,
      start_command_i     => sca_command, --ctrl.master.start_command,
      inject_crc_error    => ctrl.master.inj_crc_err,
      tx_address_i        => ctrl.master.tx_address,
      tx_transID_i        => ctrl.master.tx_transID,
      tx_channel_i        => ctrl.master.tx_channel,
      tx_command_i        => ctrl.master.tx_cmd,
      tx_data_i           => ctrl.master.tx_data,

      -- SCA Command
      rx_address_o(0)  => mon.master.sca_rx.rx(0).rx_address,
      rx_address_o(1)  => mon.master.sca_rx.rx(1).rx_address,
      rx_address_o(2)  => mon.master.sca_rx.rx(2).rx_address,
      rx_address_o(3)  => mon.master.sca_rx.rx(3).rx_address,
      rx_channel_o(0)  => mon.master.sca_rx.rx(0).rx_channel,
      rx_channel_o(1)  => mon.master.sca_rx.rx(1).rx_channel,
      rx_channel_o(2)  => mon.master.sca_rx.rx(2).rx_channel,
      rx_channel_o(3)  => mon.master.sca_rx.rx(3).rx_channel,
      rx_control_o(0)  => mon.master.sca_rx.rx(0).rx_control,
      rx_control_o(1)  => mon.master.sca_rx.rx(1).rx_control,
      rx_control_o(2)  => mon.master.sca_rx.rx(2).rx_control,
      rx_control_o(3)  => mon.master.sca_rx.rx(3).rx_control,
      rx_data_o(0)     => mon.master.sca_rx.rx(0).rx_data,
      rx_data_o(1)     => mon.master.sca_rx.rx(1).rx_data,
      rx_data_o(2)     => mon.master.sca_rx.rx(2).rx_data,
      rx_data_o(3)     => mon.master.sca_rx.rx(3).rx_data,
      rx_error_o(0)    => mon.master.sca_rx.rx(0).rx_err,
      rx_error_o(1)    => mon.master.sca_rx.rx(1).rx_err,
      rx_error_o(2)    => mon.master.sca_rx.rx(2).rx_err,
      rx_error_o(3)    => mon.master.sca_rx.rx(3).rx_err,
      rx_len_o(0)      => mon.master.sca_rx.rx(0).rx_len,
      rx_len_o(1)      => mon.master.sca_rx.rx(1).rx_len,
      rx_len_o(2)      => mon.master.sca_rx.rx(2).rx_len,
      rx_len_o(3)      => mon.master.sca_rx.rx(3).rx_len,
      rx_received_o(0) => reply_received, --mon.master.sca_rx.rx(0).rx_received,
      rx_received_o(1) => mon.master.sca_rx.rx(1).rx_received,
      rx_received_o(2) => mon.master.sca_rx.rx(2).rx_received,
      rx_received_o(3) => mon.master.sca_rx.rx(3).rx_received,
      rx_transID_o(0)  => mon.master.sca_rx.rx(0).rx_transID,
      rx_transID_o(1)  => mon.master.sca_rx.rx(1).rx_transID,
      rx_transID_o(2)  => mon.master.sca_rx.rx(2).rx_transID,
      rx_transID_o(3)  => mon.master.sca_rx.rx(3).rx_transID
      );


  lpgbt_version <= "01" when c_LPGBT_VER = '0' else "10";

  gbt_ic_rx_m : entity work.gbt_ic_rx
    port map (
      clock_i              => clk40,
      reset_i              => reset_i,
      gbt_frame_format_i   => lpgbt_version,
      frame_i              => master_rx_frame,
      valid_i              => not master_rx_empty, --tx_rd, --not master_rx_empty,
      data_o               => mon.master.ic.rx_data, --32
      chip_adr_o           => mon.master.ic.rx_chip_adr,--16 
      length_o             => mon.master.ic.rx_length,--16
      reg_adr_o            => mon.master.ic.rx_reg_adr,--16
      uplink_parity_ok_o   => mon.master.ic.rx_up_parity_ok,--1 
      downlink_parity_ok_o => mon.master.ic.rx_down_parity_ok,--1
      err_o                => mon.master.ic.rx_err,
      valid_o              => rx_valid_single_m --1 --mon.master.ic.rx_valid   --> fix the single pulse to be able to be capture by C2C 
      );

  gbt_ic_rx_s : entity work.gbt_ic_rx
    port map (
      clock_i              => clk40,
      reset_i              => reset_i,
      gbt_frame_format_i   => lpgbt_version,
      frame_i              => slave_rx_frame,
      valid_i              => not slave_rx_empty,
      data_o               => mon.slave.ic.rx_data,
      chip_adr_o           => mon.slave.ic.rx_chip_adr,
      length_o             => mon.slave.ic.rx_length,
      reg_adr_o            => mon.slave.ic.rx_reg_adr,
      uplink_parity_ok_o   => mon.slave.ic.rx_up_parity_ok,
      downlink_parity_ok_o => mon.slave.ic.rx_down_parity_ok,
      err_o                => mon.slave.ic.rx_err,
      valid_o              => rx_valid_single_s --mon.slave.ic.rx_valid   --> fix the single pulse to be able to be capture by C2C
      );
      
ilagen: if c_ENABLE_ILA = '1' and g_CSM_ID = 0 generate

    ila_scm_ctrl_c2c : ila_0
    PORT MAP (
      clk    => clk40,
      probe0 => sca0_data_o_int, 
      probe1 => sca1_data_o_int, 
      probe2 => sca2_data_o_int, 
      probe3 => sca0_data_i_int, 
      probe4 => ic_data_o_int, 
      probe5 => ctrl.master.sca_enable, 
      probe6(0) => sca_reset, --ctrl.master.start_reset,
      probe7(0) => sca_connect, --ctrl.master.start_connect,
      probe8(0) => sca_command, --ctrl.master.start_command,
      probe9(0) => reset_i,
      probe10   => ic_data_i_int,
      probe11(0)=> slave_rx_empty,
      probe12(0)=> tx_start_read_s,
      probe13   => master_rx_frame,
      probe14(0)=> mon.master.ic.rx_err,
      probe15(0)=> mon.slave.ic.rx_err,
      probe16(0)=> master_rx_empty,
      probe17   => slave_rx_frame,
      probe18   => ec_data_i_int,
      probe19   => ec_data_o_int,
      probe20(0)=> tx_start_write_m,
      probe21(0)=> tx_start_write_s,
      probe22(0)=> tx_wr_s,
      probe23(0)=> tx_start_read_m,
      probe24   => sca1_data_i_int,
      probe25   => sca2_data_i_int,
      probe26   => ic_data_i_s,
      probe27   => sca3_data_o_int,
      probe28   => sca3_data_i_int
    );     


end generate;      

end structural;

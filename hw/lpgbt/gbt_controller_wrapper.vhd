library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;

library framework;
use framework.all;
use framework.system_types_pkg.all;
use framework.lpgbt_pkg.all;
use framework.constants_pkg.all;
use framework.board_pkg.all;
use framework.csm_pkg.all;

library gbt_sc;
use gbt_sc.sca_pkg.all;

entity gbt_controller_wrapper is
  generic(
    g_SCAS_PER_LPGBT : integer := 2
    );
  port(
    -- reset
    reset_i : in std_logic;

    clocks : in system_clocks_rt;

    -- take in all uplink / downlink data; need a mapping module to map this into SCA links etc..
    lpgbt_downlink_data_o : out lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
    lpgbt_uplink_data_i   : in  lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);

    tx_clk_i    : in std_logic;
    tx_clk_en_i : in std_logic;
    rx_clk_i    : in std_logic

    );
end gbt_controller_wrapper;

architecture Behavioral of gbt_controller_wrapper is

  signal reset : std_logic;

-- Clock & reset

  signal rx_clk_en_buf : std_logic;

  signal rx_clk_en_mux : std_logic;
  signal rx_clk_en     : std_logic;

  signal tx_clk_en_srl : std_logic_vector(6 downto 0);
  signal tx_clk_en_dly : std_logic;

  signal rx_reset_i : std_logic;        --! Reset RX datapath
  signal tx_reset_i : std_logic;        --! Reset TX datapath

  -- IC control
  signal tx_start_write : std_logic;    --! Request a write config. to the GBTx (IC)
  signal tx_start_read  : std_logic;    --! Request a read config. to the GBTx (IC)

  -- IC configuration
  signal tx_GBTx_address  : std_logic_vector(7 downto 0);   --! I2C address of the GBTx
  signal tx_register_addr : std_logic_vector(15 downto 0);  --! Address of the first register to be accessed
  signal tx_nb_to_be_read : std_logic_vector(15 downto 0);  --! Number of words/bytes to be read (only for read transactions)
  -- IC FIFO control

  signal tx_wr           : std_logic;                     --! Request a write operation into the internal FIFO (Data to GBTx)
  signal tx_data_to_gbtx : std_logic_vector(7 downto 0);  --! Data to be written into the internal FIFO

  signal rx_rd             : std_logic;                     --! Request a read operation of the internal FIFO (GBTx reply)
  signal rx_data_from_gbtx : std_logic_vector(7 downto 0);  --! Data from the FIFO

  -- IC Status
  signal tx_ready : std_logic;          --! IC core ready for a transaction
  signal rx_empty : std_logic;          --! Rx FIFO is empty (no reply from GBTx)

  signal rx_gbtx_addr   : std_logic_vector(7 downto 0);   --! I2C address of the GBTx (read from a reply)
  signal rx_mem_ptr     : std_logic_vector(15 downto 0);  --! I2C address of the first register read/written
  signal rx_nb_of_words : std_logic_vector(15 downto 0);  --! Number of words/bytes read/written

  -- SCA control
  signal sca_enable        : std_logic_vector((g_SCAS_PER_LPGBT-1) downto 0);  --! Enable flag to select SCAs
  signal start_reset_cmd   : std_logic;                                        --! Send a reset command to the enabled SCAs
  signal start_connect_cmd : std_logic;                                        --! Send a connect command to the enabled SCAs
  signal start_command     : std_logic;                                        --! Send the command set in input to the enabled SCAs
  signal inject_crc_error  : std_logic;                                        --! Emulate a CRC error

  -- SCA command
  signal tx_address : std_logic_vector(7 downto 0);   --! Command: address field (According to the SCA manual)
  signal tx_transID : std_logic_vector(7 downto 0);   --! Command: transaction ID field (According to the SCA manual)
  signal tx_channel : std_logic_vector(7 downto 0);   --! Command: channel field (According to the SCA manual)
  signal tx_command : std_logic_vector(7 downto 0);   --! Command: command field (According to the SCA manual)
  signal tx_data    : std_logic_vector(31 downto 0);  --! Command: data field (According to the SCA manual)

  signal rx_received : std_logic_vector((g_SCAS_PER_LPGBT-1) downto 0);  --! Reply received flag (pulse)
  signal rx_address  : reg8_arr((g_SCAS_PER_LPGBT-1) downto 0);          --! Reply: address field (According to the SCA manual)
  signal rx_control  : reg8_arr((g_SCAS_PER_LPGBT-1) downto 0);          --! Reply: control field (According to the SCA manual)
  signal rx_transID  : reg8_arr((g_SCAS_PER_LPGBT-1) downto 0);          --! Reply: transaction ID field (According to the SCA manual)
  signal rx_channel  : reg8_arr((g_SCAS_PER_LPGBT-1) downto 0);          --! Reply: channel field (According to the SCA manual)
  signal rx_len      : reg8_arr((g_SCAS_PER_LPGBT-1) downto 0);          --! Reply: len field (According to the SCA manual)
  signal rx_error    : reg8_arr((g_SCAS_PER_LPGBT-1) downto 0);          --! Reply: error field (According to the SCA manual)
  signal rx_data     : reg32_arr((g_SCAS_PER_LPGBT-1) downto 0);         --! Reply: data field (According to the SCA manual)

  -- EC line
  signal ec_data_down : reg2_arr((g_SCAS_PER_LPGBT-1) downto 0);  --! (TX) Array of bits to be mapped to the TX GBT-Frame
  signal ec_data_up   : reg2_arr((g_SCAS_PER_LPGBT-1) downto 0);  --! (RX) Array of bits to be mapped to the RX GBT-Frame

  -- IC lines
  signal ic_data_down : std_logic_vector(1 downto 0);  --! (TX) Array of bits to be mapped to the TX GBT-Frame (bits 83/84)
  signal ic_data_up   : std_logic_vector(1 downto 0);  --! (RX) Array of bits to be mapped to the RX GBT-Frame (bits 83/84)

  -- TODO: need to drive this from axi slave
  -- 0 = csm0 master
  -- 1 = csm0 slave
  -- 2 = csm1 master
  -- 3 = csm1 slave
  -- etc....
  signal lpgbt_link_sel        : integer := 0;
  signal lpgbt_link_sel_master : boolean := false;
  signal lpgbt_broadcast       : boolean := false;

  signal sca_link_sel  : integer := 0;
  signal sca_broadcast : boolean := false;

begin

  process (clocks.clock40)
  begin
    if (rising_edge(clocks.clock40)) then
      reset <= reset;
    end if;
  end process;

  --------------------------------------------------------------------------------
  -- instantiate a single gbtsc core, connect it to a single axi slave
  -- use a multiplexer to fan the single gbt_sc core out to all of the different lpgbts
  --------------------------------------------------------------------------------

  gbtsc_top_inst : entity gbt_sc.gbtsc_top
    generic map (
      g_IC_FIFO_DEPTH => 20,
      g_ToLpGBT       => 1,
      g_SCA_COUNT     => g_SCAS_PER_LPGBT
      )
    port map (

      -- tx to lpgbt etc
      tx_clk_i  => tx_clk_i,
      tx_clk_en => tx_clk_en_i,

      -- rx from lpgbt etc
      rx_clk_i  => rx_clk_i,
      rx_clk_en => rx_clk_en,

      -- IC/EC data from controller
      ec_data_o => ec_data_down,
      ic_data_o => ic_data_down,

      -- multiplexed IC/EC data from all lpgbts
      ec_data_i => ec_data_up,
      ic_data_i => ic_data_up,

      -- reset
      rx_reset_i => reset,
      tx_reset_i => reset,

      -- connect all of the following to AXI slave

      tx_start_write_i => tx_start_write,
      tx_start_read_i  => tx_start_read,

      tx_GBTx_address_i  => tx_gbtx_address,
      tx_register_addr_i => tx_register_addr,
      tx_nb_to_be_read_i => tx_nb_to_be_read,

      tx_wr_i             => tx_wr,
      tx_data_to_gbtx_i   => tx_data_to_gbtx,
      rx_rd_i             => rx_rd,
      rx_data_from_gbtx_o => rx_data_from_gbtx,
      tx_ready_o          => tx_ready,
      rx_empty_o          => rx_empty,
      rx_gbtx_addr_o      => rx_gbtx_addr,
      rx_mem_ptr_o        => rx_mem_ptr,
      rx_nb_of_words_o    => rx_nb_of_words,
      sca_enable_i        => sca_enable,
      start_reset_cmd_i   => start_reset_cmd,
      start_connect_cmd_i => start_connect_cmd,
      start_command_i     => start_command,
      inject_crc_error    => inject_crc_error,
      tx_address_i        => tx_address,
      tx_transID_i        => tx_transID,
      tx_channel_i        => tx_channel,
      tx_command_i        => tx_command,
      tx_data_i           => tx_data,
      rx_received_o       => rx_received,
      rx_address_o        => rx_address,
      rx_control_o        => rx_control,
      rx_transID_o        => rx_transID,
      rx_channel_o        => rx_channel,
      rx_len_o            => rx_len,
      rx_error_o          => rx_error,
      rx_data_o           => rx_data

      );

  --------------------------------------------------------------------------------
  -- Input mux from LPGBT to sc controller
  --------------------------------------------------------------------------------

  -- multiplex all of the inputs from lpgbt-fpga cores
  -- TODO: should clock this mux for fan-in.... probably a couple of cycles would make sense
  -- or clock on valid_in and can apply a multi-cycle path constraint
  -- this is only slow control--- latency is OK
  --
  --
  -- clock       --/0=\==/1=\==/2=\==/3=\==/4=\==/5=\==/6=\==/7=\==
  -- data        __/============================================\__
  -- en_i        __|=====\_________________________________________
  -- en_mux      ________|=====\___________________________________
  -- en          ______________|=====\_____________________________
  -- dat_mux     ______________/===================================

  process (rx_clk_i)
    constant up_0 : integer := CSM_SCA_UPLINK_ELINK0;
    constant up_1 : integer := CSM_SCA_UPLINK_ELINK1;
  begin
    if (rising_edge(rx_clk_i)) then

      -- TODO: mux clock enable fan-in... big fan-in :(
      rx_clk_en_mux <= lpgbt_uplink_data_i (lpgbt_link_sel).valid;
      rx_clk_en     <= rx_clk_en_mux;

      if (rx_clk_en_mux = '1') then

        -- even bigger fan-in... TODO: apply multicycle or datapathonly constraints to ease timing? ffs to buffer?
        ic_data_up    <= lpgbt_uplink_data_i (lpgbt_link_sel).ic;
        ec_data_up(0) <= lpgbt_uplink_data_i (lpgbt_link_sel).data(8*up_0+4) & lpgbt_uplink_data_i (lpgbt_link_sel).data(8*up_0 + 2);
        ec_data_up(1) <= lpgbt_uplink_data_i (lpgbt_link_sel).data(8*up_0+4) & lpgbt_uplink_data_i (lpgbt_link_sel).data(8*up_0 + 2);
        -- TODO: need to reduce bits for 320 to 80 mb conversion on external elinks... just pick two bits... or something clever using 2 bits???

      end if;
    end if;
  end process;


  --------------------------------------------------------------------------------
  -- Output Mux to LPGBTS
  --------------------------------------------------------------------------------
  process (tx_clk_i, ec_data_down)
    variable control_to_sca0 : std_logic_vector (7 downto 0);
    variable control_to_sca1 : std_logic_vector (7 downto 0);

    constant down_0 : integer := CSM_SCA_DOWNLINK_ELINK0;
    constant down_1 : integer := CSM_SCA_DOWNLINK_ELINK1;

    -- function to replicate a std_logic bit some number of times
    -- equivalent to verilog's built in {n{x}} operator
    function repeat(B : std_logic; N : integer)
      return std_logic_vector
    is
      variable result : std_logic_vector(1 to N);
    begin
      for i in 1 to N loop
        result(i) := B;
      end loop;
      return result;
    end;

  begin
    output_mux_gen : for I in 0 to c_NUM_LPGBT_DOWNLINKS-1 loop

      -- replicate sca outputs bits four times each because of 80 --> 320 mbps conversion
      control_to_sca0 := repeat(ec_data_down(0)(1), 4) & repeat(ec_data_down(0)(0), 4);
      control_to_sca1 := repeat(ec_data_down(1)(1), 4) & repeat(ec_data_down(1)(0), 4);

      -- Want to fan out the data with a clock for better timing... but we do
      -- NOT control the valid bit here since it is common with the data bus
      -- need to make sure that the output data is aligned to the valid bit
      --
      -- just clocking on tx_clk_en_i will delay by 1 clk at the output... instead
      -- clk on a delayed version of tx_clk_en_i
      --
      -- i.e. we want to delay the dat output by a full 25ns rather than just 3.125ns
      --
      -- so we want a tx_en delayed late by 7 clocks
      --               ____  ____  ____  ____  ____  ____  ____  ____  ____  ____
      -- cycle       __|0 |__|1 |__|2 |__|3 |__|4 |__|5 |__|6 |__|7 |__|0 |__|  |
      -- data        __/============================================\_____________
      -- en_i        __/=====\_________________________________________/=====\____
      -- en_dly      ____________________________________________/=====\__________
      -- dat         __________________________________________________/==========

      if (rising_edge(tx_clk_i)) then
        tx_clk_en_srl <= tx_clk_en_srl (tx_clk_en_srl'length-2 downto 0) & tx_clk_en_i;

      end if;
      tx_clk_en_dly <= tx_clk_en_srl(6);

      if (rising_edge(tx_clk_i)) then
        if (tx_clk_en_dly = '1') then

          -- if broadcast ? send to all of the lpgbts
          if (lpgbt_broadcast) then
            lpgbt_downlink_data_o (I).ic <= ic_data_down;
            lpgbt_downlink_data_o (I).ec <= ic_data_down;

          -- if master
          elsif (lpgbt_link_sel = I and lpgbt_link_sel_master) then
            lpgbt_downlink_data_o (I).ic <= ic_data_down;

          -- if slave
          elsif (lpgbt_link_sel = I and not lpgbt_link_sel_master) then
            lpgbt_downlink_data_o (I).ec <= ic_data_down;

          -- if idle (nothing selected, should block writes)
          else
            lpgbt_downlink_data_o (I).ic <= (others => '1');  -- FIXME should replace with an idle pattern
            lpgbt_downlink_data_o (I).ec <= (others => '1');  -- FIXME should replace with an idle pattern
          end if;


          -- if broadcast ? send to all of the scas
          if (sca_broadcast) then

            lpgbt_downlink_data_o (I).data((1+down_0)*8-1 downto down_0*8) <= control_to_sca0;  -- sca0
            lpgbt_downlink_data_o (I).data((1+down_1)*8-1 downto down_1*8) <= control_to_sca1;  -- sca1

          -- select a CSM... choose which SCA on SC controller port
          elsif (sca_link_sel = I) then

            lpgbt_downlink_data_o (I).data((1+down_0)*8-1 downto down_0*8) <= control_to_sca0;
            lpgbt_downlink_data_o (I).data((1+down_1)*8-1 downto down_1*8) <= control_to_sca1;

          -- idle
          else

            lpgbt_downlink_data_o (I).data((1+down_0)*8-1 downto down_0*8) <= (others => '1');  -- FIXME replace with idle pattern ?? or not?? is zero ok?
            lpgbt_downlink_data_o (I).data((1+down_1)*8-1 downto down_1*8) <= (others => '1');  -- FIXME replace with idle pattern

          end if;
        end if;
      end if;


    end loop;
  end process;

end Behavioral;

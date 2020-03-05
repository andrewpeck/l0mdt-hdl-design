library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

entity gbt_ic_controller is
  port(
    -- reset
    reset_i : in std_logic;

    -- clocks
    -- TODO: eliminate dependency on 40MHz clock
    clock40  : in std_logic;
    clock320 : in std_logic;

    -- GBT I2C address
    gbt_chip_address_i : in  std_logic_vector(6 downto 0);
    gbt_chip_address_o : out std_logic_vector(6 downto 0);

    -- GBT IC elinks and valid flags
    gbt_uplink_ic_i       : in std_logic_vector(1 downto 0);
    gbt_uplink_ic_valid_i : in std_logic;

    -- FIXME: need to sync this to the same 320MHz enable that the data will be
    -- on
    gbt_downlink_ic_o       : out std_logic_vector(1 downto 0);

    gbt_uplink_parity_ok_o   : out std_logic;
    gbt_downlink_parity_ok_o : out std_logic;
    gbt_uplink_err_o         : out std_logic;

    -- Control

    gbt_downlink_address_i : in  std_logic_vector(15 downto 0);
    gbt_uplink_address_o   : out std_logic_vector(15 downto 0);

    gbt_downlink_data_i  : in  std_logic_vector(31 downto 0);
    gbt_downlink_valid_i : out std_logic;

    gbt_uplink_data_o  : out std_logic_vector(31 downto 0);
    gbt_uplink_valid_o : out std_logic;

    gbt_downlink_length_i : in  std_logic_vector(15 downto 0);
    gbt_uplink_length_o   : out std_logic_vector(15 downto 0);

    gbt_ic_write_req_i  : in  std_logic;
    gbt_ic_write_done_o : out std_logic;
    gbt_ic_read_req_i   : in  std_logic
    --ic_read_ready_o         : out std_logic

    );
end gbt_ic_controller;

architecture Behavioral of gbt_ic_controller is

  constant SOF_EOF : std_logic_vector(7 downto 0) := x"7e";

  signal reset : std_logic;

  -- unstuffer signals
  signal unstuffer_frame  : std_logic_vector (7 downto 0);
  signal unstuffer_valid  : std_logic;
  signal unstuffer_header : std_logic;

begin

  process (clock40)
  begin
    if (rising_edge(clock40)) then
      reset <= reset_i;
    end if;
  end process;

  --------------------------------------------------------------------------------
  -- RX From LPGBT
  --------------------------------------------------------------------------------
  gbt_unstuffer_inst : entity work.gbt_unstuffer
    port map (

      clock_i => clock320,

      reset_i => reset,

      ic_i       => gbt_uplink_ic_i,
      clock_en_i => gbt_uplink_ic_valid_i,

      frame_o  => unstuffer_frame,
      valid_o  => unstuffer_valid,
      header_o => unstuffer_header

      );

  gbt_ic_rx_inst : entity work.gbt_ic_rx
    port map (

      clock_i => clock320,

      reset_i => reset,

      frame_i  => unstuffer_frame,
      valid_i  => unstuffer_valid,
      header_i => unstuffer_header,

      chip_adr_o           => gbt_chip_address_o,
      data_o               => gbt_uplink_data_o,
      length_o             => gbt_uplink_length_o,
      reg_adr_o            => gbt_uplink_address_o,
      uplink_parity_ok_o   => gbt_uplink_parity_ok_o,
      downlink_parity_ok_o => gbt_downlink_parity_ok_o,
      err_o                => gbt_uplink_err_o,
      valid_o              => gbt_uplink_valid_o
      );

  --------------------------------------------------------------------------------
  -- TX to LPGBT
  --------------------------------------------------------------------------------

  gbt_ic_tx_inst : entity work.gbt_ic_tx
    port map (
      reset_i           => reset,
      gbt_clk_i         => clock40,
      gbt_i2c_address   => gbt_chip_address_i,
      gbt_tx_ic_elink_o => gbt_downlink_ic_o,
      ic_rw_address_i   => gbt_downlink_address_i,
      ic_w_data_i       => gbt_downlink_data_i,
      ic_rw_length_i    => gbt_downlink_length_i (2 downto 0),
      ic_write_req_i    => gbt_ic_write_req_i,
      ic_write_done_o   => gbt_ic_write_done_o,
      ic_read_req_i     => gbt_ic_read_req_i
      );

end Behavioral;

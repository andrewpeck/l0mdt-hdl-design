library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library framework;
use framework.all;
use framework.sector_logic_pkg.all;
use framework.system_types_pkg.all;
use framework.mdttp_types_pkg.all;
use framework.lpgbt_pkg.all;
use framework.constants_pkg.all;
use framework.mgt_pkg.all;
use framework.board_pkg.all;
use framework.board_pkg_common.all;

entity gbt_controller_wrapper is
  port(
    -- reset
    reset_i : in std_logic;

    -- clocks
    clocks : in system_clocks_rt;

    lpgbt_downlink_data_o : out lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
    lpgbt_uplink_data_i   : in  lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0)

    );
end gbt_controller_wrapper;

architecture Behavioral of gbt_controller_wrapper is

  signal reset : std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

  signal clock40  : std_logic;
  signal clock320 : std_logic;

  -- FIXME: these should be controlled by an AXI slave I guess

  --  downlink to lpgbt
  signal gbt_chip_address_i       : std_logic_vector(6 downto 0)  := (others => '0');
  signal gbt_downlink_ic_o  : std_logic_vector(1 downto 0);
  signal gbt_downlink_address_i   : std_logic_vector(15 downto 0) := (others => '0');
  signal gbt_downlink_data_i      : std_logic_vector(31 downto 0) := (others => '0');
  signal gbt_downlink_length_i    : std_logic_vector(15 downto 0) := (others => '0');
  signal gbt_downlink_parity_ok_o : std_logic;
  signal gbt_downlink_valid_i     : std_logic                     := '0';
  signal gbt_ic_read_req_i      : std_logic := '0';
  signal gbt_ic_write_done_o    : std_logic;
  signal gbt_ic_write_req_i     : std_logic := '0';

  --  uplink from lpgbt
  signal gbt_uplink_ic_i        : std_logic_vector(1 downto 0);
  signal gbt_uplink_ic_valid_i  : std_logic;
  signal gbt_chip_address_o     : std_logic_vector(6 downto 0);
  signal gbt_uplink_address_o   : std_logic_vector(15 downto 0);
  signal gbt_uplink_data_o      : std_logic_vector(31 downto 0);
  signal gbt_uplink_err_o       : std_logic;
  signal gbt_uplink_length_o    : std_logic_vector(15 downto 0);
  signal gbt_uplink_parity_ok_o : std_logic;
  signal gbt_uplink_valid_o     : std_logic;

begin

  process (clocks.clock40)
  begin
    if (rising_edge(clocks.clock40)) then
      reset <= (others => reset_i);
    end if;
  end process;


  ic_gen : for I in 0 to c_NUM_MGTS-1 generate
    -- only generate downlinks for duplex lpgbts
    downlink_if : if (lpgbt_downlink_idx_array(I) /= -1) generate

      constant idx : integer := lpgbt_downlink_idx_array(I);

    begin

      gbt_ic_controller_inst : entity work.gbt_ic_controller
        port map (
          --
          reset_i  => reset(idx),
          clock40  => clocks.clock40,
          clock320 => clocks.clock320,

          --  downlink to lpgbt
          gbt_downlink_ic_o        => lpgbt_downlink_data_o(idx).ic,
          gbt_chip_address_i       => gbt_chip_address_i,
          gbt_downlink_address_i   => gbt_downlink_address_i,
          gbt_downlink_data_i      => gbt_downlink_data_i,
          gbt_downlink_length_i    => gbt_downlink_length_i,
          gbt_downlink_valid_i     => gbt_downlink_valid_i,
          gbt_ic_read_req_i        => gbt_ic_read_req_i,
          gbt_ic_write_req_i       => gbt_ic_write_req_i,
          gbt_downlink_parity_ok_o => open,
          gbt_ic_write_done_o      => open,

          --  uplink from lpgbt
          gbt_uplink_ic_i        => lpgbt_uplink_data_i(idx).ic,
          gbt_uplink_ic_valid_i  => lpgbt_uplink_data_i(idx).valid,
          gbt_chip_address_o     => open,
          gbt_uplink_address_o   => open,
          gbt_uplink_data_o      => open,
          gbt_uplink_err_o       => open,
          gbt_uplink_length_o    => open,
          gbt_uplink_parity_ok_o => open,
          gbt_uplink_valid_o     => open

          );
    end generate;
  end generate ic_gen;


end Behavioral;

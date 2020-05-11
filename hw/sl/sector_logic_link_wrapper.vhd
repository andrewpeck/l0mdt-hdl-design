library ieee;
use ieee.std_logic_1164.all;

library sl; 

library work;
use work.system_types_pkg.all;
use work.sector_logic_pkg.all;
use work.constants_pkg.all;

entity sector_logic_link_wrapper is
port(

    clock : in std_logic;
    reset : in std_logic;

    -- 32 bits / bx from mgt
    sl_rx_mgt_word_array_i : in std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    sl_rx_data_o : out sl_rx_data_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    -- 32 bits / bx to mgt
    sl_tx_mgt_word_array_o : out  std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    sl_tx_data_i : in sl_tx_data_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    --driven from pattern generator in ex
    sl_tx_ctrl_o : out sl_tx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0)

);
end sector_logic_link_wrapper;


architecture Behavioral of  sector_logic_link_wrapper is

begin

    --------------------------------------------------------------------------------
    -- Downlink
    --------------------------------------------------------------------------------

    downlink_gen : for I in 0 to (c_NUM_SECTOR_LOGIC_OUTPUTS-1) generate
    begin

      sector_logic_tx_packet_former_1: entity sl.sector_logic_tx_packet_former
        port map (
          tx_usrclk2      => clock,
          userdata_tx     => sl_tx_mgt_word_array_o(I),
          txctrl0         => sl_tx_ctrl_o(I).ctrl0,
          txctrl1         => sl_tx_ctrl_o(I).ctrl1,
          txctrl2         => sl_tx_ctrl_o(I).ctrl2,
          packet_userdata => sl_tx_data_i(I).data,
          packet_valid    => sl_tx_data_i(I).valid,
          packet_txctrl0  => std_logic_vector'(x"000000"),
          packet_txctrl1  => std_logic_vector'(x"000000"),
          packet_txctrl2  => std_logic_vector'(x"100000") -- FIXME check this
        );

    end generate;

    --------------------------------------------------------------------------------
    -- Uplink
    --------------------------------------------------------------------------------

    uplink_gen : for I in 0 to (c_NUM_SECTOR_LOGIC_INPUTS-1) generate

    sector_logic_rx_packet_former_1: entity sl.sector_logic_rx_packet_former

      port map (
        rx_usrclk2            => clock,
        reset                 => reset,
        rxctrl0               => (others => std_logic'('0')),
        rxctrl1               => (others => std_logic'('0')),
        rxctrl2               => (others => std_logic'('0')),
        rxctrl3               => (others => std_logic'('0')),
        userdata_rx           => sl_rx_mgt_word_array_i(I),
        packet_rxctrl0        => open, -- not connected to anythin
        packet_rxctrl1        => open, -- not connected to anythin
        packet_rxctrl2        => open, -- not connected to anythin
        packet_rxctrl3        => open, -- not connected to anythin
        packet_userdata       => sl_rx_data_o(I).data,
        packet_locked         => sl_rx_data_o(I).locked,
        packet_valid          => sl_rx_data_o(I).valid,
        packet_error_detected => sl_rx_data_o(I).err

    );

    end generate;

end Behavioral;

library ieee;
use ieee.std_logic_1164.all;

package sector_logic_pkg is

  --data-----------------------------------------------------------------------
  type sl_tx_data_rt is record
    data : std_logic_vector (191 downto 0);
    valid : std_logic;
  end record;

  type sl_rx_data_rt is record
    data : std_logic_vector (191 downto 0);
    valid : std_logic;
    locked : std_logic;
    err : std_logic;
  end record;

  type sl_rx_data_rt_array is array (integer range <>) of sl_rx_data_rt;
  type sl_tx_data_rt_array is array (integer range <>) of sl_tx_data_rt;

  --control--------------------------------------------------------------------

  type sl_ctrl_rt is record
    ctrl0 : std_logic_vector (3 downto 0);
    ctrl1 : std_logic_vector (3 downto 0);
    ctrl2 : std_logic_vector (3 downto 0);
    ctrl3 : std_logic_vector (3 downto 0);
  end record;

  type sl_ctrl_rt_array is array (integer range <>) of sl_ctrl_rt;


end package sector_logic_pkg;

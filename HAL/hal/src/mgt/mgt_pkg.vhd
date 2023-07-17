library ieee;
use ieee.std_logic_1164.all;

package mgt_pkg is

  type mgt_drp_in_rt is record
    drpaddr_in : std_logic_vector(9 downto 0);
    drpclk_in  : std_logic_vector(0 downto 0);
    drpdi_in   : std_logic_vector(15 downto 0);
    drpen_in   : std_logic_vector(0 downto 0);
    drpwe_in   : std_logic_vector(0 downto 0);
  end record;
  type mgt_drp_in_rt_array is array (integer range <>) of mgt_drp_in_rt;

  type mgt_drp_out_rt is record
    drpdo_out  : std_logic_vector(15 downto 0);
    drprdy_out : std_logic;
  end record;
  type mgt_drp_out_rt_array is array (integer range <>) of mgt_drp_out_rt;

  type mgt_status_rt is record
    rxcdr_stable            : std_logic;
    powergood               : std_logic;
    buffbypass_tx_done_out  : std_logic;
    buffbypass_tx_error_out : std_logic;
    rx_pma_reset_done       : std_logic;
    tx_pma_reset_done       : std_logic;
    tx_reset_done           : std_logic;
    rx_reset_done           : std_logic;
    tx_prg_div_reset_done   : std_logic;
  end record;
  type mgt_status_rt_array is array (integer range <>) of mgt_status_rt;

end package mgt_pkg;

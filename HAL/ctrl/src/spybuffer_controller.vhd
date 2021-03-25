library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library ctrl_lib;
use ctrl_lib.spies_pkg.all;

entity spybuffer_controller is
  port(
    clock         : in std_logic;
    freeze        : in std_logic;
    playback_mode : in std_logic_vector (1 downto 0);

    -- to/from axi controllers
    axi_spy_ctrl : in  spy_ctrl_t;
    axi_spy_mon  : out spy_mon_t;

    -- to/from user logic
    user_spy_ctrl : out spy_ctrl_t;
    user_spy_mon  : in  spy_mon_t
    );
end spybuffer_controller;

architecture behavioral of spybuffer_controller is
begin

  user_spy_ctrl.tar_spy_ctrl.freeze   <= freeze;                     --ctrl
  user_spy_ctrl.tar_spy_ctrl.playback <= playback_mode;              --ctrl
  user_spy_ctrl.tar_spy_ctrl.bram     <= axi_spy_ctrl.tar_spy.bram;  --ctrl
  axi_spy_mon.tar_spy_mon.dout        <= user_spy_mon.tar_spy.dout;  --mon

end behavioral;

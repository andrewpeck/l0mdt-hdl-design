
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library stupid;

package types is


  type dctrl is record
    ctrl1 : ctrl;
    ctrl2 : ctrl;
  end record dctrl;

  type ctrl is record
    clk : std_logic;
    rst : std_logic;
  end record ctrl;

end package types;

package body types is

  

end package body types;

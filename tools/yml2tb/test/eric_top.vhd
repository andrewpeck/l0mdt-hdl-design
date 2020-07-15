library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.some_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library ult_lib;

entity eric_top is
  generic (
    DUMMY : boolean := false
    );

  port (
    -- pipeline clock
    ctrl     : in l0mdt_control_rt;
    -- ttc
    ttc      : in l0mdt_ttc_rt;
    -- hits
    mdt_hits : in mdt_polmux_rt (integer range <>);

    sump : out std_logic
    );
end entity eric_top;

architecture arch of eric_top is

  signal hits : mdt_polmux(integer range <>);

  process (ctrl.clk, ctrl.rst) is
  begin  -- process
    if ctrl.rst = '0' then              -- asynchronous reset (active low)
      
    elsif ctrl.clk'event and ctrl.clk = '1' then  -- rising clock edge
      sump <= xor_reduce( vectorify( mdt_hits))
    end if;
  end process;

begin  -- architecture arch



end architecture arch;

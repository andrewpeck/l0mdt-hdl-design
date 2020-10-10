library ieee;
library types_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use types_def.common_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_hub is
  port (port_ir : in  hub_irt; port_or : out hub_ort);
end entity daq_hub;

architecture V2 of daq_hub is
  
begin

  port_or.dst <= port_ir.cnt
                 when port_ir.cnt.nempty = '1'
                 else port_ir.pld;

  port_or.cnt <= port_ir.dst
                 when port_ir.cnt.nempty = '1'
                 else nullify(port_or.cnt);

  port_or.pld <= port_ir.dst
                 when port_ir.cnt.nempty = '0'
                 else nullify(port_or.pld);

end V2;

--------------------------------------------------------------------------------

library ieee;
library types_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use types_def.common_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_hub_top is
  port (port_iv : in  hub_ivt; port_ov : out hub_ovt);
end entity daq_hub_top;

architecture V2 of daq_hub_top is
  signal port_ir : hub_irt;
  signal port_or : hub_ort;
begin
  port_ir <= structify(port_iv, port_ir);
  port_ov <= vectorify(port_or, port_ov);
  u_hub : entity work.daq_hub
    port map (port_ir, port_or);
end V2;

-- This is the top level file for the NSW L1A algorithm. It is based
-- on a scheme that can be described as a matrix where each row
-- (besides the first one) is a data stream and every column is a
-- concurrent request handler. The first row is reserved to handle
-- header information that is common to all the processing cells and
-- that need to be sent out later.
--
-- The data input interface, named as Snake Interface after a joke
-- during discussions on a white board where lines representing this
-- path where marked with an "snake" pattern. The Snake Interface is
-- very simple: a variable length payload, a BCID signal to
-- characterize the payload information and a write strobe to validate
-- the payload. Each Snake Interface is dedicated to a processing row
-- in the L1A processing matrix.
--
-- Upon receiving an L1A request, a processing column will be
-- activated, which will happen always from left to right. If all the
-- columns are busy, it will wait for the current pointed column to be
-- released. 
--
-- In the L1A processing matrix, multiple columns can be activated in
-- parallel, however there is just one lane to send data out, which is
-- a elink in a CERN GBT link. Another constraint is that data related
-- to L1A requests must be sent in the same order that the L1A
-- requests were received. Thus information is retrieved by a packet
-- builder block for one column at a time and it will go always from
-- left to right as well, which will solve both constraints.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library daq_lib;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;
use daq_lib.daq_row_defs_pkg.all;
use daq_lib.daq_header_cell_pkg.all;
use daq_lib.daq_data_cell_pkg.all;
use daq_lib.daq_bus_conv_pkg.all;

library ttc_lib;
use ttc_lib.ttc_defs_pkg.all;

package top_daq_pkg is

  component top_daq is
    port(i: in top_irt; o: out top_ort);
  end component top_daq;

end package top_daq_pkg;

-----------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library daq_lib;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;
use daq_lib.daq_row_defs_pkg.all;
use daq_lib.daq_header_cell_pkg.all;
use daq_lib.daq_data_cell_pkg.all;
use daq_lib.daq_bus_conv_pkg.all;
use daq_lib.daq_algo_pkg.all;

library ttc_lib;
use ttc_lib.ttc_defs_pkg.all;

entity top_daq is
  port(i: in top_irt; o: out top_ort);
end entity top_daq;

architecture V2 of top_daq is

  signal algo_bus : algo_bus_at;

begin

  flows: for k in DAQ_N_FLOWS-1 downto 0 generate

    algo_bus(k).i.sys <= i.sys;
    algo_bus(k).i.ttc <= i.ttc;
    algo_bus(k).i.ctrl <= i.ctrl;
    algo_bus(k).i.stream_bus <= i.flow_bus(k);
    algo_bus(k).i.f2e <= i.f2e_bus(k);

    algo_bus(k).o.ctrl <= o.ctrl_bus(k);
    algo_bus(k).o.f2e <= o.f2e_bus(k);
    
    daq_algo_u : component daq_algo
      port map (i => algo_bus(k).i, o => algo_bus(k).o);

  end generate flows;

end architecture V2;
  

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
use daq_lib.daq_row_defs_pkg.all;

package daq_header_cell_pkg is
  component daq_header_cell is
    generic (G : cell_generics_rt);
    port (
      i : in cell_irt;
      o : out cell_ort
    ); 
  end component daq_header_cell;
end package daq_header_cell_pkg;

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

entity daq_header_cell is
  generic (G : cell_generics_rt := (INPUT_DATA_LEN => daq_hdr_rvt'length,
                                    COUNTER_LEN => 16));
  port (i : in cell_irt; o : out cell_ort);
end entity daq_header_cell;

architecture V2 of daq_header_cell is

  signal hdr_rv : daq_hdr_rvt;

  -- the 'loaded' flag helps to avoid overwriting values once the processing
  -- cell is activated.
  signal loaded : std_logic := '0';

begin

  -- there is no FIFO or counters so no errors for now.
  o.mngt.full <= '0';
  o.mngt.unexpected <= '0';

  process (i.sys.clk320)
  begin
    if rising_edge(i.sys.clk320) then

      if i.sys.rst = '1' then
        o.bconv.nempty <= '0';
        o.mngt.done <= '0';
        loaded <= '0';

      else
        
        -- registering of the event values related to a layer.
        if i.mngt.en = '1' then

          if loaded = '0' then
            o.bconv.data <= i.stream.data;
            o.bconv.nempty <= '1';
            o.mngt.done <= '1';
            loaded <= '1';
          end if;
          
        else
          o.mngt.done <= '0';
          loaded <= '0';
        end if;

        -- providing a fifo-like interface to stream the header information. This
        -- is accomplished making use of shift registers.
        if i.bconv.rd_strb = '1' then
          o.bconv.nempty <= '0';
        end if;

      end if;
        
    end if;
  end process;

end V2;

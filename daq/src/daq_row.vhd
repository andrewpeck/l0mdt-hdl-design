-- The header processor row will keep one header cell for each data
-- column instantiated, which is configured in the daq_package. The
-- header cell is supposed to prepare the header of the packet to be
-- sent by the Packet Builder.

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
use daq_lib.daq_user_defs_pkg.all;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;
use daq_lib.daq_row_defs_pkg.all;
use daq_lib.daq_header_cell_pkg.all;
use daq_lib.daq_data_cell_pkg.all;
use daq_lib.daq_bus_conv_pkg.all;

package daq_row_pkg is
  component daq_row is
    generic(G: row_generics_rt);
    port (i: in row_irt; o: out row_ort);
  end component daq_row;
end package daq_row_pkg;

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
use daq_lib.daq_user_defs_pkg.all;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;
use daq_lib.daq_row_defs_pkg.all;
use daq_lib.daq_header_cell_pkg.all;
use daq_lib.daq_data_cell_pkg.all;
use daq_lib.daq_bus_conv_pkg.all;

entity daq_row is
  generic(G: row_generics_rt);
  port (i : in row_irt; o : out row_ort);
end entity daq_row;

architecture V2 of daq_row is
                           
  signal col_rd_en_c : natural;
  
  signal cell_ar : cell_bus_at;
  
  signal bconv_r : bconv_rt;
  
begin

  -- instantiating blocks ======================================================

  -- or header cells are generated for this row --------------------------------
  if_header_row: if G.CELL_TYPE = 0 generate
    gen_header_cells : for i in DAQ_N_PIPELINES-1 downto 0 generate
      daq_header_cell_u : component daq_header_cell
        generic map(G => (INPUT_DATA_LEN => G.INPUT_DATA_LEN,
                          COUNTER_LEN => G.COUNTER_LEN))
        port map (i => cell_ar(i).i, o => cell_ar(i).o);
    end generate gen_header_cells;
  end generate if_header_row;

  -- or data cells are generated for this row ----------------------------------
  if_data_row: if G.CELL_TYPE = 1 generate
    gen_data_cells : for i in DAQ_N_PIPELINES-1 downto 0 generate
      daq_data_cell_u : component daq_data_cell
        generic map(G => (INPUT_DATA_LEN => G.INPUT_DATA_LEN,
                          COUNTER_LEN => G.COUNTER_LEN))
        port map (i => cell_ar(i).i, o => cell_ar(i).o);
    end generate gen_data_cells;
  end generate if_data_row;

  daq_bus_conv_u : daq_bus_conv
    generic map(G => (INPUT_DATA_LEN => G.INPUT_DATA_LEN,
                      OUTPUT_DATA_LEN => G.OUTPUT_DATA_LEN,
                      COUNTER_LEN => G.COUNTER_LEN))
    port map (i => bconv_r.i, o => bconv_r.o);

  -- routing ===================================================================

  gen_cell_conn : for j in DAQ_N_PIPELINES-1 downto 0 generate
    -- sys signals 
    cell_ar(j).i.sys <= i.sys;

    -- cell payload signals shared by all cells
    cell_ar(j).i.stream <= i.stream;

    -- ack from bconv (which comes from pkt bldr)
    cell_ar(j).i.bconv <= bconv_r.o.cell
                          when col_rd_en_c = j
                          else nullify(cell_ar(j).i.bconv);

  end generate gen_cell_conn;
   
  bconv_r.i.sys <= i.sys;
  
  -- convert read selection signals coming from management
  col_rd_en_c <= to_integer(unsigned(i.mngt.col_rd_en));
  
  -- mux cell to bconv 
  bconv_r.i.cell <= cell_ar(col_rd_en_c).o.bconv;
  -- cell_ar(col_rd_en_c).i.bconv <= bconv_r.o.cell;
  
  -- row out ===================================================================
  o.pkt_bldr <= bconv_r.o.pkt_bldr;
  o.mngt.done <= cell_ar(col_rd_en_c).o.mngt.done;
  
  -- no error handling for now
  o.mngt.err <= (others => '0');

end V2;

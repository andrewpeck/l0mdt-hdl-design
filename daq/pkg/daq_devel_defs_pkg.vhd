library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

package daq_devel_defs_pkg is

  constant DAQ_N_PIPELINES : integer := 16;

  constant DAQ_N_STREAMS : integer := 1;

  constant DAQ_N_FLOWS : integer := 6;

  subtype snake_paths_desc_t is integer_bus_at(DAQ_N_STREAMS-1 downto 0);

  constant DAQ_STREAMS : snake_paths_desc_t := (0 => 40);

  constant DEV_CELL_DATA_BUS_WIDTH : integer := 512;

  constant DEV_CELL_COUNTER_WIDTH : integer := 12;

  constant DEV_LXA_REQ_DATA_BUS_WIDTH : integer := 512;

  constant DEV_LXA_REQ_COUNTER_WIDTH : integer := 11;

  constant DEV_ROWS : integer := DAQ_N_STREAMS + 1;

  constant DEV_ROWS_ERR_WIDTH : integer := 2 * DEV_ROWS;

  constant DEV_ROW_SEL_WIDTH : integer := integer(ceil(log2(real(DEV_ROWS))));

  constant DEV_COL_SEL_WIDTH : integer := integer(ceil(log2(real(DAQ_N_PIPELINES))));

  constant DEV_F2E_INPUT_DATA_WIDTH : integer := 16;

  constant DEV_F2E_OUTPUT_DATA_WIDTH : integer := 18;

  type user_generics_rt is record
    N_STREAMS : integer;
    STREAMS : snake_paths_desc_t;
    PIPELINES : integer;
  end record user_generics_rt;
  constant USER_GENERICS_LEN : integer := 96;
  subtype user_generics_rvt is std_logic_vector(USER_GENERICS_LEN-1 downto 0);
  function vectorify(x: user_generics_rt) return user_generics_rvt;
  function structify(x: user_generics_rvt) return user_generics_rt;
  function nullify(x: user_generics_rt) return user_generics_rt;

end package daq_devel_defs_pkg;

------------------------------------------------------------

package body daq_devel_defs_pkg is

  function vectorify(x: user_generics_rt) return user_generics_rvt is
    variable y : user_generics_rvt;
  begin
    y(95 downto 64)            := vectorify(x.N_STREAMS);
    y(63 downto 32)            := vectorify(x.STREAMS);
    y(31 downto 0)             := vectorify(x.PIPELINES);
    return y;
  end function vectorify;
  function structify(x: user_generics_rvt) return user_generics_rt is
    variable y : user_generics_rt;
  begin
    y.N_STREAMS                := structify(x(95 downto 64));
    y.STREAMS                  := structify(x(63 downto 32));
    y.PIPELINES                := structify(x(31 downto 0));
    return y;
  end function structify;
  function nullify(x: user_generics_rt) return user_generics_rt is
    variable y : user_generics_rt;
  begin
    y.N_STREAMS                := nullify(x.N_STREAMS);
    y.STREAMS                  := nullify(x.STREAMS);
    y.PIPELINES                := nullify(x.PIPELINES);
    return y;
  end function nullify;

end package body daq_devel_defs_pkg;

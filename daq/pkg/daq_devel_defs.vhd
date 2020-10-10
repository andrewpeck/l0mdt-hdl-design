-- This file was auto-generated by YML2HDL toll.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library types_def;

use types_def.common_defs.all;

package daq_devel_defs is

  constant DAQ_MAX_STREAMS : integer := 1;

  constant DAQ_MAX_BRANCHES : integer := 6;

  constant DAQ_MAX_ROWS : integer := DAQ_MAX_STREAMS + 1;

  constant DAQ_MAX_PIPELINES : integer := 40;

  constant DAQ_MAX_COUNTER_WIDTH : integer := 32;

  constant DAQ_MAX_DATA_WIDTH : integer := 160;

  constant DAQ_FELIX_STREAM_WIDTH : integer := 16;

  constant DAQ_NODE_WRITE_DATA_WIDTH : integer := 42;

  constant DAQ_NODE_FIFO_DEPTH : integer := 1024;

end package daq_devel_defs;

------------------------------------------------------------

package body daq_devel_defs is

end package body daq_devel_defs;

--------------------------------------------------------------------------------
-- THIS FILE IS NOT USED IN THE HOG PROCESS
--
-- IT CAN BE USED IN THE TOP HOG FOLDER AS AN EXAMPLE
--------------------------------------------------------------------------------

library ieee;
library types_def;
library ttc_def;
library daq_def;
library ttc_lib;
library daq_lib;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use types_def.common_defs.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_usr is
  port(port_ir: in daq_usr_irt; port_or: out daq_usr_ort);
end entity daq_usr;

architecture V2 of daq_usr is


  signal top_er : daq_top_ert;

  signal ttc_er : ttc_ert;

  constant TOP_gr : daq_top_grt := (
    PIPELINES       => 4,
    BRANCHES_MASK   => (1, 1, others => 0),
    BRANCHES_STRUCT => ((97, 100, 39, 70, 112, others => 0),
                        (34, 120, 45, 80, others => 0),
                        others => (others => 0)),
    COUNTER_LEN     => 32,
    OUTPUT_DATA_LEN => 16);

  signal branches : daq_branches_t;
  
begin

  branches(0)(0) <= port_ir.stream_0;
  branches(0)(1) <= port_ir.stream_1;
  branches(0)(2) <= port_ir.stream_2;
  branches(0)(3) <= port_ir.stream_3;
  branches(0)(4) <= port_ir.stream_4;

  branches(1)(0) <= port_ir.stream_5;
  branches(1)(1) <= port_ir.stream_6;
  branches(1)(2) <= port_ir.stream_7;
  branches(1)(3) <= port_ir.stream_8;

  top_er.i.f2e_bus(0) <= port_ir.f2e0;
  top_er.i.f2e_bus(1) <= port_ir.f2e1;
  port_or.f2e0 <= top_er.o.f2e_bus(0);
  port_or.f2e1 <= top_er.o.f2e_bus(1);
  
  ttc_u : entity ttc_lib.ttc
    port map (port_ir => ttc_er.i, port_or => ttc_er.o);

  ttc_er.i.sys <= port_ir.sys;
  ttc_er.i.data <= port_ir.ttc;

  u_daq_top: entity daq_lib.daq_top
    generic map (G => TOP_gr)
    port map (port_ir => top_er.i, port_or =>  top_er.o);

  top_er.i.sys <= (port_ir.sys.clk320, port_ir.sys.rst);
  top_er.i.ttc <= ttc_er.o;
  top_er.i.ctrl <= port_ir.ctrl;
  top_er.i.branches <= branches;

  port_or.status0 <= top_er.o.status_bus(0);
  port_or.status1 <= top_er.o.status_bus(1);

end architecture V2;


--------------------------------------------------------------------------------

-- library ieee;
-- library types_def;
-- library ttc_def;
-- library ttc_lib;
-- library daq_def;
--
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee.math_real.all;
--
-- use types_def.common_defs.all;
--
-- use ttc_def.ttc_defs.all;
--
-- use daq_def.daq_devel_defs.all;
-- use daq_def.daq_defs.all;
-- use daq_def.daq_row_defs.all;
--
-- entity daq_usr_wrap is
--   generic(G_v: daq_usr_gvt);
--   port(port_iv: in daq_usr_ivt; port_ov: out daq_usr_ovt);
-- end entity daq_usr_wrap;
--
-- architecture V2 of daq_usr_wrap is
--
--   impure function G return daq_usr_grt is
--     variable aux : daq_usr_grt;
--   begin
--     return structify(G_v, aux);
--   end function G;
--
--   signal port_ir : daq_usr_irt;
--   signal port_or : daq_usr_ort;
-- begin
--   port_ir <= structify(port_iv, port_ir);
--   port_ov <= vectorify(port_or, port_ov);
--   u_daq_usr : entity work.daq_usr
--     generic map (G => G)
--     port map (port_ir => port_ir, port_or => port_or);
-- end architecture V2;

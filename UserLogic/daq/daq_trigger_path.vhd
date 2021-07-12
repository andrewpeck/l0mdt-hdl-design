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

use ttc_def.ttc_defs.all;

use daq_def.daq_config_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;
use daq_def.daq_trigger_path_defs.all;

entity daq_trigger is
  port(port_ir: in daq_trigger_irt; port_or: out daq_trigger_ort);
end entity daq_trigger;

architecture V2 of daq_trigger is


  signal branch_er : daq_branch_ert;

  signal ttc_er : ttc_ert;

  constant branch_gr : daq_branch_grt := (
    PIPELINES       => 4,
    BRANCHES_MASK   => (1, 1, others => 0),
    BRANCHES_STRUCT => (((97, 1024), (100, 1024), (39, 1024), (70, 1024), (112, 1024), others => (0, 0)),
                        ((34, 512), (120, 512), (45, 512), (80, 512), others => (0, 0)),
                        others => (others => (0, 0))),
    COUNTER_WIDTH     => 32,
    OUTPUT_DATA_WIDTH => 16);

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

  branch_er.i.f2e_bus(0) <= port_ir.f2e0;
  branch_er.i.f2e_bus(1) <= port_ir.f2e1;
  port_or.f2e0 <= branch_er.o.f2e_bus(0);
  port_or.f2e1 <= branch_er.o.f2e_bus(1);
  
  ttc_u : entity ttc_lib.ttc
    port map (port_ir => ttc_er.i, port_or => ttc_er.o);

  ttc_er.i.sys <= port_ir.sys;
  ttc_er.i.data <= port_ir.ttc;

  u_daq_branch: entity daq_lib.daq_branch
    generic map (G => branch_gr)
    port map (port_ir => branch_er.i, port_or =>  branch_er.o);

  branch_er.i.sys <= (port_ir.sys.clk320, port_ir.sys.rst);
  branch_er.i.ttc <= ttc_er.o;
  branch_er.i.ctrl <= port_ir.ctrl;
  branch_er.i.branches <= branches;

  port_or.status0 <= branch_er.o.status_bus(0);
  port_or.status1 <= branch_er.o.status_bus(1);

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
-- use daq_def.daq_config_defs.all;
-- use daq_def.daq_defs.all;
-- use daq_def.daq_row_defs.all;
--
-- entity daq_trigger_wrap is
--   generic(G_v: daq_trigger_gvt);
--   port(port_iv: in daq_trigger_ivt; port_ov: out daq_trigger_ovt);
-- end entity daq_trigger_wrap;
--
-- architecture V2 of daq_trigger_wrap is
--
--   impure function G return daq_trigger_grt is
--     variable aux : daq_trigger_grt;
--   begin
--     return structify(G_v, aux);
--   end function G;
--
--   signal port_ir : daq_trigger_irt;
--   signal port_or : daq_trigger_ort;
-- begin
--   port_ir <= structify(port_iv, port_ir);
--   port_ov <= vectorify(port_or, port_ov);
--   u_daq_trigger : entity work.daq_trigger
--     generic map (G => G)
--     port map (port_ir => port_ir, port_or => port_or);
-- end architecture V2;

--------------------------------------------------------------------------------
-- THIS FILE IS NOT USED IN THE HOG PROCESS
--
-- IT CAN BE USED IN THE TOP HOG FOLDER AS AN EXAMPLE
--------------------------------------------------------------------------------

library ieee;
library shared_lib;
library ttc_def;
library daq_def;
library ttc_lib;
library daq_lib;
library daq;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use shared_lib.common_ieee.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_config_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

use daq.daq_data_path_defs.all;

entity daq_data_path is
  port(data_path_ir: in daq_data_path_irt; data_path_or: out daq_data_path_ort);
end entity daq_data_path;

architecture V2 of daq_data_path is


  signal branch_er : daq_branch_ert;

  signal ttc_er : ttc_ert;

  signal branches : daq_branches_t;
  
begin

  ttc_u : entity ttc_lib.ttc
    port map (ttc_ir => ttc_er.i, ttc_or => ttc_er.o);

  ttc_er.i.sys <= data_path_ir.sys;
  ttc_er.i.data <= data_path_ir.ttc;

  u_daq_branch: entity daq_lib.daq_branch
    generic map (G =>  (PIPELINES       => 40,
                        BRANCHES_MASK   => (1, 1, 1, 1, others => 0),
                        BRANCHES_STRUCT => (
                          ((42, 1024), others => (0, 0)),
                          ((42, 1024), others => (0, 0)),
                          ((42, 1024), others => (0, 0)),
                          ((42, 1024), others => (0, 0)),
                          others => (others => (0, 0))),
                        COUNTER_WIDTH     => 32,
                        OUTPUT_DATA_WIDTH => 16))
    port map (branch_ir => branch_er.i, branch_or =>  branch_er.o);

  branch_er.i.sys.clk320 <= data_path_ir.sys.clk320;
  branch_er.i.sys.rst <= data_path_ir.sys.rst;

  branch_er.i.ttc <= ttc_er.o;
  branch_er.i.ctrl <= data_path_ir.ctrl;

  branch_er.i.branches(0)(0) <= data_path_ir.stream_0;
  branch_er.i.branches(1)(0) <= data_path_ir.stream_1;
  branch_er.i.branches(2)(0) <= data_path_ir.stream_2;
  branch_er.i.branches(3)(0) <= data_path_ir.stream_3;

  branch_er.i.f2e_bus(0) <= data_path_ir.f2e0;
  branch_er.i.f2e_bus(1) <= data_path_ir.f2e1;
  branch_er.i.f2e_bus(2) <= data_path_ir.f2e2;
  branch_er.i.f2e_bus(3) <= data_path_ir.f2e3;
  
  data_path_or.f2e0 <= branch_er.o.f2e_bus(0);
  data_path_or.f2e1 <= branch_er.o.f2e_bus(1);
  data_path_or.f2e2 <= branch_er.o.f2e_bus(2);
  data_path_or.f2e3 <= branch_er.o.f2e_bus(3);

  data_path_or.status0 <= branch_er.o.status_bus(0);
  data_path_or.status1 <= branch_er.o.status_bus(1);
  data_path_or.status2 <= branch_er.o.status_bus(2);
  data_path_or.status3 <= branch_er.o.status_bus(3);

end architecture V2;


--------------------------------------------------------------------------------

-- library ieee;
-- library shared_lib;
-- library ttc_def;
-- library ttc_lib;
-- library daq_def;
--
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee.math_real.all;
--
-- use shared_lib.common_defs.all;
--
-- use ttc_def.ttc_defs.all;
--
-- use daq_def.daq_devel_defs.all;
-- use daq_def.daq_defs.all;
-- use daq_def.daq_row_defs.all;
--
-- entity daq_data_path_wrap is
--   generic(G_v: daq_data_path_gvt);
--   port(port_iv: in daq_data_path_ivt; port_ov: out daq_data_path_ovt);
-- end entity daq_data_path_wrap;
--
-- architecture V2 of daq_data_path_wrap is
--
--   impure function G return daq_data_path_grt is
--     variable aux : daq_data_path_grt;
--   begin
--     return structify(G_v, aux);
--   end function G;
--
--   signal port_ir : daq_data_path_irt;
--   signal port_or : daq_data_path_ort;
-- begin
--   port_ir <= structify(port_iv, port_ir);
--   port_ov <= vectorify(port_or, port_ov);
--   u_daq_data_path : entity work.daq_data_path
--     generic map (G => G)
--     port map (port_ir => port_ir, port_or => port_or);
-- end architecture V2;

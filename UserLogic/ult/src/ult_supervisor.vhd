--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ult_supervisor.vhd
-- Module: <<moduleName>>
-- File PATH: /ult_supervisor.vhd
-- -----
-- File Created: Wednesday, 14th February 2024 11:55:52 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 14th February 2024 11:56:58 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

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

library ult_lib;
  use ult_lib.ult_pkg.all;

entity ult_supervisor is
  port (
    clock_and_control : in  l0mdt_control_rt;
    o_ull_slow_v : out ull_slow_vt
  );
end entity;

architecture beh of ult_supervisor is

  signal clk : std_logic;
  signal rst : std_logic;

  signal o_ull_slow_r : ull_slow_rt;
  
begin

  o_ull_slow_v <= convert(o_ull_slow_r,o_ull_slow_v);

  clk <= clock_and_control.clk;
  rst <= clock_and_control.rst;

  process (clk)
  begin
    if rising_edge(clk) then
      if (rst = '1') then
        o_ull_slow_r.global_ena <= '1';
        o_ull_slow_r.global_rst <= '0';
        o_ull_slow_r.global_freeze <= '0';
      end if;
    end if;
  end process;
  

end architecture;
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

library ctrl_lib;
use ctrl_lib.MTC_CTRL.all;

entity top_mtc_builder is

  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    ctrl              : in  MTC_CTRL_t;
    mon               : out MTC_MON_t;
    i_ptcalc          : in  tf2mtc_bus_avt(c_NUM_THREADS -1 downto 0);
    i_pl2mtc          : in  pl2mtc_bus_avt(c_MAX_NUM_SL -1 downto 0);
    o_mtc             : out mtc_out_bus_avt(c_NUM_MTC -1 downto 0);
    o_nsp             : out mtc2nsp_bus_avt(c_NUM_NSP -1 downto 0)
    );

end  top_mtc_builder;

architecture mtc_builder_arch of top_mtc_builder is
  component mtc_builder_verilog is
     generic     (
      TOTAL_PTCALC_BLKS : positive;
      MTC_PER_BCID      : positive;
      n_PRIMARY_MTC     : positive
      );
     
    PORT(
      clk        : in std_logic;
      rst        : in std_logic;
      srst       : in std_logic;
      ptcalc     : in tf2mtc_bus_avt(TOTAL_PTCALC_BLKS -1 downto 0);
      slcpipeline: in  pl2mtc_bus_avt(MTC_PER_BCID -1 downto 0);
      mtc        : out mtc_out_bus_avt(n_PRIMARY_MTC -1 downto 0)
      );      
end component;

begin  
  mtc_builder_verilog_inst: mtc_builder_verilog
    generic map(
      TOTAL_PTCALC_BLKS => c_NUM_THREADS,
      MTC_PER_BCID      => c_MAX_NUM_SL,
      n_PRIMARY_MTC     => c_NUM_MTC
      )
    port map (
    clk   => clock_and_control.clk,
    rst   => clock_and_control.rst,
    srst  => clock_and_control.rst,
    ptcalc => i_ptcalc,
    slcpipeline => i_pl2mtc,
    mtc => o_mtc
    );

end architecture mtc_builder_arch;

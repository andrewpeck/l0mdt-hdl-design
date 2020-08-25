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

-- library ctrl_lib;
-- use ctrl_lib.MTC_CTRL.all;

entity mtc_builder is

  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    -- ctrl              : in  MTC_CTRL_t;
    -- mon               : out MTC_MON_t;
    i_ptcalc          : in  tf2mtc_bus_avt(c_NUM_THREADS -1 downto 0);
    i_pl2mtc          : in  pl2mtc_bus_avt(c_MAX_NUM_SL -1 downto 0);
    o_mtc             : out mtc_out_bus_avt(c_NUM_MTC -1 downto 0);
    o_nsp             : out mtc2nsp_bus_avt(c_NUM_NSP -1 downto 0)
    );

end entity mtc_builder;

architecture behavioral of mtc_builder is
    signal ptcalc_sump : std_logic_vector (c_NUM_THREADS -1 downto 0);
    signal pl2mtc_sump : std_logic_vector (c_MAX_NUM_SL -1 downto 0);
begin

  sump_proc : process (clock_and_control.clk) is
  begin  -- process tdc_hit_sump_proc
    if (rising_edge(clock_and_control.clk)) then  -- rising clock edge
      ptcalc_loop : for I in 0 to c_NUM_THREADS-1 loop
        ptcalc_sump(I) <= xor_reduce(i_ptcalc(I));
      end loop;
      pl2mtc_loop : for I in 0 to c_MAX_NUM_SL-1 loop
        pl2mtc_sump(I) <= xor_reduce(i_pl2mtc(I));
      end loop;
      o_mtc_loop : for I in 0 to c_NUM_MTC-1 loop
        o_mtc(I) <= (others => xor_reduce(ptcalc_sump));
      end loop;
      o_nsp_loop : for I in 0 to c_NUM_NSP-1 loop
        o_nsp(I) <= (others => xor_reduce(pl2mtc_sump));
      end loop;
    end if;
  end process;

end behavioral;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library mpl_lib;
use mpl_lib.mpl_pkg.all;

library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;


entity mpl_top_tb is

  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    i_uCM2pl_av         : in ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
    o_pl2ptcalc_av      : out pl2ptcalc_avt(c_NUM_THREADS -1 downto 0);
    o_pl2mtc_av         : out pl2mtc_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity mpl_top_tb;

architecture beh of mpl_top_tb is
   signal ctrl : MPL_CTRL_t;
   signal mon  : MPL_MON_t;
   signal ctrl_len : natural;
   signal ctrl_v : std_logic_vector(len(ctrl)-1 downto 0) := (others => '0');
   signal mon_v  : std_logic_vector(len(mon)-1 downto 0);
  begin
    --ctrl.ACTIONS.RESET   <= '0';
    --ctrl.ACTIONS.ENABLE  <= '1';
    --ctrl.ACTIONS.DISABLE <= '0';
    --ctrl.ACTIONS.FREEZE  <= '0';
    ctrl_len <= len(ctrl);
    ctrl_v(len(ctrl)-1 downto len(ctrl)-12 ) <= x"03e";

    mpl:entity mpl_lib.mpl
  port map(
    clk      => clk,
    rst      => rst,
    glob_en  => glob_en,
    ctrl_v   => ctrl_v,
    mon_v    => mon_v,

    i_uCM2pl_av      => i_uCM2pl_av,
    o_pl2ptcalc_av   => o_pl2ptcalc_av,
    o_pl2mtc_av      => o_pl2mtc_av
  );

   

  end architecture beh;

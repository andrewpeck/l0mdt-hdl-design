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


library project_lib;
use project_lib.prj_cfg.all;



library ctrl_lib;
use ctrl_lib.MTC_CTRL.all;

library mtc_lib;
use mtc_lib.all;

library fm_lib;
use fm_lib.fm_types.all;

entity mtc_builder is

  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    ctrl_v            : in std_logic_vector; --  : in  MTC_CTRL_t;
    mon_v             : out std_logic_vector;--  : out MTC_MON_t;
    --Fast Monitoring
    fm_mtc_mon_v : out std_logic_vector;
    
    i_ptcalc          : in  ptcalc2mtc_avt(c_NUM_THREADS -1 downto 0);
    i_pl2mtc          : in  pl2mtc_avt(c_MAX_NUM_SL -1 downto 0);
    o_mtc             : out mtc_out_avt(c_NUM_MTC -1 downto 0);
    o_nsp             : out mtc2nsp_avt(c_NUM_NSP -1 downto 0);

    o_sump            : out std_logic
    );

end entity mtc_builder;


architecture behavioral of mtc_builder is
  signal fm_mtc_mon_r : fm_mtc_mon_data;
begin

  fm_mtc_mon_v <= convert(fm_mtc_mon_r, fm_mtc_mon_v);
  
  MTC_GEN : if c_MTC_ENABLED = '1' generate
    MTC: entity mtc_lib.top_mtc_wrapper

    port map (
      clock               => clock_and_control.clk,
      rst                 => clock_and_control.rst,
      i_ptcalc            => i_ptcalc,
      i_pl2mtc            => i_pl2mtc,
      o_mtc               => o_mtc
    );

    o_nsp <= (others => (others => '0'));
    -- mon_v <= (others => '0');

    o_sump <= '0';

    FM_MTC: for k in 0 to mtc_sb_n - 1  generate
        fm_mtc_mon_r(k).fm_data <= (mon_dw_max-1 downto  mtc2sl_vt'w => '0') & o_mtc(k);
        fm_mtc_mon_r(k).fm_vld   <= o_mtc(k)(mtc2sl_vt'w-1);
      end generate;
  end generate;

  MTC_NO_GEN : if c_MTC_ENABLED = '0' generate
    signal ptcalc_sump            : std_logic_vector (c_NUM_THREADS-1 downto 0);
    signal pl2mtc_sump            : std_logic_vector (c_MAX_NUM_SL-1 downto 0);
    signal l0mdt_ttc_v  : l0mdt_ttc_vt;
    signal l0mdt_control_v  : l0mdt_control_vt;
  begin

    l0mdt_ttc_v <= convert(ttc_commands,l0mdt_ttc_v);
    l0mdt_control_v <= convert(clock_and_control,l0mdt_control_v);
    o_mtc <= (others => (others => '0'));
    o_nsp <= (others => (others => '0'));


    sump_proc : process (clock_and_control.clk) is
    begin  -- process tdc_hit_sump_proc
      if (rising_edge(clock_and_control.clk)) then  -- rising clock edge

        inn_loop : for I in 0 to c_NUM_THREADS-1 loop
          ptcalc_sump(I) <= xor_reduce(i_ptcalc(I));
        end loop;
        mid_loop : for I in 0 to c_MAX_NUM_SL-1 loop
          pl2mtc_sump(I) <= xor_reduce(i_pl2mtc(I));
        end loop;
        o_sump <= xor_reduce(ptcalc_sump) xor xor_reduce(pl2mtc_sump) xor xor_reduce(l0mdt_ttc_v) xor xor_reduce(l0mdt_control_v) ;
      end if;
    end process;
  end generate;


end behavioral;

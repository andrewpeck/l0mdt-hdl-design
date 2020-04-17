-- Dataformats Spreadsheet:
-- https://docs.google.com/spreadsheets/d/1oJh-NPv990n6AzXXZ7cBaySrltqBO-eGucrsnOx_r4s/edit#gid=1745105770

library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;

library hal;
use hal.system_types_pkg.all;
use hal.constants_pkg.all;

entity top_ult is

  port (

    -- pipeline clock
    clock : in std_logic;
    reset : in std_logic;

    -- ttc
    ttc_commands : in TTC_CMD_rt;

    -- TDC hits from CSM
    tdc_hits_inner  : in TDCPOLMUX_rt_array (c_NUM_POLMUX_INNER-1 downto 0);
    tdc_hits_middle : in TDCPOLMUX_rt_array (c_NUM_POLMUX_MIDDLE-1 downto 0);
    tdc_hits_outer  : in TDCPOLMUX_rt_array (c_NUM_POLMUX_OUTER-1 downto 0);

    -- Endcap + Neighbor Sector Logic Candidates
    endcap_slc_candidates : in SLC_ENDCAP_rt_array (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);

    -- Barrel + Neighbor Sector Logic Candidates
    barrel_slc_candidates : in SLC_BARREL_rt_array (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);

    -- SL candidates back to SL
    endcap_slc_pipeline : out SLCPROC_PIPE_ENDCAP_rt_array (c_NUM_SLCPROC_ENDCAP_OUTPUTS-1 downto 0);
    barrel_slc_pipeline : out SLCPROC_PIPE_BARREL_rt_array (c_NUM_SLCPROC_BARREL_OUTPUTS-1 downto 0);

    -- felix
    tts_commands : out TTS_CMD_rt;

    -- DAQ links
    daq_links : out DAQ_LINK_rt_array (c_NUM_DAQ_LINKS-1 downto 0);

    sump : out std_logic

    );

end entity top_ult;
architecture behavioral of top_ult is

  signal tdc_hit_inner_sump    : std_logic_vector (c_NUM_POLMUX_INNER-1 downto 0);
  signal tdc_hit_middle_sump    : std_logic_vector (c_NUM_POLMUX_MIDDLE-1 downto 0);
  signal tdc_hit_outer_sump    : std_logic_vector (c_NUM_POLMUX_OUTER-1 downto 0);
  signal endcap_hit_sump : std_logic_vector (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);
  signal barrel_hit_sump : std_logic_vector (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);
  signal clk             : std_logic;

begin

  sump_proc : process (clock) is
  begin  -- process tdc_hit_sump_proc
    if (rising_edge(clock)) then  -- rising clock edge

      inner_tdc_sump_loop : for I in 0 to c_NUM_POLMUX_INNER-1 loop
        tdc_hit_inner_sump(I) <= xor_reduce(tdcpolmux_2af(tdc_hits_inner(I)));
      end loop;
      middle_tdc_sump_loop : for I in 0 to c_NUM_POLMUX_MIDDLE-1 loop
        tdc_hit_middle_sump(I) <= xor_reduce(tdcpolmux_2af(tdc_hits_middle(I)));
      end loop;
      outer_tdc_sump_loop : for I in 0 to c_NUM_POLMUX_OUTER-1 loop
        tdc_hit_outer_sump(I) <= xor_reduce(tdcpolmux_2af(tdc_hits_outer(I)));
      end loop;

      barrel_sump_loop : for I in 0 to c_NUM_SL_BARREL_CANDIDATES-1 loop
        barrel_hit_sump(I) <= xor_reduce(slc_barrel_2af(barrel_slc_candidates(I)));
      end loop;

      endcap_sump_loop : for I in 0 to c_NUM_SL_ENDCAP_CANDIDATES-1 loop
        endcap_hit_sump(I) <= xor_reduce(slc_endcap_2af(endcap_slc_candidates(I)));
      end loop;

      sump <= xor_reduce(tdc_hit_inner_sump) xor xor_reduce(tdc_hit_middle_sump) xor xor_reduce(tdc_hit_outer_sump) xor
      xor_reduce (barrel_hit_sump) xor xor_reduce (endcap_hit_sump);

    end if;


  end process;

end architecture behavioral;

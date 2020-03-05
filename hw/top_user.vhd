library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;

library framework;

use framework.all;
use framework.sector_logic_pkg.all;
use framework.system_types_pkg.all;
use framework.mdttp_types_pkg.all;
use framework.lpgbt_pkg.all;
use framework.constants_pkg.all;
use framework.mgt_pkg.all;
use framework.board_pkg.all;
use framework.board_pkg_common.all;


entity top_user is

  port (

    -- pipeline clock
    pipeline_clock : in std_logic;

    -- ttc
    ttc_commands : in TTC_CMD_rt;

    -- TDC hits from CSM
    tdc_hits : in TDCFORMAT_rt_array (c_NUM_TDC_INPUTS-1 downto 0);

    -- Endcap + Neighbor Sector Logic Candidates
    endcap_slc_candidates : in SLC_ENDCAP_rt_array (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);

    -- Barrel + Neighbor Sector Logic Candidates
    barrel_slc_candidates : in SLC_BARREL_rt_array (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);

    --
    endcap_slc_pipeline : out SLCPROC_PIPELINE_ENDCAP_rt_array (c_NUM_SLCPROC_ENDCAP_OUTPUTS-1 downto 0);
    barrel_slc_pipeline : out SLCPROC_PIPELINE_BARREL_rt_array (c_NUM_SLCPROC_BARREL_OUTPUTS-1 downto 0);

    -- felix
    tts_commands : out TTS_CMD_rt;
    daq_links    : out DAQ_LINK_rt_array (c_NUM_DAQ_LINKS-1 downto 0);

    -- asserted while mmcm locking
    reset : in std_logic;

    sump : out std_logic

    );

end entity top_user;
architecture behavioral of top_user is

  signal tdc_hit_sump : std_logic_vector (c_NUM_TDC_INPUTS-1 downto 0);
  signal endcap_hit_sump : std_logic_vector (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);
  signal barrel_hit_sump : std_logic_vector (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);

begin

  sump_proc : process (pipeline_clock) is
  begin  -- process tdc_hit_sump_proc
    if pipeline_clock'event and pipeline_clock = '1' then  -- rising clock edge

      tdc_sump_loop : for I in 0 to c_NUM_TDC_INPUTS-1 loop
        tdc_hit_sump(I) <= xor_reduce(tdc_hits(I).csm);
      end loop;

      barrel_sump_loop : for I in 0 to c_NUM_SL_BARREL_CANDIDATES-1 loop
        barrel_hit_sump(I) <= xor_reduce(barrel_slc_candidates(I).SLC_COMMON);
      end loop;

      endcap_sump_loop : for I in 0 to c_NUM_SL_ENDCAP_CANDIDATES-1 loop
        endcap_hit_sump(I) <= xor_reduce(endcap_slc_candidates(I).SLC_COMMON);
      end loop;

    end if;

    sump <= xor_reduce(tdc_hit_sump);

  end process;

end architecture behavioral;

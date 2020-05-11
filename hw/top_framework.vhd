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


entity top_framework is

  port (

    -- 40MHz clock to MMCM
    clock_in_p : in std_logic;
    clock_in_n : in std_logic;

    -- LPGBT Links
    refclk_i_p : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);
    refclk_i_n : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);

    -- LPGBT Links
    mgt_rx_p : in std_logic_vector (c_NUM_MGTS-1 downto 0);
    mgt_rx_n : in std_logic_vector (c_NUM_MGTS-1 downto 0);

    mgt_tx_p : out std_logic_vector (c_NUM_MGTS-1 downto 0);
    mgt_tx_n : out std_logic_vector (c_NUM_MGTS-1 downto 0);

    ttc_legacy_link_p : in std_logic;
    ttc_legacy_link_n : in std_logic;

    -- pipeline clock
    pipeline_clock : out std_logic;

    -- ttc
    ttc_commands : out TTC_CMD_rt;

    -- TDC hits from CSM
    tdc_hits : out TDCFORMAT_rt_array (c_NUM_TDC_INPUTS-1 downto 0);

    -- Endcap + Neighbor Sector Logic Candidates
    endcap_slc_candidates : out SLC_ENDCAP_rt_array (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);

    -- Barrel + Neighbor Sector Logic Candidates
    barrel_slc_candidates : out SLC_BARREL_rt_array (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);

    --
    endcap_slc_pipeline : in SLCPROC_PIPELINE_ENDCAP_rt_array (c_NUM_SLCPROC_ENDCAP_OUTPUTS-1 downto 0);
    barrel_slc_pipeline : in SLCPROC_PIPELINE_BARREL_rt_array (c_NUM_SLCPROC_BARREL_OUTPUTS-1 downto 0);

    -- felix
    tts_commands : in TTS_CMD_rt;
    daq_links    : in DAQ_LINK_rt_array (c_NUM_DAQ_LINKS-1 downto 0);

    -- asserted while mmcm locking
    reset : out std_logic;

    sump : out std_logic

    );

end entity top_framework;
architecture behavioral of top_framework is

  signal clocks : system_clocks_rt;

  --------------------------------------------------------------------------------
  -- LPGBT Glue
  --------------------------------------------------------------------------------

  signal lpgbt_downlink_mgt_word_array : std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_mgt_word_array   : std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

  signal lpgbt_uplink_bitslip : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

  signal lpgbt_downlink_data : lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_data   : lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);

  -- temporary FIXME remove this
  signal lpgbt_valid_strobe   : std_logic;
  signal lpgbt_uplink_sump    : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);
  signal sector_logic_rx_sump : std_logic_vector (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

  --------------------------------------------------------------------------------
  -- Sector Logic Glue
  --------------------------------------------------------------------------------
  signal sl_rx_mgt_word_array : std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_mgt_word_array : std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_rx_data           : sl_rx_data_rt_array (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);
  signal sl_tx_data           : sl_tx_data_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);
  signal sl_tx_ctrl           : sl_tx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

  --------------------------------------------------------------------------------
  -- Save this here so we can extract it from the hierarchy later
  --------------------------------------------------------------------------------

  attribute NUM_MGTS                     : integer;
  attribute NUM_MGTS of mgt_wrapper_inst : label is c_NUM_MGTS;  -- make a copy of this handy for tcl

begin  -- architecture behavioral


  reset <= not clocks.locked;
  pipeline_clock <= clocks.clock_pipeline;


  --------------------------------------------------------------------------------
  -- Common Clocking
  --------------------------------------------------------------------------------

  framework_mmcm_inst : entity xil_defaultlib.framework_mmcm
    port map (
      clk_out40        => clocks.clock40,
      clk_out240       => clocks.clock240,
      clk_out320       => clocks.clock320,
      clk_out_pipeline => clocks.clock_pipeline,
      reset            => std_logic'('0'),
      locked           => clocks.locked,
      clk_in1_p        => clock_in_p,
      clk_in1_n        => clock_in_n
      );

  --------------------------------------------------------------------------------
  -- Common Multi-gigabit transceivers
  --------------------------------------------------------------------------------

  mgt_wrapper_inst : entity framework.mgt_wrapper
    port map (
      clocks                          => clocks,
      reset                           => not clocks.locked,
      refclk_i_p                      => refclk_i_p,
      refclk_i_n                      => refclk_i_n,
      mgt_tx_p                        => mgt_tx_p,
      mgt_tx_n                        => mgt_tx_n,
      mgt_rx_p                        => mgt_rx_p,
      mgt_rx_n                        => mgt_rx_n,
      sl_rx_mgt_word_array_o          => sl_rx_mgt_word_array,
      sl_tx_mgt_word_array_i          => sl_tx_mgt_word_array,
      sl_tx_ctrl_i                    => sl_tx_ctrl,
      lpgbt_rxslide_i                 => lpgbt_uplink_bitslip,
      lpgbt_downlink_mgt_word_array_i => lpgbt_downlink_mgt_word_array,
      lpgbt_uplink_mgt_word_array_o   => lpgbt_uplink_mgt_word_array
      );

  --------------------------------------------------------------------------------
  -- LPGBT-FPGA Cores
  --------------------------------------------------------------------------------

  -- FIXME: temp
  -- 320 MHz enable, goes high 1 of 8 clocks
  process (clocks.clock320)
    variable counter : integer range 0 to 8;
  begin
    if (rising_edge(clocks.clock320)) then

      if clocks.locked = '0' then
        counter            := 0;
        lpgbt_valid_strobe <= '0';
      else
        counter := counter + 1;

        if counter = 8 then
          counter := 0;
        end if;

        lpgbt_valid_strobe <= '0';
        if counter = 0 then
          lpgbt_valid_strobe <= '1';
        end if;
      end if;


    end if;
  end process;

  -- FIXME: temp
  lpgbt_downlink_valid_gen : for I in 0 to c_NUM_LPGBT_DOWNLINKS-1 generate
    lpgbt_downlink_data(I).ec <= "00";
    lpgbt_downlink_data(I).ic <= "00";
    data_loop : process (clocks.clock320) is
    begin  -- process data_loop
      if clocks.clock320'event and clocks.clock320 = '1' then  -- rising clock edge
        lpgbt_downlink_data(I).data <= lpgbt_uplink_data(I).data(223 downto 192) xor lpgbt_uplink_data(I).data(191 downto 160) xor lpgbt_uplink_data(I).data(159 downto 128) xor lpgbt_uplink_data(I).data(127 downto 96) xor lpgbt_uplink_data(I).data(95 downto 64) xor lpgbt_uplink_data(I).data(63 downto 32) xor lpgbt_uplink_data(I).data(31 downto 0);
      end if;
    end process data_loop;
    lpgbt_downlink_data(I).valid <= lpgbt_valid_strobe;
  end generate lpgbt_downlink_valid_gen;

  lpgbt_link_wrapper_inst : entity framework.lpgbt_link_wrapper
    port map (

      lpgbt_downlink_clk_i            => clocks.clock320,
      lpgbt_downlink_reset_i          => (others => std_logic'(not clocks.locked)),
      lpgbt_downlink_mgt_word_array_o => lpgbt_downlink_mgt_word_array,
      lpgbt_downlink_ready_o          => open,
      lpgbt_downlink_data             => lpgbt_downlink_data,

      lpgbt_uplink_clk_i            => clocks.clock320,
      lpgbt_uplink_reset_i          => (others => std_logic'(not clocks.locked)),
      lpgbt_uplink_data             => lpgbt_uplink_data,
      lpgbt_uplink_mgt_word_array_i => lpgbt_uplink_mgt_word_array,
      lpgbt_uplink_bitslip_o        => lpgbt_uplink_bitslip,
      lpgbt_uplink_ready_o          => open
      );

  --------------------------------------------------------------------------------
  -- LPGBT Controller Mux
  --------------------------------------------------------------------------------

  -- TODO: implement this

  --------------------------------------------------------------------------------
  -- Sector Logic Packet Former Cores
  --------------------------------------------------------------------------------

  sector_logic_link_wrapper_inst : entity framework.sector_logic_link_wrapper
    port map (
      clock                  => clocks.clock240,
      reset                  => not clocks.locked,
      sl_rx_mgt_word_array_i => sl_rx_mgt_word_array,
      sl_tx_mgt_word_array_o => sl_tx_mgt_word_array,
      sl_rx_data_o           => sl_rx_data,
      sl_tx_data_i           => sl_tx_data,
      sl_tx_ctrl_o           => sl_tx_ctrl
      );

  --------------------------------------------------------------------------------
  -- TDC Decoder Cores
  --------------------------------------------------------------------------------

  -- TODO: implement this

  --------------------------------------------------------------------------------
  -- Sumps to prevent trimming
  --------------------------------------------------------------------------------

  -- sl_rx_sump: for I in 0 to c_NUM_SECTOR_LOGIC_INPUTS-1 generate
  --   data_loop: process (clocks.clock240) is
  --   begin  -- process data_loop
  --     if clocks.clock240'event and clocks.clock240 = '1' then  -- rising clock edge
  --       sector_logic_rx_sump(I) <= or_reduce (sl_rx_data(I).data);
  --     end if;
  --   end process data_loop;
  -- end generate;

  lpgbt_sump_loop : for I in 0 to c_NUM_LPGBT_UPLINKS-1 generate
    data_loop : process (clocks.clock320) is
    begin  -- process data_loop
      if clocks.clock320'event and clocks.clock320 = '1' then  -- rising clock edge
        lpgbt_uplink_sump(I) <= or_reduce (lpgbt_uplink_data(I).data);
      end if;
    end process data_loop;
  end generate;

  sl_tx_mgt_word_array <= sl_rx_mgt_word_array;
  sl_sump_loop : for I in 0 to c_NUM_SECTOR_LOGIC_INPUTS-1 generate
    data_loop : process (clocks.clock240) is
    begin  -- process data_loop
      if clocks.clock240'event and clocks.clock240 = '1' then  -- rising clock edge
        sl_tx_data(I).data  <= sl_rx_data(I).data;
        sl_tx_data(I).valid <= sl_rx_data(I).valid;
      end if;
    end process data_loop;
  end generate;

  sump <= or_reduce (lpgbt_uplink_sump);

end architecture behavioral;

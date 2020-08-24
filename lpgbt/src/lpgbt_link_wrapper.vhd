library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library lpgbt_fpga;

library hal;
use hal.constants_pkg.all;
use hal.board_pkg.all;
use hal.board_pkg_common.all;
use hal.lpgbt_pkg.all;
use hal.system_types_pkg.all;
use hal.constants_pkg.all;

library ctrl_lib;
use ctrl_lib.HAL_CTRL.all;

entity lpgbt_link_wrapper is
  generic (
    g_PIPELINE_BITSLIP : boolean := true;
    g_PIPELINE_LPGBT   : boolean := true;
    g_PIPELINE_MGT     : boolean := true
    );
  port(

    reset : in std_logic;

    ctrl : in  HAL_LPGBT_FPGA_CTRL_t;
    mon  : out HAL_LPGBT_FPGA_MON_t;

    --------------------------------------------------------------------------------
    -- Downlink
    --------------------------------------------------------------------------------

    -- 320 Mhz Downlink Fabric Clock
    lpgbt_downlink_clk_i : in std_logic;

    -- 1 bit valid (strobe at 40MHz)
    -- 32 bits / bx from fabric
    -- 2 bits ic
    -- 2 bits ec
    lpgbt_downlink_data : in lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- 32 bits / bx to mgt
    lpgbt_downlink_mgt_word_array_o : out std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- Uplink
    --------------------------------------------------------------------------------

    -- 320 MHz Uplink Fabric Clock
    lpgbt_uplink_clk_i : in std_logic;  -- 320 MHz

    -- 1 bit valid output (strobes at 40MHz)
    -- 224 bits / bx to fabric
    -- 2 bits ic
    -- 2 bits ec
    lpgbt_uplink_data : out lpgbt_uplink_data_rt_array (c_FELIX_LPGBT_INDEX downto 0);

    -- 256 bits / bx from mgt
    lpgbt_uplink_mgt_word_array_i : in std32_array_t (c_FELIX_LPGBT_INDEX downto 0);

    -- bitslip flag to connect to mgt rxslide for alignment
    lpgbt_uplink_bitslip_o : out std_logic_vector (c_FELIX_LPGBT_INDEX downto 0)

    );
end lpgbt_link_wrapper;


architecture Behavioral of lpgbt_link_wrapper is

  -- TODO: split off felix from this module...? it is really awkward
  constant COUNTER_WIDTH : integer := 16;
  type counter_array_t is array (integer range <>) of std_logic_vector(COUNTER_WIDTH-1 downto 0);

  -- counters
  signal fec_err_cnt : counter_array_t(c_MAX_LPGBT_UPLINKS-1 downto 0);

  -- Per-link reset input
  signal lpgbt_downlink_reset : std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_reset   : std_logic_vector (c_FELIX_LPGBT_INDEX downto 0);

  -- OR of per-link and global reset
  signal uplink_reset_tree   : std_logic_vector (c_FELIX_LPGBT_INDEX downto 0)     := (others => '1');
  signal downlink_reset_tree : std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0) := (others => '1');

  -- up/downlink ready flag
  signal lpgbt_downlink_ready : std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0);
  signal lpgbt_uplink_ready   : std_logic_vector (c_FELIX_LPGBT_INDEX downto 0);

  attribute DONT_TOUCH                        : string;
  attribute DONT_TOUCH of uplink_reset_tree   : signal is "true";
  attribute DONT_TOUCH of downlink_reset_tree : signal is "true";

begin

  --------------------------------------------------------------------------------
  -- Downlink
  --------------------------------------------------------------------------------

  downlink_gen : for I in 0 to c_NUM_MGTS-1 generate

    --assert false report "IMGT = #" & integer'image(I) & " DOWNLINK IDX= " &
    --integer'image(lpgbt_downlink_idx_array(I)) severity note;

    -- only generate downlinks for duplex lpgbts
    downlink_if : if (lpgbt_downlink_idx_array(I) /= -1) generate

      constant idx         : integer := lpgbt_downlink_idx_array(I);
      signal downlink_data : lpgbt_downlink_data_rt;
      signal mgt_data      : std_logic_vector(31 downto 0);

    begin

      assert false report "GENERATING LpGBT Downlink Encoder #" & integer'image(idx+1) & " of " &
        integer'image(c_NUM_LPGBT_DOWNLINKS) & " on MGT #" & integer'image(I) severity note;

      downlink_reset_fanout : process (lpgbt_downlink_clk_i) is
      begin  -- process reset_fanout
        if rising_edge(lpgbt_downlink_clk_i) then  -- rising clock edge
          downlink_reset_tree(idx) <= not (reset or lpgbt_downlink_reset(idx));
        end if;
      end process;

      lpgbt_downlink_inst : entity lpgbt_fpga.lpgbtfpga_downlink

        generic map (
          c_multicyleDelay => c_LPGBT_DOWNLINK_MULTICYCLE_DELAY,
          c_clockRatio     => c_LPGBT_DOWNLINK_CLOCK_RATIO,
          c_outputWidth    => c_LPGBT_DOWNLINK_WORD_WIDTH
          )
        port map (
          clk_i               => lpgbt_downlink_clk_i,
          rst_n_i             => downlink_reset_tree(idx),
          clken_i             => downlink_data.valid,
          userdata_i          => downlink_data.data,
          ecdata_i            => downlink_data.ec,
          icdata_i            => downlink_data.ic,
          mgt_word_o          => mgt_data,
          interleaverbypass_i => c_LPGBT_BYPASS_INTERLEAVER,
          encoderbypass_i     => c_LPGBT_BYPASS_FEC,
          scramblerbypass_i   => c_LPGBT_BYPASS_SCRAMBLER,
          rdy_o               => lpgbt_downlink_ready(idx)
          );

      --------------------------------------------------------------------------------
      -- AXI Control and Monitoring
      --------------------------------------------------------------------------------

      lpgbt_downlink_reset(idx)        <= ctrl.reset_downlinks or ctrl.downlink.downlink(idx).reset;
      mon.downlink.downlink(idx).ready <= lpgbt_downlink_ready(idx);

      --------------------------------------------------------------------------------
      -- optionally pipeline some of the downlink registers
      -- (fixed some timing issues)
      --------------------------------------------------------------------------------

      lpgbtlatch : if (g_PIPELINE_LPGBT) generate
        downlink_data_pipe : process (lpgbt_downlink_clk_i) is
        begin  -- process downlink_data_pipe
          if lpgbt_downlink_clk_i'event and lpgbt_downlink_clk_i = '1' then  -- rising clock edge
            downlink_data <= lpgbt_downlink_data(idx);
          end if;
        end process downlink_data_pipe;
      end generate;

      lpgbtnolatch : if (not g_PIPELINE_LPGBT) generate
        downlink_data <= lpgbt_downlink_data(idx);
      end generate;

      mgtlatch : if (g_PIPELINE_MGT) generate
        downlink_data_pipe : process (lpgbt_downlink_clk_i) is
        begin  -- process downlink_data_pipe
          if lpgbt_downlink_clk_i'event and lpgbt_downlink_clk_i = '1' then  -- rising clock edge
            lpgbt_downlink_mgt_word_array_o(idx) <= mgt_data;
          end if;
        end process downlink_data_pipe;
      end generate;

      mgtnolatch : if (not g_PIPELINE_MGT) generate
        lpgbt_downlink_mgt_word_array_o(idx) <= mgt_data;
      end generate;

    end generate;
  end generate;

  --------------------------------------------------------------------------------
  -- Uplink
  --------------------------------------------------------------------------------

  uplink_gen : for I in 0 to c_NUM_MGTS-1 generate

    --assert false report "IMGT = #" & integer'image(I) & " UPLINK IDX= " &
    --integer'image(lpgbt_uplink_idx_array(I)) severity note;

    uplink_if : if (lpgbt_uplink_idx_array(I) /= -1 or felix_txrx_idx_array(I) /= -1) generate

      function func_get_idx (lpgbt_idx : integer; felix_idx : integer)
        return integer is
      begin
        if (lpgbt_idx >= 0) then
          return lpgbt_idx;
        elsif (felix_idx >= 0) then
          return felix_idx+c_FELIX_LPGBT_INDEX;
        else
          return 0;
        end if;
      end func_get_idx;

      constant idx : integer := func_get_idx(lpgbt_uplink_idx_array(I), felix_txrx_idx_array(I));

      signal uplink_data : lpgbt_uplink_data_rt;
      signal mgt_data    : std_logic_vector(31 downto 0);
      signal bitslip     : std_logic;
      signal unused_bits : std_logic_vector(5 downto 0);

      signal fec_err       : std_logic := '0';
      signal datacorrected : std_logic_vector (229 downto 0);
      signal iccorrected   : std_logic_vector (1 downto 0);
      signal eccorrected   : std_logic_vector (1 downto 0);

    begin

      assert false report "GENERATING LpGBT Uplink Encoder #" & integer'image(idx+1) & " of " &
        integer'image(c_NUM_LPGBT_UPLINKS) & " on MGT #" & integer'image(I) severity note;

      uplink_reset_fanout : process (lpgbt_uplink_clk_i) is
      begin  -- process reset_fanout
        if rising_edge(lpgbt_uplink_clk_i) then                              -- rising clock edge
          uplink_reset_tree(idx) <= not (reset or lpgbt_uplink_reset(idx));  -- active LOW
        end if;
      end process;

      lpgbt_uplink_inst : entity lpgbt_fpga.lpgbtfpga_uplink

        generic map (
          datarate                  => c_LPGBT_UPLINK_DATARATE,
          fec                       => c_LPGBT_UPLINK_FEC,
          c_multicyledelay          => c_LPGBT_UPLINK_MULTICYCLE_DELAY,
          c_clockratio              => c_LPGBT_UPLINK_CLOCK_RATIO,
          c_mgtwordwidth            => c_LPGBT_UPLINK_WORD_WIDTH,
          c_allowedfalseheader      => c_LPGBT_UPLINK_ALLOWED_FALSE_HEADER,
          c_allowedfalseheaderovern => c_LPGBT_UPLINK_ALLOWED_FALSE_HEADER_OVERN,
          c_requiredtrueheader      => c_LPGBT_UPLINK_REQUIRED_TRUE_HEADER,
          c_bitslip_mindly          => c_LPGBT_UPLINK_BITSLIP_MINDLY,
          c_bitslip_waitdly         => c_LPGBT_UPLINK_BITSLIP_WAITDLY
          )

        port map (
          clk_freerunningclk_i       => std_logic0,  -- not used since reset on even feature is
                                                     -- disabled in frame aligner
          uplinkclk_i                => lpgbt_uplink_clk_i,
          uplinkrst_n_i              => uplink_reset_tree(idx),
          mgt_word_o                 => mgt_data,
          bypassinterleaver_i        => c_lpgbt_bypass_interleaver,
          bypassfecencoder_i         => c_lpgbt_bypass_fec,
          bypassscrambler_i          => c_lpgbt_bypass_scrambler,
          uplinkclkouten_o           => uplink_data.valid,
          userdata_o(223 downto 0)   => uplink_data.data,
          userdata_o(229 downto 224) => unused_bits,
          ecdata_o                   => uplink_data.ec,
          icdata_o                   => uplink_data.ic,
          mgt_bitslipctrl_o          => bitslip,
          datacorrected_o            => datacorrected,
          iccorrected_o              => iccorrected,
          eccorrected_o              => eccorrected,
          rdy_o                      => lpgbt_uplink_ready(idx)
          );

      --------------------------------------------------------------------------------
      -- Error Counters
      --------------------------------------------------------------------------------

      process (lpgbt_uplink_clk_i) is
        variable reduce_pipe_s0 : std_logic_vector (32*7+1-1 downto 0) := (others => '0');
      begin
        if (rising_edge(lpgbt_uplink_clk_i)) then
          -- pipeline to ease timing
          reduce_pipe_s0(0) := or_reduce(datacorrected(31 downto 0));
          reduce_pipe_s0(1) := or_reduce(datacorrected(63 downto 32));
          reduce_pipe_s0(2) := or_reduce(datacorrected(95 downto 64));
          reduce_pipe_s0(3) := or_reduce(datacorrected(127 downto 96));
          reduce_pipe_s0(4) := or_reduce(datacorrected(159 downto 128));
          reduce_pipe_s0(5) := or_reduce(datacorrected(191 downto 160));
          reduce_pipe_s0(6) := or_reduce(datacorrected(223 downto 192));
          reduce_pipe_s0(7) := or_reduce(iccorrected & eccorrected & datacorrected(229 downto 224));
          fec_err           <= or_reduce(reduce_pipe_s0);
        end if;
      end process;

      cnt_fecerr : entity work.counter
        generic map (width => COUNTER_WIDTH)
        port map (
          clk    => lpgbt_uplink_clk_i,
          reset  => '0',
          enable => '1',
          event  => fec_err,
          count  => fec_err_cnt(idx),
          at_max => open
          );

      --------------------------------------------------------------------------------
      -- AXI Control and Monitoring
      --------------------------------------------------------------------------------

      lpgbt_uplink_reset(idx)            <= ctrl.reset_uplinks or ctrl.uplink.uplink(idx).reset;
      mon.uplink.uplink(idx).ready       <= lpgbt_uplink_ready(idx);
      mon.uplink.uplink(idx).fec_err_cnt <= fec_err_cnt(idx);

      --------------------------------------------------------------------------------
      -- optionally pipeline some of the uplink registers
      -- (fixed some timing issues)
      --------------------------------------------------------------------------------

      lpgbtlatch : if (g_PIPELINE_LPGBT) generate
        uplink_data_pipe : process (lpgbt_uplink_clk_i) is
        begin  -- process uplink_data_pipe
          if lpgbt_uplink_clk_i'event and lpgbt_uplink_clk_i = '1' then  -- rising clock edge
            lpgbt_uplink_data(idx) <= uplink_data;
          end if;
        end process uplink_data_pipe;
      end generate;

      lpgbtnolatch : if (not g_PIPELINE_LPGBT) generate
        lpgbt_uplink_data(idx) <= uplink_data;
      end generate;

      mgtlatch : if (g_PIPELINE_MGT) generate
        uplink_data_pipe : process (lpgbt_uplink_clk_i) is
        begin  -- process uplink_data_pipe
          if lpgbt_uplink_clk_i'event and lpgbt_uplink_clk_i = '1' then  -- rising clock edge
            mgt_data <= lpgbt_uplink_mgt_word_array_i(idx);
          end if;
        end process uplink_data_pipe;
      end generate;

      mgtnolatch : if (not g_PIPELINE_MGT) generate
        mgt_data <= lpgbt_uplink_mgt_word_array_i(idx);
      end generate;

      bitsliplatch : if (g_PIPELINE_BITSLIP) generate
        uplink_data_pipe : process (lpgbt_uplink_clk_i) is
        begin  -- process uplink_data_pipe
          if lpgbt_uplink_clk_i'event and lpgbt_uplink_clk_i = '1' then  -- rising clock edge
            lpgbt_uplink_bitslip_o(idx) <= bitslip;
          end if;
        end process uplink_data_pipe;
      end generate;

      bitslipnolatch : if (not g_PIPELINE_BITSLIP) generate
        lpgbt_uplink_bitslip_o(idx) <= bitslip;
      end generate;

    end generate;

  end generate;

end Behavioral;

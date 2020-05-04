library ieee;
use ieee.std_logic_1164.all;

library lpgbt_fpga;

library hal;
use hal.constants_pkg.all;
use hal.board_pkg.all;
use hal.board_pkg_common.all;
use hal.lpgbt_pkg.all;
use hal.system_types_pkg.all;
use hal.constants_pkg.all;

entity lpgbt_link_wrapper is
  generic (
    g_PIPELINE_BITSLIP : boolean := true;
    g_PIPELINE_LPGBT   : boolean := true;
    g_PIPELINE_MGT     : boolean := true
    );
  port(

    reset : in std_logic;

    --------------------------------------------------------------------------------
    -- Downlink
    --------------------------------------------------------------------------------

    -- 320 Mhz Downlink Fabric Clock
    lpgbt_downlink_clk_i : in std_logic;

    -- Per-link reset input
    lpgbt_downlink_reset_i : in std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- 1 bit valid (strobe at 40MHz)
    -- 32 bits / bx from fabric
    -- 2 bits ic
    -- 2 bits ec
    lpgbt_downlink_data : in lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- 32 bits / bx to mgt
    lpgbt_downlink_mgt_word_array_o : out std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- downlink ready flag
    lpgbt_downlink_ready_o : out std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- Uplink
    --------------------------------------------------------------------------------

    -- 320 MHz Uplink Fabric Clock
    lpgbt_uplink_clk_i : in std_logic;  -- 320 MHz

    -- Per-link reset input
    lpgbt_uplink_reset_i : in std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- 1 bit valid output (strobes at 40MHz)
    -- 224 bits / bx to fabric
    -- 2 bits ic
    -- 2 bits ec
    lpgbt_uplink_data : out lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- 256 bits / bx from mgt
    lpgbt_uplink_mgt_word_array_i : in std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- bitslip flag to connect to mgt rxslide for alignment
    lpgbt_uplink_bitslip_o : out std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- uplink ready output
    lpgbt_uplink_ready_o : out std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0)

    );
end lpgbt_link_wrapper;


architecture Behavioral of lpgbt_link_wrapper is

  attribute DONT_TOUCH                        : string;
  signal uplink_reset_tree                    : std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0)   := (others => '0');
  signal downlink_reset_tree                  : std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0) := (others => '0');
  attribute DONT_TOUCH of uplink_reset_tree   : signal is "true";
  attribute DONT_TOUCH of downlink_reset_tree : signal is "true";

begin

  --------------------------------------------------------------------------------
  -- Downlink
  --------------------------------------------------------------------------------

  downlink_gen : for I in 0 to c_NUM_MGTS-1 generate

    --assert false report "IMGT = #" & integer'image(I) & " DOWNLINK IDX= " & integer'image(lpgbt_downlink_idx_array(I)) severity note;

    -- only generate downlinks for duplex lpgbts
    downlink_if : if (lpgbt_downlink_idx_array(I) /= -1) generate

      constant idx         : integer := lpgbt_downlink_idx_array(I);
      signal downlink_data : lpgbt_downlink_data_rt;
      signal mgt_data      : std_logic_vector(31 downto 0);

    begin

      assert false report "GENERATING LpGBT Downlink Encoder #" & integer'image(idx+1) & " of " & integer'image(c_NUM_LPGBT_DOWNLINKS) & " on MGT #" & integer'image(I) severity note;

      downlink_reset_fanout : process (lpgbt_downlink_clk_i) is
      begin  -- process reset_fanout
        if rising_edge(lpgbt_downlink_clk_i) then  -- rising clock edge
          downlink_reset_tree(idx) <= not (reset or lpgbt_downlink_reset_i(idx));
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
          rdy_o               => lpgbt_downlink_ready_o(idx)
          );

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

    --assert false report "IMGT = #" & integer'image(I) & " UPLINK IDX= " & integer'image(lpgbt_uplink_idx_array(I)) severity note;

    uplink_if : if (lpgbt_uplink_idx_array(I) /= -1) generate

      constant idx       : integer := lpgbt_uplink_idx_array(I);
      signal uplink_data : lpgbt_uplink_data_rt;
      signal mgt_data    : std_logic_vector(31 downto 0);
      signal bitslip     : std_logic;
      signal unused_bits : std_logic_vector(5 downto 0);

    begin

      assert false report "GENERATING LpGBT Uplink Encoder #" & integer'image(idx+1) & " of " & integer'image(c_NUM_LPGBT_UPLINKS) & " on MGT #" & integer'image(I) severity note;

      uplink_reset_fanout : process (lpgbt_uplink_clk_i) is
      begin  -- process reset_fanout
        if rising_edge(lpgbt_uplink_clk_i) then  -- rising clock edge
          uplink_reset_tree(idx) <= not (reset or lpgbt_uplink_reset_i(idx));
        end if;
      end process;

      lpgbt_uplink_inst : entity lpgbt_fpga.lpgbtfpga_uplink

        generic map (
          datarate                  => C_LPGBT_UPLINK_DATARATE,
          fec                       => C_LPGBT_UPLINK_FEC,
          c_multicyledelay          => C_LPGBT_UPLINK_MULTICYCLE_DELAY,
          c_clockratio              => C_LPGBT_UPLINK_CLOCK_RATIO,
          c_mgtwordwidth            => C_LPGBT_UPLINK_WORD_WIDTH,
          c_allowedfalseheader      => C_LPGBT_UPLINK_ALLOWED_FALSE_HEADER,
          c_allowedfalseheaderovern => C_LPGBT_UPLINK_ALLOWED_FALSE_HEADER_OVERN,
          c_requiredtrueheader      => C_LPGBT_UPLINK_REQUIRED_TRUE_HEADER,
          c_bitslip_mindly          => C_LPGBT_UPLINK_BITSLIP_MINDLY,
          c_bitslip_waitdly         => C_LPGBT_UPLINK_BITSLIP_WAITDLY
          )

        port map (
          clk_freerunningclk_i       => std_logic0,  -- not used since reset on even feature is disabled in frame aligner
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
          datacorrected_o            => open,
          iccorrected_o              => open,
          eccorrected_o              => open,
          rdy_o                      => lpgbt_uplink_ready_o(idx)
          );

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

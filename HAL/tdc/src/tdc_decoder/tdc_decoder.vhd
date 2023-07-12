library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity tdc_decoder is
  generic(
    g_DECODER_SRC       : integer := 1;
    -- Per https://lpgbt.web.cern.ch/lpgbt/v0/ePorts.html#elink-groups
    -- the lpgbt elink orders bits MSB first at inputs and outputs
    g_REVERSE_BIT_ORDER : integer := 0
    );
  port(

    reset : in std_logic;

    resync_i : in std_logic;

    synced_o : out std_logic;

    clock : in std_logic;               -- 320 Mbps clock

    -- take in 8 bits / bx of data on even odd links
    valid_i   : in std_logic;
    data_even : in std_logic_vector (7 downto 0);
    data_odd  : in std_logic_vector (7 downto 0);

    -- interleave into a 16 bit word
    tdc_word_o  : out std_logic_vector (31 downto 0);
    valid_o     : out std_logic;
    read_done_i : in  std_logic;
    tdc_err_o   : out std_logic

    );
end tdc_decoder;

architecture behavioral of tdc_decoder is

  -- go to a package?
  function reverse_vector (a : in std_logic_vector)
    return std_logic_vector is
    variable result : std_logic_vector(a'range);
    alias aa        : std_logic_vector(a'reverse_range) is a;
  begin
    for i in aa'range loop
      result(i) := aa(i);
    end loop;
    return result;
  end;  -- function reverse_vector

  -- merge two bytes into a 16b word, alternating bits
  function interleave (even : std_logic_vector (7 downto 0); odd : std_logic_vector (7 downto 0))
    return std_logic_vector is
    variable int : std_logic_vector (15 downto 0);
  begin
    for ibit in 0 to even'length-1 loop
      int ((ibit+1)*2-1 downto ibit*2) := odd(ibit) & even(ibit);
    end loop;
    return int;
  end interleave;

  -- bitslip signals

  -- least common multiple of 10 bits and 16 bits is 80 bits,
  -- i.e. we need to receive 80 bits of data on the 10bit side to nicely line up
  -- to the 8bit side boundary
  signal data_even_aligned  : std_logic_vector (7 downto 0);
  signal data_odd_aligned   : std_logic_vector (7 downto 0);
  signal aligned_data       : std_logic_vector (15 downto 0);
  signal aligned_data_valid : std_logic;
  signal framer_sync        : std_logic;
  signal bitslip            : std_logic := '0';
  signal frame_slip         : std_logic;

  signal word_aligned    : std_logic := '0';
  signal frame_aligned   : std_logic := '0';
  signal kchar_lookahead : std_logic := '0';

  signal tdc_word_state_err : std_logic;
  signal misaligned         : std_logic;

  signal word_10b, word_10b_s0             : std_logic_vector (9 downto 0);
  signal word_10b_valid, word_10b_valid_s0 : std_logic;


  -- 8b10b decoder signals
  signal k_char        : std_logic;
  signal word_8b       : std_logic_vector (7 downto 0);
  signal word_8b_valid : std_logic;

  signal slip_err_cnt : integer := 0;

  signal data_even_reversed : std_logic_vector (7 downto 0);
  signal data_odd_reversed  : std_logic_vector (7 downto 0);

begin

  norevgen : if (g_REVERSE_BIT_ORDER = 0) generate
    data_even_reversed <= data_even;
    data_odd_reversed  <= data_odd;
  end generate;

  revgen : if (g_REVERSE_BIT_ORDER = 1) generate
    data_even_reversed <= reverse_vector(data_even);
    data_odd_reversed  <= reverse_vector(data_odd);
  end generate;

  --------------------------------------------------------------------------------
  -- Byte Alignment
  --------------------------------------------------------------------------------

  -- take in 16 bits per bx... this could be aligned arbitrarily relative to the frame clock due to different cable
  -- lengths
  -- need to find the alignment (by looking for valid 8b10b words, and perform a bitslip )


  alignment_buffer_even : entity work.alignment_buffer(parallel)
    port map (
      clock     => clock,
      bitslip_i => bitslip,
      data_i    => data_even_reversed,
      valid_i   => valid_i,
      valid_o   => aligned_data_valid,
      data_o    => data_even_aligned
      );

  alignment_buffer_odd : entity work.alignment_buffer(parallel)
    port map (
      clock     => clock,
      bitslip_i => bitslip,
      data_i    => data_odd_reversed,
      valid_i   => valid_i,
      valid_o   => open,
      data_o    => data_odd_aligned
      );

  --------------------------------------------------------------------------------
  -- De-interleave Data
  --------------------------------------------------------------------------------

  aligned_data <= interleave (data_even_aligned, data_odd_aligned);

  --------------------------------------------------------------------------------
  -- Frame decoder state machine
  --------------------------------------------------------------------------------

  decoder_framer_inst : entity work.decoder_framer
    port map (
      clock        => clock,
      resync_i     => resync_i,
      synced_o     => synced_o,
      data_i       => aligned_data,
      data_i_valid => aligned_data_valid,
      err_o        => bitslip,
      data_o       => word_10b_s0,
      data_o_valid => word_10b_valid_s0
      );

  -- pipeline register before 8b10b
  process (clock) is
  begin
    if (rising_edge(clock)) then
      word_10b <= word_10b_s0;
      word_10b_valid <= word_10b_valid_s0;
    end if;
  end process;


  --------------------------------------------------------------------------------
  -- 8b10b decoder
  --------------------------------------------------------------------------------

  --  The encoded output is valid one clock after the input.
  --  delay valid flag by 1 clock to align to 8b10b output
  process(clock)
  begin
    if (rising_edge(clock)) then
      word_8b_valid <= word_10b_valid;
    end if;
  end process;

  -- also look into this:
  -- http://asics.chuckbenz.com/decode.v

  gen_8b10b_a : if (g_DECODER_SRC = 0) generate
    constant std_logic0 : std_logic := '0';
    constant std_logic1 : std_logic := '1';

    component mdec8b10bmem
      port(
        -- inputs
        soft_reset_i : in std_logic;
        i_Clk        : in std_logic;
        i_ARst_L     : in std_logic;
        i10_Din      : in std_logic_vector;
        i_enable     : in std_logic;

        -- disparity
        i_ForceDisparity : in  std_logic;
        i_Disparity      : in  std_logic;
        o_DpErr          : out std_logic;
        o_Rd             : out std_logic;

        -- outputs
        o8_Dout : out std_logic_vector;
        o_Kout  : out std_logic;
        o_Kerr  : out std_logic;
        o_DErr  : out std_logic
        );
    end component;
  begin

    mDec8b10bMem_inst : mDec8b10bMem
      port map (

        -- inputs
        soft_reset_i => reset,
        i_Clk        => clock,
        i_ARst_L     => std_logic1,     -- active LOW reset
        i10_Din      => word_10b,
        i_enable     => std_logic1,

        -- disparity
        o_DpErr          => open,
        i_ForceDisparity => std_logic0,
        i_Disparity      => std_logic0,
        o_Rd             => open,       -- running disparity output

        -- outputs
        o8_Dout => word_8b,
        o_Kout  => k_char,
        o_Kerr  => open,
        o_DErr  => open
        );
  end generate;


  gen_8b10b_b : if (g_DECODER_SRC = 1) generate
    signal k_char_int  : std_logic;
    signal word_8b_int : std_logic_vector (7 downto 0);
  begin

    -- Author: Ken Boyette
    -- https://raw.githubusercontent.com/freecores/8b10b_encdec/master/8b10_dec.vhd

    dec_8b10b_msbs_inst : entity work.dec_8b10b
      port map (
        RESET    => '0',
        -- this module is FALLING EDGE sensitive for some reason, so we need to register its outputs
        RBYTECLK => clock,
        --  The input is a 10-bit encoded character whose bits are identified as:
        --  AI, BI, CI, DI, EI, II, FI, GI, HI, JI (Least Significant to Most)
        AI       => word_10b(0),
        BI       => word_10b(1),
        CI       => word_10b(2),
        DI       => word_10b(3),
        EI       => word_10b(4),
        II       => word_10b(5),
        FI       => word_10b(6),
        GI       => word_10b(7),
        HI       => word_10b(8),
        JI       => word_10b(9),
        --    The eight data output bits are identified as:
        --      HI, GI, FI, EI, DI, CI, BI, AI (Most Significant to Least)
        KO       => k_char_int,         -- kchar output flag
        HO       => word_8b_int(7),     -- 8
        GO       => word_8b_int(6),     -- 78
        FO       => word_8b_int(5),
        EO       => word_8b_int(4),
        DO       => word_8b_int(3),
        CO       => word_8b_int(2),
        BO       => word_8b_int(1),
        AO       => word_8b_int(0)
        );

    process (clock) is
    begin
      if (rising_edge(clock)) then
        word_8b <= word_8b_int;
        k_char  <= k_char_int;
      end if;
    end process;

  end generate;

  --------------------------------------------------------------------------------
  -- Frame decoder state machine
  --------------------------------------------------------------------------------

  -- Pair measurement format:
  -- 31:27 =  5b Channel ID
  -- 26:25 =  2b Edge Mode = 11 (Pair)
  -- 24:8  = 17b Time
  -- 7:0   =  8b Pulse width
  --
  -- Edge measurement format:
  -- 31:27 =  5b Channel ID
  -- 26:25 =  2b Edge Mode = 00 = leading, 01 = Trailing
  -- 24:8  = 17b Time
  -- 7:0   =  8b Pulse width

  tdc_packet_processor_inst : entity work.tdc_packet_processor
    port map (
      readout_mode       => "00",
      debug_mode         => '0',
      triggered_mode     => '0',
      clock              => clock,
      reset              => bitslip,
      tdc_word_state_err => tdc_word_state_err,
      misaligned_o       => misaligned,
      k_char             => k_char,
      word_8b            => word_8b,
      word_8b_valid      => word_8b_valid,
      tdc_word_o         => tdc_word_o,
      tdc_err_o          => tdc_err_o,
      read_done_i        => read_done_i,
      valid_o            => valid_o
      );

end behavioral;

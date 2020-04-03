--TODO: need to simulate this
--
--library framework;
library tdc;

library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity tdc_decoder_v2 is
  generic(
    g_DECODER_SRC : integer := 1
    );
  port(

    clock : in std_logic;
    reset : in std_logic;

    -- take in 8 bits / bx of data on even odd links
    valid_i   : in std_logic;
    data_even : in std_logic_vector (7 downto 0);
    data_odd  : in std_logic_vector (7 downto 0);

    -- interleave into a 16 bit word
    tdc_word_o  : out std_logic_vector (31 downto 0);
    read_done_i : in  std_logic;
    valid_o     : out std_logic;
    tdc_err_o   : out std_logic

    );
end tdc_decoder_v2;

-- Baseline:
-- LUT: 167
-- FF:  187
--
-- Split:
-- LUT: 165
-- FF: 187
--
-- Area Opt
-- LUT: 136
-- FF: 187

architecture behavioral of tdc_decoder_v2 is

  function interleave (even : std_logic_vector (7 downto 0); odd : std_logic_vector (7 downto 0))
    return std_logic_vector is
    variable int : std_logic_vector (15 downto 0);
  begin
    for ibit in 0 to even'length-1 loop
      int ((ibit+1)*2-1 downto ibit*2) := even(ibit) & odd(ibit);
    end loop;
    return int;
  end interleave;

  -- bitslip signals

  -- least common multiple of 10 bits and 16 bits is 80 bits,
  -- i.e. we need to receive 80 bits of data on the 10bit side to nicely line up
  -- to the 8bit side boundary
  signal data_even_aligned : std_logic_vector (7 downto 0);   -- pick of just the head of the fifo
  signal data_odd_aligned  : std_logic_vector (7 downto 0);   -- pick of just the head of the fifo
  signal fifo              : std_logic_vector (15 downto 0);  -- pick of just the head of the fifo
  signal fifo_valid        : std_logic;
  signal bitslip           : std_logic;

  signal frame_zero         : std_logic;
  signal tdc_word_state_err : std_logic;

  signal word_mux       : std_logic_vector (9 downto 0);
  signal word_mux_valid : std_logic;

  -- 8b10b decoder signals
  signal k_char        : std_logic;
  signal word_8b       : std_logic_vector (7 downto 0);
  signal word_8b_valid : std_logic;

begin

  -- take in 16 bits per bx... this could be aligned arbitrarily. need to find the alignment
  -- (by looking for 8b10b words, and perform a parallel bitslip )
  --
  -- we can do this by putting the 16b/bx into a 32 bit deep parallel bitslip module and shifting the
  -- index pointer 1 by 1 until we achieve alignment expect to take a few clock cycles at startup to
  -- do the alignment but this should be pretty small on the scale of things

  -- bitslip the data so that the head passes 8b10b check
  -- if the head of the data is 8b10b valid then the rest of the data should be aligned also
  -- although the word boundaries will follow a complicated scheme since they
  -- are different on each frame due to the convoluted tdc design


  -- TODO: check the timing on this
  -- I think it is probably wrong
  process (clock) is
  begin
    if (rising_edge(clock)) then
      if (frame_zero = '1') and (tdc_word_state_err = '1') then
        bitslip <= '1';
      else
        bitslip <= '0';
      end if;
    end if;
  end process;

  process (clock) is
  begin
    if (rising_edge(clock)) then
      fifo_valid <= valid_i;
    end if;
  end process;

  alignment_buffer_even : entity tdc.alignment_buffer
    port map (
      clock     => clock,
      bitslip_i => bitslip,
      data_i    => data_even,
      valid_i   => valid_i,
      data_o    => data_even_aligned
      );

  alignment_buffer_odd : entity tdc.alignment_buffer
    port map (
      clock     => clock,
      bitslip_i => bitslip,
      data_i    => data_odd,
      valid_i   => valid_i,
      data_o    => data_odd_aligned
      );

  fifo <= interleave (data_even_aligned, data_odd_aligned);

  --------------------------------------------------------------------------------
  -- Frame decoder state machine
  --------------------------------------------------------------------------------

  framer_inst : entity tdc.framer
    port map (
      frame_zero     => frame_zero,
      clock          => clock,
      fifo_valid     => fifo_valid,
      word_mux       => word_mux,
      word_mux_valid => word_mux_valid,
      fifo           => fifo
      );

  --------------------------------------------------------------------------------
  -- 8b10b decoder
  --------------------------------------------------------------------------------

  --  The encoded output is valid one clock after the input.
  --  delay valid flag by 1 clock to align to 8b10b output
  process(clock)
  begin
    if (rising_edge(clock)) then
      word_8b_valid <= word_mux_valid;
    end if;
  end process;

  -- also look into this:
  -- http://asics.chuckbenz.com/decode.v

  gen_8b10b_a : if (g_DECODER_SRC = 0) generate
    constant std_logic0 : std_logic := '0';
    constant std_logic1 : std_logic := '1';
  begin

    -- LUT = 31
    -- FF = 13

    mDec8b10bMem_inst : entity tdc.mDec8b10bMem
      port map (

        -- inputs
        soft_reset_i => reset,
        i_Clk        => clock,
        i_ARst_L     => std_logic1,     -- active LOW reset
        i10_Din      => word_mux,
        i_enable     => std_logic1,

        -- disparity
        o_DpErr          => open,
        i_ForceDisparity => std_logic0,
        i_Disparity      => std_logic0,
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

    -- Author: Ken Boyette
    -- https://raw.githubusercontent.com/freecores/8b10b_encdec/master/8b10_dec.vhd

    dec_8b10b_msbs_inst : entity tdc.dec_8b10b
      port map (
        RESET    => reset,
        RBYTECLK => clock,
        --  The input is a 10-bit encoded character whose bits are identified as:
        --  AI, BI, CI, DI, EI, II, FI, GI, HI, JI (Least Significant to Most)
        AI       => word_mux(0),
        BI       => word_mux(1),
        CI       => word_mux(2),
        DI       => word_mux(3),
        EI       => word_mux(4),
        II       => word_mux(5),
        FI       => word_mux(6),
        GI       => word_mux(7),
        HI       => word_mux(8),
        JI       => word_mux(9),
        --    The eight data output bits are identified as:
        --      HI, GI, FI, EI, DI, CI, BI, AI (Most Significant to Least)
        KO       => k_char,             -- kchar output flag
        HO       => word_8b(7),         -- 8
        GO       => word_8b(6),         -- 78
        FO       => word_8b(5),
        EO       => word_8b(4),
        DO       => word_8b(3),
        CO       => word_8b(2),
        BO       => word_8b(1),
        AO       => word_8b(0)
        );
  end generate;

  --------------------------------------------------------------------------------
  -- Frame decoder state machine
  --------------------------------------------------------------------------------

  frame_decoder_inst : entity tdc.frame_decoder
    port map (
      reset              => reset,
      clock              => clock,
      tdc_word_state_err => tdc_word_state_err,
      k_char             => k_char,
      word_8b            => word_8b,
      word_8b_valid      => word_8b_valid,
      tdc_word_o         => tdc_word_o,
      tdc_err_o          => tdc_err_o,
      read_done_i        => read_done_i,
      valid_o            => valid_o
      );

end behavioral;

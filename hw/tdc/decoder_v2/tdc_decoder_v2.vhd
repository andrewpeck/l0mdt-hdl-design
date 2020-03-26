--TODO: need to simulate this
--
library work;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity tdc_decoder_v2 is
  generic(
    g_DECODER_SRC : integer := 0
    );
  port(

    clock : in std_logic;
    reset : in std_logic;

    -- take in 8 bits / bx of data on even odd links
    valid_i : in std_logic;
    data_i  : in std_logic_vector (15 downto 0);

    -- interleave into a 16 bit word
    tdc_word_o : out std_logic_vector (31 downto 0);
    valid_o    : out std_logic;
    tdc_err_o  : out std_logic

    );
end tdc_decoder_v2;

architecture behavioral of tdc_decoder_v2 is


  -- bitslip signals

  -- least common multiple of 10 bits and 16 bits is 80 bits,
  -- i.e. we need to receive 80 bits of data on the 10bit side to nicely line up
  -- to the 8bit side boundary
  signal fifo        : std_logic_vector (15 downto 0);  -- pick of just the head of the fifo
  signal fifo_valid  : std_logic;
  signal bitslip     : std_logic;
  signal data_buffer : std_logic_vector (16*2-1 downto 0);
  signal fifo_ptr    : integer := 0;                    -- pointer to start address of fifo header

  -- frame parser signals
  type frame_state_t is (FRAME0, FRAME1, FRAME2, FRAME3, FRAME4);
  signal frame_state : frame_state_t;

  signal word0 : std_logic_vector (9 downto 0);
  signal word1 : std_logic_vector (9 downto 0);
  signal word2 : std_logic_vector (9 downto 0);
  signal word3 : std_logic_vector (9 downto 0);
  signal word4 : std_logic_vector (9 downto 0);
  signal word5 : std_logic_vector (9 downto 0);
  signal word6 : std_logic_vector (9 downto 0);
  signal word7 : std_logic_vector (9 downto 0);

  signal word_mux       : std_logic_vector (9 downto 0);
  signal word_mux_valid : std_logic;

  -- 8b10b decoder signals
  signal k_char        : std_logic;
  signal word_8b       : std_logic_vector (7 downto 0);
  signal word_8b_valid : std_logic;

  -- packet decoder signals
  type tdc_word_state_t is (ERR, HEADER, DATA0, DATA1, DATA2, DATA3);
  signal tdc_word_state : tdc_word_state_t;
  signal tdc_aligned    : std_logic;
  signal valid          : std_logic;
  signal data_buf       : std_logic_vector (23 downto 0);

begin

  -- take in 16 bits per bx... this could be aligned arbitrarily. need to find the alignment (by looking for 8b10b words, and perform a parallel bitslip )
  --
  -- we can do this by putting the 16b/bx into a 32 bit deep parallel bitslip module and shifting the index pointer 1 by 1 until we achieve alignment
  -- expect to take a few clock cycles at startup to do the alignment but this should be pretty small on the scale of things

  -- bitslip the data so that the head passes 8b10b check
  -- if the head of the data is 8b10b valid then the rest of the data should be aligned also
  -- although the word boundaries will follow a complicated scheme since they
  -- are different on each frame due to the convoluted tdc design
  --
  -- bits[79:0]     01234567890123456789012345678901234567890123456789012345678901234567890123456789
  --
  -- 40MHz frames   < frame0 15:0  >< frame1 31:16 >< frame2 47:32 >< frame3 63:48 >< frame4 79:64 >
  --                0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
  --               
  -- 10 bit words   < word0  >< word1  >< word2  >< word3  >< word4  >< word5  >< word6  >< word7  >
  --                01234567890123456789012345678901234567890123456789012345678901234567890123456789

  --------------------------------------------------------------------------------
  -- Frame aligner logic, get the 16 bit words onto the same boundary
  --------------------------------------------------------------------------------


  -- TODO: check the timing on this
  -- I think it is probably wrong
  bitslip <= '1' when (frame_state = FRAME0) and (tdc_word_state = ERR) else '0';

  process(clock) is begin
    if (rising_edge(clock)) then
      if (valid_i = '1') then

        -- bring the data into a 32 bit deep buffer that allows us to realign the data to 10 bit boundaries
        data_buffer (31 downto 0) <= data_buffer (15 downto 0) & data_i (15 downto 0);

        -- pick out the pointed-to 16 bits so that 16 bits comes out according to some well-defined alignment
        fifo <= data_buffer (fifo_ptr+15 downto fifo_ptr);

        -- increment counter when bitslip is selected
        if (bitslip = '1') then
          if (fifo_ptr < 16) then
            fifo_ptr <= fifo_ptr + 1;
          else
            fifo_ptr <= 0;
          end if;
        end if;

      end if;
      fifo_valid <= valid_i;
    end if;
  end process;

  --------------------------------------------------------------------------------
  -- Frame decoder state machine
  --------------------------------------------------------------------------------
  process (clock) is
    variable valid : std_logic;
    variable cycle : integer;
    -- say which cycle (0-7) we are in of the 40MHz clock, relative to the datavalid flag in clock 0
    -- allows us to do multiple (up to 8) operations per data valid
    --               _______                                         _______
    -- fifo_valid  __|     |_________________________________________|     |____
    --               ____  ____  ____  ____  ____  ____  ____  ____  ____  ____
    -- cycle       __|0 |__|1 |__|2 |__|3 |__|4 |__|5 |__|6 |__|7 |__|0 |__|  |

  begin
    if (rising_edge(clock)) then

      if (fifo_valid = '1') then
        cycle := 1;
      elsif (cycle = 7) then
        cycle := 0;
      else
        cycle := cycle + 1;
      end if;

      case frame_state is

        when FRAME0 =>

          ----------------------------------------
          -- frame_state
          ----------------------------------------

          if (fifo_valid = '1') then
            frame_state <= FRAME1;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------

          word0              <= fifo(9 downto 0);
          word1 (5 downto 0) <= fifo(15 downto 10);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid    := '1';
            word_mux <= word0;
          end if;


        when FRAME1 =>

          if (fifo_valid = '1') then
            frame_state <= FRAME2;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------
          word1(9 downto 6) <= fifo (3 downto 0);
          word2             <= fifo(13 downto 4);
          word3(1 downto 0) <= fifo(15 downto 14);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid    := '1';
            word_mux <= word1;
          end if;
          if (cycle = 3) then
            valid    := '1';
            word_mux <= word2;
          end if;

        when FRAME2 =>

          if (fifo_valid = '1') then
            frame_state <= FRAME3;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------

          word3(9 downto 2) <= fifo (7 downto 0);
          word4(7 downto 0) <= fifo (15 downto 8);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid    := '1';
            word_mux <= word3;
          end if;

        when FRAME3 =>

          if (fifo_valid = '1') then
            frame_state <= FRAME4;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------
          word4(9 downto 8)  <= fifo (1 downto 0);
          word5              <= fifo (11 downto 2);
          word6 (3 downto 0) <= fifo (15 downto 12);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid    := '1';
            word_mux <= word4;
          end if;
          if (cycle = 3) then
            valid    := '1';
            word_mux <= word5;
          end if;

        when FRAME4 =>

          if (fifo_valid = '1') then
            frame_state <= FRAME0;
          end if;

          ----------------------------------------
          -- buffers
          ----------------------------------------
          word6(9 downto 4) <= fifo (5 downto 0);
          word7             <= fifo (15 downto 6);

          ----------------------------------------
          -- mux
          ----------------------------------------

          valid := '0';
          if (cycle = 0) then
            valid    := '1';
            word_mux <= word6;
          end if;
          if (cycle = 3) then
            valid    := '1';
            word_mux <= word7;
          end if;

      end case;

    end if;

    word_mux_valid <= valid;

  end process;


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

  -- TODO: this decoder is pretty nasty.. replace with something nicer?
  -- http://asics.chuckbenz.com/decode.v
  -- https://raw.githubusercontent.com/freecores/8b10b_encdec/master/8b10_dec.vhd
  -- both are really nice but don't have error detection
  -- does the error detection even work without disparity corrections?
  -- um doesn't even use the error outputs
  gen_8b10b_a : if (g_DECODER_SRC = 0) generate
    constant std_logic0 : std_logic := '0';
    constant std_logic1 : std_logic := '1';
  begin

    -- LUT = 31
    -- FF = 13

    mDec8b10bMem_inst : entity work.mDec8b10bMem
      port map (

        -- inputs
        soft_reset_i => reset,
        i_Clk        => clock,
        i_ARst_L     => std_logic1, -- active LOW reset
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

    -- LUT = 11
    -- FF = 9

  gen_8b10b_b : if (g_DECODER_SRC = 1) generate
    dec_8b10b_msbs_inst : entity work.dec_8b10b
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

  process (clock)
    constant TDC_START                      : std_logic_vector := x"3C";
    constant TDC_ERR                        : std_logic_vector := x"9C";
    -- require a few idle frames to "lock on" to the sequence...
    -- exact number not important but should be greater than 10 I guess
    variable sequential_header_count        : integer          := 0;
    variable sequential_header_count_thresh : integer          := 16;
  begin

    if (rising_edge(clock)) then

      valid <= '0';

      if (word_8b_valid = '1') then
        if (reset = '1') then

          tdc_word_state <= HEADER;

        else

          case tdc_word_state is

            when ERR =>

              sequential_header_count := 0;
              tdc_aligned             <= '0';

              if (word_8b = TDC_START and k_char = '1') then
                tdc_word_state <= HEADER;
              end if;

            when HEADER =>

              if (word_8b = TDC_START and k_char = '1') then
                if (sequential_header_count < sequential_header_count_thresh) then
                  sequential_header_count := sequential_header_count + 1;
                else
                  tdc_aligned <= '1';
                end if;
              elsif (tdc_aligned = '1' and k_char = '0') then
                tdc_word_state <= DATA0;
              else
                tdc_word_state <= ERR;
              end if;

            when DATA0 =>

              if (k_char = '1') then
                tdc_word_state <= ERR;
              else
                tdc_word_state <= DATA1;
              end if;

              data_buf(7 downto 0) <= word_8b;

            when DATA1 =>

              if (k_char = '1') then
                tdc_word_state <= ERR;
              else
                tdc_word_state <= DATA2;
              end if;

              data_buf(15 downto 8) <= word_8b;

            when DATA2 =>

              if (k_char = '1') then
                tdc_word_state <= ERR;
              else
                tdc_word_state <= DATA3;
              end if;

              data_buf(23 downto 16) <= word_8b;

            when DATA3 =>

              if (k_char = '1' and word_8b = TDC_ERR) then  -- 28.4 = tdc_err
                tdc_err_o      <= '1';
                tdc_word_state <= HEADER;
              elsif (word_8b = TDC_START and k_char = '1') then
                tdc_word_state <= HEADER;
              else
                tdc_word_state <= DATA0;
              end if;

              tdc_word_o (31 downto 24) <= word_8b;
              tdc_word_o (23 downto 0)  <= data_buf(23 downto 0);
              valid                     <= '1';

            when others =>

          end case;

        end if;
      end if;

    end if;
  end process;

-- valid output high for only 3.125ns
  valid_o <= '1' when (valid = '1' and word_8b_valid = '1') else '0';

end behavioral;

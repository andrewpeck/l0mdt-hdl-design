--TODO: need to simulate this

library hal;
use hal.system_types_pkg.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_constants_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity polling_mux is
  generic(
    -- the polling mux can be run in a round-robin fasion (which forces the clock frequency is at least enough to look
    -- through everything, a minimum of 320MHz for 20 inputs)
    --
    -- if disabled, the polling mux will run in priority encoder mode where it chooses the LSB tdc hit which allows it
    -- to operate at much wider aspect ratios and could be more efficient, since a large number of low rate inputs can
    -- be muxed into a single high speed output, so that the ratio can be determined based on expected hit rates rather
    -- than just f=20*16MHz

    g_ROUND_ROBIN : boolean := false;
    g_WIDTH       : integer := 20
    );
  port(
    clock       : in  std_logic;
    tdc_hits_i  : in  TDCPOLMUX_rt_array (g_WIDTH-1 downto 0);
    read_done_o : out std_logic_vector (g_WIDTH-1 downto 0);
    tdc_hit_o   : out TDCPOLMUX_rt
    );
end polling_mux;

architecture behavioral of polling_mux is

  signal tdc_hits_r   : TDCPOLMUX_rt_array (g_WIDTH-1 downto 0);
  signal tdc_hits_and : TDCPOLMUX_rt_array (g_WIDTH-1 downto 0);
  signal tdc_hits_or  : TDCPOLMUX_rt;

  signal read_done, read_done_r : std_logic_vector (g_WIDTH-1 downto 0);

  -- function to pull the valid bits out of a tdcpolmux array and put it in a std_logic_vector
  function tdchits2valid_stdlogic (arr : TDCPOLMUX_rt_array; size : integer) return std_logic_vector is
    variable tmp : std_logic_vector(size - 1 downto 0);
  begin
    for I in 0 to size-1 loop
      if (arr(I).datavalid = '1') then
        tmp(I) := '1';
      else
        tmp(I) := '0';
      end if;
    end loop;
    return tmp;
  end function;

  -- function to replicate a std_logic bit some number of times
  -- equivalent to verilog's built in {n{x}} operator
  function repeat(B : std_logic; N : integer) return std_logic_vector is
    variable result : std_logic_vector(1 to N);
  begin
    for i in 1 to N loop
      result(i) := B;
    end loop;
    return result;
  end;

  -- ORs together a TDCPOLMUX_rt array, useful for multiplexing
  function or_reduce (arr : TDCPOLMUX_rt_array) return TDCPOLMUX_rt is
    variable tmp : TDCPOLMUX_rt;
  begin
    tmp := tdcpolmux_2rf (repeat('0', TDCPOLMUX_len));
    for I in 0 to arr'length-1 loop
      tmp := tdcpolmux_2rf (tdcpolmux_2af(tmp) or tdcpolmux_2af(arr(I)));
    end loop;
    return tmp;
  end function;

begin

  rr : if (g_ROUND_ROBIN) generate
    signal cnt : integer range 0 to g_WIDTH-1 := 0;
  begin

    assert (g_WIDTH <= 20) report "Round-robin polling mux cannot exceed 20 bit width. Reduce width or switch to priority encoded design" severity error;

    process (clock) is
    begin
      if (rising_edge(clock)) then
        if (cnt = g_WIDTH-1) then
          cnt <= 0;
        else
          cnt <= cnt + 1;
        end if;
      end if;
    end process;
    read_done   <= std_logic_vector(shift_left(to_unsigned(1, read_done'length), cnt));
    read_done_o <= read_done;
  end generate;

  pe : if (not g_ROUND_ROBIN) generate
    signal valid_vec : std_logic_vector (g_WIDTH-1 downto 0);
  begin
    -- Create a fast parallel bitmask that returns the least significant set 1 using a
    -- property of integers: subtracting 1 from a number will always affect the
    -- least-significant set 1-bit. using just arithmetic, with this trick we can
    -- create a one hot of the first set bit
    --
    -- e.g.
    -- let a        = 101100100  // our starting number
    --    ~a        = 010011011  // bitwise inversion
    --     b = ~a+1 = 010011100  // b is exactly the twos complement of a, which we know to be the same as (-a) ! :)
    --     a & b    = 000000100  // one hot of first one set
    --
    -- The compiler seems to be more happy with this template since it falls into some expected pattern and
    -- is implemented in a way that is efficient and fast while a more obvious implmentation runs a lot slower

    -- Do this fast (async output) to feed back into the TDC decoder and let the priority encoder be pipelined if needed
    valid_vec   <= tdchits2valid_stdlogic(tdc_hits_i, tdc_hits_i'length);
    read_done   <= (valid_vec) and std_logic_vector((unsigned((not valid_vec)) + 1));
    read_done_o <= read_done;           -- copy to output
  end generate;
  --------------------------------------------------------------------------------
  -- Output Block
  --------------------------------------------------------------------------------

  process (clock) is
  begin
    if (rising_edge(clock)) then

      read_done_r <= read_done;
      tdc_hits_r  <= tdc_hits_i;


      -- AND each TDC hit w/ its valid bit in one step
      for I in 0 to tdc_hits_i'length-1 loop
        tdc_hits_and(I) <= tdcpolmux_2rf (tdcpolmux_2af (tdc_hits_r(I)) and repeat(read_done_r(I), TDCPOLMUX_len));
      end loop;  -- I

      -- then just OR together the masked outputs in another clock
      tdc_hits_or <= or_reduce (tdc_hits_and);
      -- NOTE: this reduce_or can be pipelined into as many stages as you want to help timing,
      -- at the expense of latency

    end if;
  end process;

  tdc_hit_o <= tdc_hits_or;

end behavioral;

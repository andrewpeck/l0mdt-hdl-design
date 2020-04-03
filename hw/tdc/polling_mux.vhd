--TODO: need to simulate this
--
--library framework;

library framework;
use framework.system_types_pkg.all;

library tdc;
use tdc.priority_encoder_pkg.all;

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
    g_PRIORITY_SRC : integer := 0;
    g_WIDTH        : integer := 20
    );
  port(
    clock       : in  std_logic;
    tdc_hits_i  : in  TDCPOLMUX_rt_array (g_WIDTH-1 downto 0);
    read_done_o : out std_logic_vector (g_WIDTH-1 downto 0);
    tdc_hit_o   : out TDCPOLMUX_rt
    );
end polling_mux;

architecture behavioral of polling_mux is

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

  function tdchits2valid (arr : TDCPOLMUX_rt_array; size : integer) return bus_array is
    variable tmp : bus_array (0 to size - 1)(0 downto 0);
  begin
    for I in 0 to size-1 loop
      if (arr(I).datavalid = '1') then
        tmp(I) := (others => '1');
      else
        tmp(I) := (others => '0');
      end if;
    end loop;
    return tmp;
  end function;

  function tdchits2busarray (arr : TDCPOLMUX_rt_array; size : integer) return bus_array is
    variable ret : bus_array (0 to size -1)(TDCPOLMUX_LEN-1 downto 0);
  begin
    for I in 0 to size-1 loop
      ret(I) := tdcpolmux_2af(arr(I));
    end loop;
    return ret;
  end function;

  --function flatten_bus (arr : TDCPOLMUX_rt_array) return std_logic_vector is
  --  variable ret : std_logic_vector (TDCPOLMUX_LEN*arr'length-1);
  --begin
  --  for I in 0 to arr'length-1 loop
  --    ret((I+1)*TDCPOLMUX_LEN-1 downto I*TDCPOLMUX_LEN) := tdcpolmux_2af(arr(I));
  --  end loop;
  --  return ret;
  --end function;
  --
  --function unflatten_bus (vec : std_logic_vector) return TDCPOLMUX_rt_array is
  --  variable ret : TDCPOLMUX_rt_array (vec'length / TDCPOLMUX_LEN - 1 downto 0);
  --begin
  --  for I in 0 to vec'length / TDCPOLMUX_LEN -1 loop
  --    ret(I) <= tdcpolmux_2rf(vec((I+1)*TDCPOLMUX_len -1 downto I*TDCPOLMUX_len));
  --  end loop;
  --  return ret;
  --end function;

  signal sel       : std_logic_vector (log2ceil(g_WIDTH)-1 downto 0);
  signal sel_map   : std_logic_vector (g_WIDTH-1 downto 0);
  signal valid_vec : std_logic_vector (g_WIDTH-1 downto 0);
  signal valid_i   : bus_array(0 to g_WIDTH-1)(0 downto 0);
  signal data_i    : bus_array(0 to g_WIDTH-1)(TDCPOLMUX_LEN-1 downto 0);

  signal data_o     : bus_array(0 to 0)(TDCPOLMUX_LEN-1 downto 0);
  constant PRIORITY : string (0 to 2) := "LOW";

  -- complicated parameterized verilog module does not seem to play nicely w/ cross language instantiation
  component priority_encoder_v
    generic (
      STAGE        : integer;
      WIDTH        : integer;
      LSB_PRIORITY : string (0 to 2)
      );
    port (
      clock            : in  std_logic;
      input_unencoded  : in  std_logic_vector (g_WIDTH-1 downto 0);
      output_valid     : out std_logic;
      output_encoded   : out std_logic_vector (log2ceil(g_WIDTH)-1 downto 0);
      output_unencoded : out std_logic_vector (g_WIDTH-1 downto 0)
      );
  end component;

begin

  data_i    <= tdchits2busarray(tdc_hits_i, tdc_hits_i'length);
  valid_i   <= tdchits2valid(tdc_hits_i, tdc_hits_i'length);
  valid_vec <= tdchits2valid_stdlogic(tdc_hits_i, tdc_hits_i'length);

  a : if (g_PRIORITY_SRC = 0) generate
    priority_encoder_inst : entity work.priority_encoder
      generic map (
        g_WIDTH_i    => g_WIDTH,
        g_DAT_SIZE   => TDCPOLMUX_LEN,
        g_QLT_SIZE   => 1,
        g_ADR_SIZE_o => 5
        )
      port map (
        clock => clock,
        dat_i => data_i,
        qlt_i => valid_i,
        adr_i => (others => (others => '0')),
        dat_o => data_o,
        qlt_o => open,
        adr_o => open
        );
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
    --
    -- Do this fast (async output) to feed back into the TDC decoder and let the priority encoder be pipelined if needed
    read_done_o <= (valid_vec) and std_logic_vector((unsigned((not valid_vec)) + 1));

    process (clock) is
    begin
      if (rising_edge(clock)) then
        tdc_hit_o <= tdcpolmux_2rf(data_o(0));
      end if;
    end process;

  end generate;

  b : if (g_PRIORITY_SRC = 1) generate

    priority_encoder_inst : priority_encoder_v
      generic map (
        STAGE        => 0,
        WIDTH        => g_WIDTH,
        LSB_PRIORITY => PRIORITY
        )
      port map (
        clock            => clock,
        input_unencoded  => valid_vec,
        output_valid     => open,
        output_encoded   => sel,
        output_unencoded => sel_map
        );

    process (clock) is
    begin
      if (rising_edge(clock)) then
        tdc_hit_o   <= tdc_hits_i (to_integer(unsigned(sel)));
        read_done_o <= sel_map;
      end if;
    end process;
  end generate;

end behavioral;

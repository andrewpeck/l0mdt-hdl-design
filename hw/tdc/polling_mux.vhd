--TODO: need to simulate this
--
--library framework;

library framework;
use framework.system_types_pkg.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity polling_mux is
  generic(
    g_WIDTH : integer := 20
    );
  port(
    clock       : in  std_logic;
    tdc_hits_i  : in  TDCPOLMUX_rt_array (g_WIDTH-1 downto 0);
    read_done_o : out std_logic_vector (g_WIDTH-1 downto 0);
    tdc_hit_o   : out TDCPOLMUX_rt
    );
end polling_mux;

architecture behavioral of polling_mux is

  function tdchits2valid (arr : TDCPOLMUX_rt_array; size : integer) return std_logic_vector is
    variable tmp : std_logic_vector (size - 1 downto 0);
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

  signal sel        : std_logic_vector (log2ceil(g_WIDTH)-1 downto 0);
  signal sel_map    : std_logic_vector (g_WIDTH-1 downto 0);
  signal valid_i    : std_logic_vector (g_WIDTH-1 downto 0);
  signal valid_o    : std_logic;
  constant PRIORITY : string (0 to 2) := "LOW";

  -- complicated parameterized verilog module does not seem to play nicely w/ cross language instantiation
  component priority_encoder
    generic (
      WIDTH        : integer;
      LSB_PRIORITY : string (0 to 2)
      );
    port (
      input_unencoded  : in  std_logic_vector (g_WIDTH-1 downto 0);
      output_valid     : out std_logic;
      output_encoded   : out std_logic_vector (log2ceil(g_WIDTH)-1 downto 0);
      output_unencoded : out std_logic_vector (g_WIDTH-1 downto 0)
      );
  end component;

begin

  valid_i <= tdchits2valid(tdc_hits_i, tdc_hits_i'length);

  priority_encoder_inst : priority_encoder
    generic map (
      WIDTH        => g_WIDTH,
      LSB_PRIORITY => PRIORITY
      )
    port map (
      input_unencoded  => valid_i,
      output_valid     => valid_o,
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

end behavioral;

--
-- experimenting with textio
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use work.my_textio.all;

entity april_tb is
end entity april_tb;

architecture sim of april_tb is

  signal u_in      : unsigned(5 downto 0);
  signal u_out     : unsigned(5 downto 0);
  signal u_in_dav  : std_logic;
  signal u_out_dav : std_logic;
  signal u_mask    : std_logic_vector(5 downto 0);

  signal clk : std_logic;
  signal rst : std_logic;

  constant clock_period : time := 4 ns;
  signal stop_the_clock : boolean;

  signal tyme : integer := 0;

  component april is
    port (
      clk           : in  std_logic;
      rst           : in  std_logic;
      mask_in       : in  std_logic_vector(5 downto 0);
      april_in      : in  unsigned(5 downto 0);
      april_in_dav  : in  std_logic;
      april_out     : out unsigned(5 downto 0);
      april_out_dav : out std_logic);
  end component april;

begin

  april_1 : entity work.april
    port map (
      clk           => clk,
      rst           => rst,
      mask_in       => u_mask,
      april_in      => u_in,
      april_in_dav  => u_in_dav,
      april_out     => u_out,
      april_out_dav => u_out_dav);


  -- begin READER
  vec_reader : process is

    -- generic variables for testbench process
    variable v_LINE   : line;           -- line buffer
    variable v_SPC    : character;      -- for space parsing
    variable buff     : line;           -- for debug output
    variable temp     : integer;
    file file_VECTORS : text;           -- file handle
    variable v_tyme   : integer;
    variable v_in     : unsigned(5 downto 0);
    variable v_mask   : std_logic_vector(5 downto 0);

  begin

    file_open(file_VECTORS, "april_vectors.txt", read_mode);
    -- read vector file until a vector with times in the future is seen
    while not endfile(file_VECTORS) loop
      readline(file_VECTORS, v_LINE);

      if(v_LINE'right >= 1 and v_LINE(1) = '#') then
        writeline(output, v_LINE);      -- echo comment
      else
        -- parse a line as OrN, BcN, MDT
        read(v_LINE, v_tyme);
        read(v_LINE, v_in);
        dread(v_LINE, v_mask);

        -- wait until correct time before triggering write to UUT
        wait until tyme >= v_tyme;

        write(buff, 'T');
        write(buff, v_tyme);
        write(buff, 'V');
        write(buff, v_in);
        write(buff, 'M');
        dwrite(buff, v_mask);
        writeline(output, buff);

        u_mask   <= v_mask;
        u_in     <= v_in;
        u_in_dav <= '1';
        wait for clock_period;
        u_in_dav <= '0';

        for i in 0 to 5 loop
          
        end loop;  -- i

      end if;
    end loop;
    wait;

  end process vec_reader;

  reset : process is
  begin  -- process stim
    wait for clock_period/2;
    rst <= '1';
    wait for clock_period*2;
    rst <= '0';
    wait;
  end process reset;


  g_clk : process
  begin
    tyme <= 0;
    while not stop_the_clock loop
      clk  <= '0', '1' after clock_period / 2;
      wait for clock_period;
      tyme <= tyme + 1;
    end loop;
  end process;

end architecture sim;

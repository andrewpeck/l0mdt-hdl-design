--
-- experimenting with textio
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use work.my_textio.all;
use work.april_types.all;
use work.april_types_textio.all;

entity april_tb is
end entity april_tb;

architecture sim of april_tb is

  signal s_in  : bus_in;
  signal s_out : bus_out;
  signal s_mem : mem_array;

  signal clk : std_logic;
  signal rst : std_logic;

  constant clock_period : time := 4 ns;
  signal stop_the_clock : boolean;

  signal tyme : integer := 0;

  component april is
    port (
      clk        : in  std_logic;
      rst        : in  std_logic;
      my_bus_in  : in  bus_in;
      my_bus_out : out bus_out;
      my_mem_out : out mem_array);
  end component april;

begin

  april_2 : entity work.april
    port map (
      clk        => clk,
      rst        => rst,
      my_bus_in  => s_in,
      my_bus_out => s_out,
      my_mem_out => s_mem);

  -- begin READER
  vec_reader : process is

    -- generic variables for testbench process
    variable v_LINE   : line;           -- line buffer
    variable v_SPC    : character;      -- for space parsing
    variable buff     : line;           -- for debug output
    variable temp     : integer;
    file file_VECTORS : text;           -- file handle
    variable v_tyme   : integer;
    variable v_in     : bus_in;

    variable v_mem : mem_array;

  begin

    file_open(file_VECTORS, "april_vectors.txt", read_mode);

    -- read vector file until a vector with times in the future is seen
    -- input data format is:  <time> <addr> <data> <rd> <wr>

    while not endfile(file_VECTORS) loop
      readline(file_VECTORS, v_LINE);

      if(v_LINE'right >= 1 and v_LINE(1) = '#') then
        writeline(output, v_LINE);      -- echo comment
      else

        read(v_LINE, v_tyme);
        -- wait until correct time before triggering write to UUT

        if tyme = 0 then
          read(v_LINE, v_mem);
          v_SPC := 'M';
          write( buff, v_SPC);
          write( buff, v_mem);
          writeline( output, buff);
        else
          read(v_LINE, v_in);
        end if;


        wait until tyme >= v_tyme;
        s_in <= v_in;

        wait for clock_period;
        s_in.rd <= '0';
        s_in.wr <= '0';

      end if;
    end loop;

    wait;

  end process vec_reader;


  vec_writer : process is

    variable v_LINE : line;              -- line buffer
    variable v_SPC  : character := ' ';  -- for space parsing
    variable buff   : line;              -- for debug output
    variable temp   : integer;
    file file_bus   : text;              -- file handle
    variable v_tyme : integer;
    variable v_out  : bus_out;

  begin

    file_open(file_bus, "april_output.txt", write_mode);

    while true loop

      wait until s_out.valid = '1';

      write(v_LINE, now / 1 ns);
      write(v_LINE, v_SPC);
      write(v_LINE, s_out);
      writeline(file_bus, v_LINE);
      wait for clock_period;

    end loop;

    wait;

  end process vec_writer;




  mem_writer : process is

    variable v_LINE : line;              -- line buffer
    variable v_SPC  : character := ' ';  -- for space parsing
    file file_mem   : text;              -- file handle
    variable v_mem  : mem_array;

  begin

    file_open(file_mem, "april_mem.txt", write_mode);
    v_mem := s_mem;

    while true loop

      wait for clock_period * 4;

      write(v_LINE, now / 1 ns);
      write(v_LINE, v_SPC);
      write(v_LINE, s_mem);
      writeline(file_mem, v_LINE);

      v_mem := s_mem;

      wait for clock_period;

    end loop;

    wait;

  end process mem_writer;




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

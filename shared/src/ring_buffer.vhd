library ieee;
use ieee.std_logic_1164.all;

entity ring_buffer is
  generic (
    FIXED_DELAY   : boolean := false;   -- set to true to make the tail pointer a constant offset from the head
    MEMORY_TYPE   : string  := "auto"; -- auto, ultra, block, distributed

    -- add additional pipeline registers at the input and output of the RAM
    -- make sure to take this additional 2*PIPELINE_REGS delay into account
    -- when setting the delay
    PIPELINE_REGS : natural := 2;

    RAM_WIDTH     : natural := 64;
    RAM_DEPTH     : integer := 9600     -- maximum depth of the ram, also the maximum delay
    );
  port (
    clk : in std_logic;
    rst : in std_logic;

    -- Write port
    wr_en_i   : in std_logic;
    wr_data_i : in std_logic_vector(RAM_WIDTH - 1 downto 0);

    -- Read port
    rd_en_i    : in  std_logic;
    rd_valid_o : out std_logic;
    rd_data_o  : out std_logic_vector(RAM_WIDTH - 1 downto 0);

    -- Flags
    empty_o      : out std_logic;
    empty_next_o : out std_logic;
    full_o       : out std_logic;
    full_next_o  : out std_logic;

    -- Offset can initialize the ring buffer with a difference between read and write pointers By
    -- setting the offset to a non-zero value and asserting wr_en and rd_en together
    -- (or tieing them to '1'), the ring buffer can act as a fixed delay pipeline
    --
    -- The delay can be changed by the offset and resetting the module
    delay : in integer range RAM_DEPTH - 1 downto 0 := RAM_DEPTH-1;

    -- The number of elements in the FIFO
    fill_count_o : out integer range RAM_DEPTH - 1 downto 0
    );
end ring_buffer;

architecture rtl of ring_buffer is

  -- Write port
  signal wr_en   : std_logic;
  signal wr_data : std_logic_vector(RAM_WIDTH - 1 downto 0);

  -- Read port
  signal rd_en    : std_logic;
  signal rd_valid : std_logic;
  signal rd_data  : std_logic_vector(RAM_WIDTH - 1 downto 0);

  type wr_data_pipe_at is array (PIPELINE_REGS-1 downto 0) of std_logic_vector(RAM_WIDTH-1 downto 0);
  signal wr_data_pipe : wr_data_pipe_at;
  signal wr_en_pipe   : std_logic_vector (PIPELINE_REGS-1 downto 0);

  type rd_data_pipe_at is array (PIPELINE_REGS-1 downto 0) of std_logic_vector(RAM_WIDTH-1 downto 0);
  signal rd_data_pipe  : rd_data_pipe_at;
  signal rd_en_pipe    : std_logic_vector (PIPELINE_REGS-1 downto 0);
  signal rd_valid_pipe : std_logic_vector (PIPELINE_REGS-1 downto 0);

  type ram_type is array (0 to RAM_DEPTH - 1) of
    std_logic_vector(wr_data'range);
  signal ram : ram_type;

  signal dv_ram : std_logic_vector(0 to RAM_DEPTH - 1) := (others => '0');

  attribute ram_style        : string;
  attribute ram_style of ram : signal is MEMORY_TYPE;

  subtype index_type is integer range ram_type'range;
  signal head : index_type := 0;
  signal tail : index_type := 0;

  signal empty      : std_logic;
  signal full       : std_logic;
  signal fill_count : integer range RAM_DEPTH - 1 downto 0;

  -- Increment and wrap
  procedure incr(signal index : inout index_type) is
  begin
    if index = index_type'high then
      index <= index_type'low;
    else
      index <= index + 1;
    end if;
  end procedure;

  -- provide the wr pointer, a delay, and the size of the ram and get
  -- back the rd pointer needed to implement a fixed delay
  -- this should be run in a CLOCKED process
  function wrap_around_tail (ptr : integer; dly : integer; max : integer)
    return integer is
  begin
    if (ptr >= dly) then
      return (ptr-dly);
    else
      return (max -1 - dly + ptr);
    end if;
  end;

begin

  -- Copy internal signals to output
  empty_o      <= empty;
  full_o       <= full;
  fill_count_o <= fill_count;

  -- Set the flags
  empty        <= '1' when fill_count = 0              else '0';
  empty_next_o <= '1' when fill_count <= 1             else '0';
  full         <= '1' when fill_count >= RAM_DEPTH - 1 else '0';
  full_next_o  <= '1' when fill_count >= RAM_DEPTH - 2 else '0';

  nopipe : if (PIPELINE_REGS = 0) generate
    wr_en      <= wr_en_i;
    wr_data    <= wr_data_i;
    rd_valid_o <= rd_valid;
    rd_en      <= rd_en_i;
    rd_data_o  <= rd_data;
  end generate;

  pipe : if (PIPELINE_REGS > 0) generate
    PROC_PIPELINE : process (clk) is
    begin

      rd_en      <= rd_en_pipe(0);
      wr_en      <= wr_en_pipe(0);
      wr_data    <= wr_data_pipe(0);
      rd_data_o  <= rd_data_pipe(0);
      rd_valid_o <= rd_valid_pipe(0);

      if (rising_edge(clk)) then
        rd_valid_pipe(PIPELINE_REGS-1) <= rd_valid;
        rd_data_pipe(PIPELINE_REGS-1)  <= rd_data;
        wr_data_pipe(PIPELINE_REGS-1)  <= wr_data_i;
        wr_en_pipe(PIPELINE_REGS-1)    <= wr_en_i;
        rd_en_pipe(PIPELINE_REGS-1)    <= rd_en_i;
        for I in PIPELINE_REGS-1 downto 1 loop
          wr_data_pipe(I - 1)  <= wr_data_pipe(I);
          wr_en_pipe(I - 1)    <= wr_en_pipe(I);
          rd_en_pipe(I - 1)    <= rd_en_pipe(I);
          rd_data_pipe(I - 1)  <= rd_data_pipe(I);
          rd_valid_pipe(I - 1) <= rd_valid_pipe(I);
        end loop;
      end if;

    end process;
  end generate;

  -- Update the head pointer in write
  PROC_HEAD : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        head <= 0;
      else

        if wr_en = '1' and full = '0' then
          incr(head);
        end if;

      end if;
    end if;
  end process;

  -- Make the tail pointer always a fixed offset from the head
  -- increment only when the write pointer increments also
  delay_mode : if (FIXED_DELAY) generate
    PROC_TAIL : process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          tail     <= wrap_around_tail(0, delay, RAM_DEPTH);
          rd_valid <= '0';
        else
          rd_valid <= '0';
          if wr_en = '1' then
            tail     <= wrap_around_tail(head, delay, RAM_DEPTH);
            rd_valid <= '1';
          end if;

        end if;
      end if;
    end process;
  end generate;

  -- Update the tail pointer on read and pulse valid
  ringbuf_mode : if (not FIXED_DELAY) generate
    PROC_TAIL : process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          tail     <= 0;
          rd_valid <= '0';
        else
          rd_valid <= '0';

          if rd_en = '1' and empty = '0' then
            incr(tail);
            rd_valid <= '1';
          end if;

        end if;
      end if;
    end process;
  end generate;

  -- Write to and read from the RAM
  PROC_RAM : process(clk)
  begin
    if rising_edge(clk) then
      rd_data   <= ram(tail);
      ram(head) <= wr_data;
    end if;
  end process;

  -- Update the fill count
  PROC_COUNT : process(head, tail)
  begin
    if head < tail then
      fill_count <= head - tail + RAM_DEPTH;
    else
      fill_count <= head - tail;
    end if;
  end process;

end architecture;

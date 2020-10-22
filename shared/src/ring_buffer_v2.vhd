--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Memory Logic
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
-- use ieee.math_real.all;

entity ring_buffer_v2 is
  generic(
    LOGIC_TYPE    : string := "fifo"; -- fifo, pipeline
    FIFO_TYPE     : string := "normal"; -- normal , read_ahead
    MEMORY_TYPE   : string := "auto"; -- auto, ultra, block, distributed
    --
    PIPELINE_IN_REGS  : natural := 0;
    PIPELINE_OUT_REGS : natural := 0;

    RAM_WIDTH     : natural := 64;
    RAM_DEPTH     : integer := 9600     -- maximum depth of the ram, also the maximum delay
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    -- Write port
    i_wr          : in std_logic;
    i_wr_data     : in std_logic_vector(RAM_WIDTH - 1 downto 0);
    -- Read port
    i_rd          : in  std_logic;
    o_rd_data     : out std_logic_vector(RAM_WIDTH - 1 downto 0);
    o_rd_dv       : out std_logic;
    
    -- Flags
    o_empty       : out std_logic;
    o_empty_next  : out std_logic;
    o_full        : out std_logic;
    o_full_next   : out std_logic;
    -- used counter
    o_used        : out integer range RAM_DEPTH - 1 downto 0;
    -- The delay can be changed by the offset and resetting the module
    i_delay       : in integer range RAM_DEPTH - 1 downto 0 := RAM_DEPTH-1    
  );
end entity ring_buffer_v2;

architecture rtl of ring_buffer_v2 is
  --------------------------------
  -- memory
  --------------------------------
  type mem_avt is array (0 to RAM_DEPTH - 1) of std_logic_vector(RAM_WIDTH - 1 downto 0);
  signal mem    : mem_avt;
  signal mem_dv : std_logic_vector(0 to RAM_DEPTH - 1);
  attribute ram_style        : string;
  attribute ram_style of mem : signal is MEMORY_TYPE;
  --------------------------------
  -- signals
  --------------------------------
  signal case_options : std_logic_vector(1 downto 0);

  signal wr_index : integer range 0 to RAM_DEPTH -1 := 0;
  signal rd_index : integer range 0 to RAM_DEPTH -1 := 0;

  signal wr_dv : std_logic;
  signal rd_dv : std_logic;

  signal used_data : integer range RAM_DEPTH - 1 downto 0 := 0;
  --------------------------------
  -- functions
  --------------------------------
  function get_read_index( read_index , write_index : integer) return integer is
    variable o_rd_index : integer := 0;
  begin

    if LOGIC_TYPE = "fifo" then
      if read_index < RAM_DEPTH - 1 then
        o_rd_index := read_index + 1;
      else
        o_rd_index := 0;
      end if;
    elsif LOGIC_TYPE = "pipeline" then

    else
      -- ERROR
    end if;
    return o_rd_index;

  end function;

  function get_write_index(write_index : integer) return integer is
    variable o_wr_index : integer := 0;
  begin
    if write_index < RAM_DEPTH - 1 then
      o_wr_index := write_index + 1;
    else
      o_wr_index := 0;
    end if;
    return o_wr_index;
  end function;

begin

  o_used <= used_data;

  case_options <= i_wr & i_rd;

  MEM_PROC: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        mem_dv <= (others => '0');
        rd_index <= 0;
        wr_index <= 0;
        o_empty       <= '1';
        o_empty_next  <= '0';
        o_full        <= '0';
        o_full_next   <= '0';
        used_data <= 0;
      else
        --------------------------------
        -- PIPELINES CTRL
        --------------------------------
        -- if PIPELINE_IN_REGS = 0 then

        -- else

        -- end if;

        -- if PIPELINE_OUT_REGS = 0 then

        -- else

        -- end if;

        --------------------------------
        -- INPUT SIGNALS CTRL
        --------------------------------

        if used_data < 1 then
          o_empty       <= '1';
          o_empty_next  <= '1';
          o_full        <= '0';
          o_full_next   <= '0';
        elsif used_data < 2 then
          o_empty       <= '0';
          o_empty_next  <= '1';
          o_full        <= '0';
          o_full_next   <= '0';
        elsif used_data < RAM_DEPTH - 2  then
          o_empty       <= '0';
          o_empty_next  <= '0';
          o_full        <= '0';
          o_full_next   <= '1';
        elsif used_data < RAM_DEPTH - 1  then
          o_empty       <= '0';
          o_empty_next  <= '0';
          o_full        <= '1';
          o_full_next   <= '1';
        else
          --ERROR used more than space
        end if;

        --------------------------------
        -- INPUT SIGNALS CTRL
        --------------------------------
        if LOGIC_TYPE = "fifo" and FIFO_TYPE = "read_ahead" then
          o_rd_data <= mem(rd_index);
        end if;

        case case_options is
          when b"00" => -- idle
            if FIFO_TYPE /= "read_ahead" then
              o_rd_data <= (others => '0');
            end if;

          when b"10" => -- write
            if FIFO_TYPE /= "read_ahead" then
              o_rd_data <= (others => '0');
            end if;

            if used_data < RAM_DEPTH - 1 then
              mem(wr_index) <= i_wr_data;
              wr_index <= get_write_index(wr_index);
              used_data <= used_data + 1;
            end if;

          when b"01" => -- read
          
          if used_data > 0 then
            if FIFO_TYPE /= "read_ahead" then
              o_rd_data <= mem(rd_index);
            end if;
            rd_index <= get_read_index(rd_index,wr_index);
            used_data <= used_data - 1;
          end if;

            
          when b"11" => -- read & write 

            if used_data > 0 then
              if FIFO_TYPE /= "read_ahead" then
                o_rd_data <= mem(rd_index);
              end if;
              rd_index <= get_read_index(rd_index,wr_index);
            end if;

            mem(wr_index) <= i_wr_data;
            wr_index <= get_write_index(wr_index);
            

          when others =>
            -- ERROR
          
        end case;







      end if;
    end if;
  end process MEM_PROC;
  
  
  
end architecture rtl;
































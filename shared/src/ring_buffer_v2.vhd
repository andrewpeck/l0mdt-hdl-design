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
    g_SIMULATION        : std_logic := '0';
    g_LOGIC_TYPE        : string := "fifo"; -- fifo, pipeline
    g_FIFO_TYPE         : string := "normal"; -- normal , read_ahead
    g_MEMORY_TYPE       : string := "auto"; -- auto, ultra, block, distributed
    --
    g_PIPELINE_IN_REGS  : natural := 0;
    g_PIPELINE_OUT_REGS : natural := 0;

    g_RAM_WIDTH         : natural := 64;
    g_RAM_DEPTH         : integer := 9600     -- maximum depth of the ram, also the maximum delay

    
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    -- Write port
    i_wr              : in std_logic; -- in pipeline mode behaves as i_wr_data data valid
    i_wr_data         : in std_logic_vector(g_RAM_WIDTH - 1 downto 0);
    -- Read port
    i_rd              : in  std_logic;
    o_rd_data         : out std_logic_vector(g_RAM_WIDTH - 1 downto 0);
    o_rd_dv           : out std_logic;
    -- Flags
    o_empty           : out std_logic;
    o_empty_next      : out std_logic;
    o_full            : out std_logic;
    o_full_next       : out std_logic;
    -- used counter
    o_used            : out integer range g_RAM_DEPTH - 1 downto 0;
    -- The delay can be changed by the offset and resetting the module
    i_delay           : in integer range g_RAM_DEPTH - 1 downto 0 := g_RAM_DEPTH-1    
  );
end entity ring_buffer_v2;

architecture beh of ring_buffer_v2 is
  --------------------------------
  -- memory
  --------------------------------
  type mem_avt is array (0 to g_RAM_DEPTH - 1) of std_logic_vector(g_RAM_WIDTH - 1 downto 0);
  signal mem    : mem_avt;
  signal mem_dv : std_logic_vector(0 to g_RAM_DEPTH - 1) := (others => '0');
  attribute ram_style        : string;
  attribute ram_style of mem : signal is g_MEMORY_TYPE;
  --------------------------------
  -- signals
  --------------------------------
  signal int_wr_data         : std_logic_vector(g_RAM_WIDTH - 1 downto 0);

  signal case_options : std_logic_vector(1 downto 0);

  signal wr_index : integer range 0 to g_RAM_DEPTH -1 := 0;
  signal rd_index : integer range 0 to g_RAM_DEPTH -1 := 0;

  -- signal wr_dv : std_logic;
  -- signal rd_dv : std_logic;

  signal used_data : integer range g_RAM_DEPTH - 1 downto 0 := 0;
  --------------------------------
  -- functions
  --------------------------------
  function get_read_index( 
    read_index : integer ;
    write_index : integer := 0;
    fi_delay : integer := 0
  ) return integer is
    variable o_rd_index : integer := 0;
  begin

    if g_LOGIC_TYPE = "fifo" then
      if read_index < g_RAM_DEPTH - 1 then
        o_rd_index := read_index + 1;
      else
        o_rd_index := 0;
      end if;
    elsif g_LOGIC_TYPE = "pipeline" then
      if write_index - fi_delay >= 0 then
        o_rd_index := write_index - fi_delay;
      else
        o_rd_index := (g_RAM_DEPTH - 1) - (fi_delay - 1)  + write_index;
      end if;
    else
      -- ERROR
    end if;
    return o_rd_index;

  end function;

  function get_write_index(write_index : integer) return integer is
    variable o_wr_index : integer := 0;
  begin
    if write_index < g_RAM_DEPTH - 1 then
      o_wr_index := write_index + 1;
    else
      o_wr_index := 0;
    end if;
    return o_wr_index;
  end function;

begin

  o_used <= used_data;

  SIM_OFF : if g_SIMULATION = '0' generate
    int_wr_data <= i_wr_data;
  end generate;

  SIM_OB : if g_SIMULATION = '1' generate
    int_wr_data <= transport i_wr_data after 1 ns;
  end generate;


  FIFO_GEN : if g_LOGIC_TYPE = "fifo" generate
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
          o_rd_dv <= '0';
        else
          --------------------------------
          -- PIPELINES CTRL
          --------------------------------
          -- if g_PIPELINE_IN_REGS = 0 then

          -- else

          -- end if;

          -- if g_PIPELINE_OUT_REGS = 0 then

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
          elsif used_data < g_RAM_DEPTH - 2  then
            o_empty       <= '0';
            o_empty_next  <= '0';
            o_full        <= '0';
            o_full_next   <= '1';
          elsif used_data < g_RAM_DEPTH - 1  then
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
          if g_LOGIC_TYPE = "fifo" and g_FIFO_TYPE = "read_ahead" then
            if used_data > 0 then
              o_rd_data <= mem(rd_index);
            else
              o_rd_data <= (others => '0');
            end if;
          end if;

          case case_options is
            when b"00" => -- idle
              if g_FIFO_TYPE /= "read_ahead" then
                o_rd_data <= (others => '0');
              end if;

            when b"10" => -- write
              if g_FIFO_TYPE /= "read_ahead" then
                o_rd_data <= (others => '0');
              end if;

              if used_data < g_RAM_DEPTH - 1 then
                mem(wr_index) <= i_wr_data;
                wr_index <= get_write_index(wr_index);
                used_data <= used_data + 1;
              end if;

            when b"01" => -- read
            
            if used_data > 0 then
              if g_FIFO_TYPE /= "read_ahead" then
                o_rd_data <= mem(rd_index);
              end if;
              rd_index <= get_read_index(rd_index,wr_index);
              used_data <= used_data - 1;
            end if;

              
            when b"11" => -- read & write 

              if used_data > 0 then
                if g_FIFO_TYPE /= "read_ahead" then
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
  end generate;

  PIPE_GEN : if g_LOGIC_TYPE = "pipeline" generate

    case_options <= i_wr & mem_dv(rd_index);

    MEM_PROC: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          -- mem <= (others => (others => '0'));
          mem_dv <= (others => '0');
          rd_index <= get_read_index(rd_index,wr_index);
          wr_index <= 0;
          o_empty       <= '1';
          o_empty_next  <= '1';
          o_full        <= '0';
          o_full_next   <= '0';
          used_data <= 0;
        else


          --------------------------------
          -- PIPELINES CTRL
          --------------------------------
          -- if g_PIPELINE_IN_REGS = 0 then
          -- else
          -- end if;
          -- if g_PIPELINE_OUT_REGS = 0 then
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
          elsif used_data < g_RAM_DEPTH - 2  then
            o_empty       <= '0';
            o_empty_next  <= '0';
            o_full        <= '0';
            o_full_next   <= '1';
          elsif used_data < g_RAM_DEPTH - 1  then
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
          -- if i_wr = '1' then
            mem_dv(wr_index) <= i_wr;
            mem(wr_index) <= i_wr_data;
          -- end if;

          if mem_dv(rd_index) = '1' then
            o_rd_data <= mem(rd_index);
          else
            o_rd_data <= (others => '0');
          end if;
          o_rd_dv <= mem_dv(rd_index);

          -- case case_options is
          --   when b"00" => -- idle

          --   when b"10" => -- write

          --     -- mem_dv(wr_index) <= i_wr;
          --     -- mem(wr_index) <= i_wr_data;
          --     used_data <= used_data + 1;

          --   when b"01" => -- read
            
          --     -- o_rd_data <= mem(rd_index);
          --     -- o_rd_dv <= mem_dv(rd_index);
          --     -- mem_dv(rd_index) <= '0';
          --     used_data <= used_data - 1;
              
          --   when b"11" => -- read & write 

          --     -- o_rd_data <= mem(rd_index);
          --     -- o_rd_dv <= mem_dv(rd_index);
          --     mem_dv(wr_index) <= '1';
          --     mem(wr_index) <= i_wr_data;

          --   when others =>
          --     -- ERROR
            
          -- end case;
          
          --------------------------------
          -- index  CTRL
          --------------------------------
          wr_index <= get_write_index(wr_index);
          rd_index <= get_read_index(rd_index,wr_index + 1,i_delay);

        end if;
      end if;
    end process MEM_PROC;
    
  end generate;
  
  
end architecture beh;
































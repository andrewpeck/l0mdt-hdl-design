--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--
--  Module: Multi purpose configurable VHDL memory
--  Description: 
--
--------------------------------------------------------------------------------
--  Revisions:
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity mpcvmem is
  generic(
    g_SIMULATION          : std_logic := '0';
    --
    g_LOGIC_TYPE          : string := "fifo"; -- fifo, pipeline, ram
    g_READ_MODE           : string := "normal"; -- normal , read_ahead
    g_MEMORY_TYPE         : string := "auto"; -- auto, ultra, block, distributed
    g_DV_TYPE             : string := "int"; -- int , ext
    -- MEMORY PARAMETERS
    g_SECOND_PORT         : string := "none"; -- none, normal
    -- FIFO 
    -- PIPELINE
    g_PL_DELAY_CYCLES     : integer := 0;
    -- RAM
    -- IN/OUT PARAMETERS
    g_IN_PIPELINE         : natural := 0;
    g_OUT_PIPELINE        : natural := 2;
    -- MEMORY PARAMETERS
    g_MEM_WIDTH           : integer := 8;
    g_MEM_DEPTH           : integer := 8     -- maximum depth of the ram, also the maximum delay
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    ena                   : in std_logic := '1';
    --
    i_freeze              : in std_logic := '0';
    -- Port A
    i_addr_a              : in  std_logic_vector(integer(ceil(log2(real(g_MEM_DEPTH))))-1 downto 0):= (others => '0');
    i_din_a               : in  std_logic_vector(g_MEM_WIDTH - 1 downto 0) := (others => '0');
    i_dv_in_a             : in  std_logic := '1';
    o_dout_a              : out std_logic_vector(g_MEM_WIDTH - 1 downto 0);
    o_dv_out_a             : out std_logic := '1';

    -- Port B
    i_addr_b              : in  std_logic_vector(integer(ceil(log2(real(g_MEM_DEPTH))))-1 downto 0):= (others => '0');
    i_din_b               : in  std_logic_vector(g_MEM_WIDTH - 1 downto 0) := (others => '0');
    i_dv_in_b             : in  std_logic := '1';
    o_dout_b              : out std_logic_vector(g_MEM_WIDTH - 1 downto 0);
    o_dv_out_b             : out std_logic := '1';

    -- Flags
    o_empty               : out std_logic;
    o_empty_next          : out std_logic;
    o_full                : out std_logic;
    o_full_next           : out std_logic;
    -- used counter
    o_used                : out integer range integer(log2(real(g_MEM_DEPTH))) - 1 downto 0
    -- The delay can be changed by the offset and resetting the module
    -- i_delay               : in integer range g_RAM_DEPTH - 1 downto 0 := g_RAM_DEPTH-1  
  );
end entity mpcvmem;

architecture beh of mpcvmem is
  --------------------------------
  -- components
  --------------------------------
  component DualPortMem is
    generic(
      g_MEMORY_TYPE         : string := "auto";
      g_ENABLE_SECOND_PORT  : std_logic := '0';
      g_RAM_WIDTH           : integer := 8;
      g_ADD_WIDTH           : integer := 8
    );
    port (
      clk         : in std_logic;
      rst         : in std_logic;
      ena         : in std_logic;
      -- Port A
      i_addr_a    : in std_logic_vector(g_ADD_WIDTH-1 downto 0);
      i_din_a     : in std_logic_vector(g_RAM_WIDTH-1 downto 0);
      i_wr_nrd_a  : in  std_logic;
      o_dout_a    : out std_logic_vector(g_RAM_WIDTH-1 downto 0);
      -- Port B
      i_addr_b    : in std_logic_vector(g_ADD_WIDTH-1 downto 0);
      i_din_b     : in std_logic_vector(g_RAM_WIDTH-1 downto 0);
      i_wr_nrd_b  : in  std_logic;
      o_dout_b    : out std_logic_vector(g_RAM_WIDTH-1 downto 0)
    );
  end component DualPortMem;

  function init_mem_width(m : integer; x : string) return integer is
    variable y : integer;
  begin
    if x = "int" then
      y := m + 1;
    else
      y := m;
    end if;
    return y;
  end function;
  --------------------------------
  -- constants
  --------------------------------
  constant ADD_WIDTH : integer := integer(ceil(log2(real(g_MEM_DEPTH))));
  constant MEM_DEPTH : integer := 2**ADD_WIDTH;
  constant MEM_WIDTH : integer := init_mem_width(g_MEM_WIDTH,g_DV_TYPE);--g_MEM_WIDTH + 1;
  --------------------------------
  -- signals
  --------------------------------
  signal ena_pipes : std_logic_vector(g_OUT_PIPELINE downto 0);
  type my_pipes is array (g_OUT_PIPELINE-1 downto 0) of std_logic_vector(MEM_WIDTH-1 downto 0);
  signal data_pipes : my_pipes;

  -- signal ENABLE_SECOND_PORT : integer;

  signal wr_index : integer range 0 to MEM_DEPTH -1 := 0;
  signal rd_index : integer range 0 to MEM_DEPTH -1 := 0;

  signal mem_addr_a : std_logic_vector(ADD_WIDTH-1 downto 0);
  signal mem_addr_b : std_logic_vector(ADD_WIDTH-1 downto 0);
  signal mem_in_a : std_logic_vector(MEM_WIDTH - 1 downto 0);
  signal mem_in_b : std_logic_vector(MEM_WIDTH - 1 downto 0);
  signal mem_out_a : std_logic_vector(MEM_WIDTH - 1 downto 0);
  signal mem_out_b : std_logic_vector(MEM_WIDTH - 1 downto 0);

  signal used_data : integer range MEM_DEPTH - 1 downto 0 := 0;

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
      if read_index < MEM_DEPTH - 1 then
        o_rd_index := read_index + 1;
      else
        o_rd_index := 0;
      end if;
    elsif g_LOGIC_TYPE = "pipeline" then
      if write_index - fi_delay >= 0 then
        o_rd_index := write_index - fi_delay;
      else
        o_rd_index := (MEM_DEPTH - 1) - (fi_delay - 1)  + write_index;
      end if;
    else
      -- ERROR
    end if;
    return o_rd_index;

  end function;

  function get_write_index(write_index : integer) return integer is
    variable o_wr_index : integer := 0;
    begin
    if write_index < MEM_DEPTH - 1 then
      o_wr_index := write_index + 1;
    else
      o_wr_index := 0;
    end if;
    return o_wr_index;
  end function;
begin

  IF_DV_DATA: if g_DV_TYPE = "int" generate
    
  end generate IF_DV_DATA;

  NO_IN_PL_GEN : if g_IN_PIPELINE = 0 generate
    in_ctrl_NO: process(clk)
    begin
      if rising_edge(clk) then
        if i_dv_in_a = '1' then
          mem_in_a <= i_din_a & i_dv_in_a;
        else
          mem_in_a <= (others => '0');
        end if;
      end if;
    end process in_ctrl_NO;
    
  end generate NO_IN_PL_GEN;
  
  PIPE_GEN : if g_LOGIC_TYPE = "pipeline" generate
    constant PL_DELAY : integer := g_MEM_DEPTH;
    -- constant MEM_DEPTH : integer := 2**ADD_WIDTH;
  begin

    PL_ULTRA: if g_MEMORY_TYPE = "ultra" generate

      RAM_MEM : DualPortMem
        generic map(
          g_MEMORY_TYPE => g_MEMORY_TYPE,
          g_ENABLE_SECOND_PORT => '1',
          g_RAM_WIDTH => MEM_WIDTH,
          g_ADD_WIDTH => ADD_WIDTH
        )
        port map(
          clk         => clk,
          rst         => rst,
          ena         => ena,
          -- Port A
          i_addr_a     => mem_addr_a,--std_logic_vector(to_unsigned(mem_addr_a)); 
          i_din_a      => mem_in_a,
          i_wr_nrd_a   => '1',
          o_dout_a     => mem_out_a,
          -- Port B 
          i_addr_b     => mem_addr_b,--std_logic_vector(to_unsigned(mem_addr_b));
          i_din_b      => mem_in_b,
          i_wr_nrd_b   => '0',
          o_dout_b     => mem_out_b
        )
      ;

    end generate PL_ULTRA;

    mem_addr_a <=std_logic_vector(to_unsigned( wr_index , ADD_WIDTH ));
    mem_addr_b <=std_logic_vector(to_unsigned( rd_index , ADD_WIDTH ));


    MEM_CTRL: process(clk) begin
      if rising_edge(clk) then
        if rst = '1' then
          -- mem <= (others => (others => '0'));
          -- mem_dv <= (others => '0');
          rd_index <= get_read_index(rd_index,wr_index,g_MEM_DEPTH);
          wr_index <= 0;
          o_empty       <= '1';
          o_empty_next  <= '1';
          o_full        <= '0';
          o_full_next   <= '0';
          used_data <= 0;
        else


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
          elsif used_data < g_MEM_DEPTH - 2  then
            o_empty       <= '0';
            o_empty_next  <= '0';
            o_full        <= '0';
            o_full_next   <= '1';
          elsif used_data < g_MEM_DEPTH - 1  then
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

          --------------------------------
          -- index  CTRL
          --------------------------------
          wr_index <= get_write_index(wr_index);
          rd_index <= get_read_index(rd_index,wr_index + 1,PL_DELAY);


        end if;
      end if;
    end process MEM_CTRL;

    --------------------------------
    -- PIPELINES CTRL
    --------------------------------

    NO_OUT_PL_GEN: if g_OUT_PIPELINE = 0 generate
      o_dout_a <= mem_out_b;
    end generate NO_OUT_PL_GEN;

    OUT_PL_GEN: if g_OUT_PIPELINE > 0 generate
      -- enable pl
      ena_0: process(clk) begin
        if rising_edge(clk) then
          ena_pipes(0) <= ena;
          for i in 1 to g_OUT_PIPELINE loop
            ena_pipes(i) <= ena_pipes(i-1);
          end loop;
        end if;
      end process ena_0;
      -- data pl
      proc0: process(clk)
      begin
        if rising_edge(clk) then
          if (ena_pipes(0) = '1') then
            data_pipes(0) <= mem_out_b;
            for j in 1 to g_OUT_PIPELINE-1 loop
              if (ena_pipes(j) = '1') then
                  data_pipes(j) <= data_pipes(j-1);
              end if;
            end loop;
          end if;
          if (rst = '1') then
            o_dout_a <= (others => '0');
            o_dv_out_a <= '0';
          elsif (ena_pipes(g_OUT_PIPELINE) = '1') then
            o_dout_a <= data_pipes(g_OUT_PIPELINE-1)(MEM_WIDTH -1 downto 1);
            o_dv_out_a <= data_pipes(g_OUT_PIPELINE-1)(0);
          end if;
        end if;
      end process proc0;

    end generate OUT_PL_GEN;
    
  end generate;
  
  
end architecture beh;
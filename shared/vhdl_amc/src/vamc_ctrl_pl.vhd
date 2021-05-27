--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Configurable delay pipeline
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      simple with no apb controller : done , seems to work ok
--      simple with apb controller : not done
--      parallel mems with apb controller : doing
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee.all;

library vamc_lib;

entity vamc_ctrl_pl is
  generic(
    g_SIMULATION          : std_logic := '0'; -- deprecated( only was to force proper simulation in vivado)
    g_DV_TYPE             : string := "int"; -- int , ext
    g_PL_DELAY_CYCLES     : integer := 0;
    g_ADD_WIDTH           : integer := 0;
    g_MEM_WIDTH           : integer := 0;
    g_MEM_DEPTH           : integer := 0     -- maximum depth of the ram, also the maximum delay
  );
  port (
    clk                   : in std_logic;
    rst                   : in std_logic;
    ena                   : in std_logic := '1';
    --
    i_freeze              : in std_logic := '0';
    i_ext_ctrl            : in std_logic := '0';
    -- Port A
    i_addr_a              : in  std_logic_vector(g_ADD_WIDTH-1 downto 0):= (others => '0');
    o_addr_a              : out std_logic_vector(g_ADD_WIDTH-1 downto 0):= (others => '0');
    -- Port B
    i_addr_b              : in  std_logic_vector(g_ADD_WIDTH-1 downto 0):= (others => '0');
    o_addr_b              : out std_logic_vector(g_ADD_WIDTH-1 downto 0):= (others => '0')
  );
end entity vamc_ctrl_pl;

architecture beh of vamc_ctrl_pl is

  --------------------------------
  -- constants
  --------------------------------
  constant ADD_WIDTH : integer := init_add_width(g_MEM_DEPTH,g_ADD_WIDTH);--integer(ceil(log2(real(g_MEM_DEPTH))));
  constant MEM_DEPTH : integer := init_mem_depth(g_MEM_DEPTH,g_ADD_WIDTH);
  constant MEM_WIDTH : integer := init_mem_width(g_MEM_WIDTH,g_DV_TYPE);--g_MEM_WIDTH + 1;

  --------------------------------
  -- functions
  --------------------------------
  function set_read_index(
      write_index : integer := 0;
      fi_delay : integer := 0
    ) return integer is
      variable o_rd_index : integer := 0;
    begin
      if write_index - fi_delay >= 0 then
        o_rd_index := write_index - fi_delay;
      else
        o_rd_index := (MEM_DEPTH - 1) - (fi_delay - 1)  + write_index;
      end if;
    return o_rd_index;
  end function;

  function inc_rd_index(read_index : integer; index_inc : integer := 1) return integer is
      variable o_rd_index : integer := 0;
    begin
      if read_index < MEM_DEPTH - 1 then
        o_rd_index := read_index + index_inc;
      else
        o_rd_index := 0;
      end if;
    return o_rd_index;

  end function;

  function inc_wr_index(write_index : integer; index_inc : integer := 1) return integer is
    variable o_wr_index_aux : integer := 0;
    begin
    if write_index < MEM_DEPTH - 1 then
      o_wr_index_aux := write_index + index_inc;
    else
      o_wr_index_aux := 0;
    end if;
    return o_wr_index_aux;
  end function;

  --------------------------------
  -- signals
  --------------------------------

  signal wr_index_aux : integer range 0 to MEM_DEPTH -1;
  signal rd_index_aux : integer range 0 to MEM_DEPTH -1;
  signal wr_index     : integer range 0 to MEM_DEPTH -1 := 0;
  signal rd_index     : integer range 0 to MEM_DEPTH -1 := 0;

  signal mem_addr_a   : std_logic_vector(ADD_WIDTH-1 downto 0) := (others => '0');
  signal mem_addr_b   : std_logic_vector(ADD_WIDTH-1 downto 0);
  signal mem_in_a     : std_logic_vector(MEM_WIDTH - 1 downto 0);
  signal mem_in_b     : std_logic_vector(MEM_WIDTH - 1 downto 0);
  signal mem_out_a    : std_logic_vector(MEM_WIDTH - 1 downto 0);
  signal mem_out_b    : std_logic_vector(MEM_WIDTH - 1 downto 0);

  -- signal used_data    : integer range MEM_DEPTH - 1 downto 0 := 0;

begin
  
  -- mem_in_b <= (others => '0');
  mem_addr_a <= std_logic_vector(to_unsigned( wr_index , ADD_WIDTH ));
  mem_addr_b <= std_logic_vector(to_unsigned( rd_index , ADD_WIDTH ));

  o_addr_a <= mem_addr_a;
  o_addr_b <= mem_addr_b;

  MEM_CTRL: process(clk) begin
    if rising_edge(clk) then
      if rst = '1' then
        wr_index_aux <= 0;
        rd_index_aux <= set_read_index(0,g_PL_DELAY_CYCLES);
      else

        if i_freeze = '0' then -- normal
          wr_index_aux <= inc_wr_index(wr_index_aux);
          rd_index_aux <= inc_rd_index(rd_index_aux);
        end if;
      end if;
    end if;
  end process MEM_CTRL;

  wr_index <= wr_index_aux when i_ext_ctrl = '0' else to_integer(unsigned(i_addr_a));
  rd_index <= rd_index_aux when i_ext_ctrl = '0' else to_integer(unsigned(i_addr_b));

end architecture beh;
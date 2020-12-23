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
--  Revisions:  0.1   : single ram
--              0.11  : added parts from Vivado mem templates
--
--------------------------------------------------------------------------------

entity vhdl_ram_memory is
  generic(
    g_SIMULATION        : std_logic := '0';
    g_MEMORY_TYPE       : string := "auto"; -- auto, ultra, block, distributed
    --
    g_PIPELINE_LATENCY  : natural := 0;
    -- g_PIPELINE_OUT_REGS : natural := 0;

    g_RAM_WIDTH         : natural := 64;
    g_RAM_DEPTH         : integer := 9600     -- maximum depth of the ram, also the maximum delay
  )
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    -- SC ports
    i_ctrl_wr_req       : in std_logic; -- in pipeline mode behaves as i_wr_data data valid
    i_ctrl_rd_en       : in std_logic := '1'; -- in pipeline mode behaves as i_wr_data data valid
    i_ctrl_addr         : in std_logic_vector(log2(g_RAM_DEPTH) -1 downto 0);
    i_ctrl_data_in      : in std_logic_vector(g_RAM_WIDTH - 1 downto 0);
    o_ctrl_data_out     : out std_logic_vector(g_RAM_WIDTH - 1 downto 0);
    -- fw ports
    i_rd_en             : in  std_logic := '1';
    i_rd_addr           : in std_logic_vector(log2(g_RAM_DEPTH) -1 downto 0);
    o_rd_data           : out std_logic_vector(g_RAM_WIDTH - 1 downto 0)
    -- o_rd_dv           : out std_logic;
    -- Flags
    -- o_empty           : out std_logic;
    -- o_empty_next      : out std_logic;
    -- o_full            : out std_logic;
    -- o_full_next       : out std_logic;
    -- used counter
    -- o_used            : out integer range g_RAM_DEPTH - 1 downto 0
    -- The delay can be changed by the offset and resetting the module

  );
end entity vhdl_ram_memory;

architecture beh of vhdl_ram_memory is
  --------------------------------
  -- memory
  --------------------------------
  type mem_ram is array (0 to g_RAM_DEPTH - 1) of std_logic_vector(g_RAM_WIDTH - 1 downto 0);
  signal mem    : mem_avt;
  signal mem_dv : std_logic_vector(0 to g_RAM_DEPTH - 1) := (others => '0');
  attribute ram_style        : string;
  attribute ram_style of mem : signal is g_MEMORY_TYPE;
  --------------------------------
  -- signals
  --------------------------------
  signal case_options : std_logic_vector(1 downto 0);

  signal int_ctrl_wr_addr     : std_logic_vector(log2(g_RAM_DEPTH) -1 downto 0);
  signal int_ctrl_wr_data_in  : std_logic_vector(g_RAM_WIDTH - 1 downto 0);

  type int_ctrl_wr_data_out_at is array (g_PIPELINE_LATENCY downto 0) of std_logic_vector(g_RAM_WIDTH - 1 downto 0);
  signal int_ctrl_wr_data_out_a : int_ctrl_wr_data_out_at;

  signal int_rd_addr : std_logic_vector(log2(g_RAM_DEPTH) -1 downto 0);

  type int_rd_data_at is array (g_PIPELINE_LATENCY downto 0) of std_logic_vector(g_RAM_WIDTH - 1 downto 0);
  signal int_rd_data_a : int_rd_data_at;


begin

  -- RAM : Read has one latency, Write has one latency as well.
  process(clk)
  begin
    if rising_edge(clk) then

      -- <ram_data> <= <ram_name>(to_integer(unsigned(<addrb>)));
      int_ctrl_wr_data_out_a(0) <= mem_ram(to_integer(unsigned(i_ctrl_addr))); --SoC
      int_rd_data_a(0) <= mem_ram(to_integer(unsigned(i_rd_addr))); -- FW

      if(i_ctrl_wr_req = '1') then
        -- <ram_name>(to_integer(unsigned(<addra>))) <= <dina>;
        mem_ram(to_integer(unsigned(i_ctrl_addr))) <= int_ctrl_wr_data_in;
      end if;

    end if;
  end process;

  GEN1 : if g_MEMORY_TYPE /= "ultra" generate

    no_output_register : if g_PIPELINE_LATENCY = 0 generate
      o_ctrl_data_out <= int_ctrl_wr_data_out_a(0);
      o_rd_data <= int_rd_data_a(0);
    end generate;

    -- RAM output data goes through a pipeline.
    output_register : if g_PIPELINE_LATENCY > 0 generate
      process(clk)
      begin
          if rising_edge(clk) then
              if(rst = '1') then
                int_ctrl_wr_data_out_a(0) <= (others => '0');
              elsif(i_ctrl_rd_en = '1') then
                int_ctrl_wr_data_out_a(1) <= int_ctrl_wr_data_out_a(0);
              end if;
          end if;
      end process;
      o_ctrl_data_out <= int_ctrl_wr_data_out_a(1);
      
      process(clk)
      begin
          if rising_edge(clk) then
              if(rst = '1') then
                int_rd_data_a(0) <= (others => '0');
              elsif(i_rd_en = '1') then
                int_rd_data_a(0) <= int_rd_data_a(0);
              end if;
          end if;
      end process;
      o_rd_data <= int_rd_data_a(1);
    end generate;

  end generate;

  GEN1 : if g_MEMORY_TYPE = "ultra" generate

  end generate;
  

  -- case_options <= i_ctrl_wr_req & i_rd_req;

  -- RAM_1: process(clk)
  -- begin
  --   if rising_edge(clk) then
  --     if rst = '1' then
        
  --     else
        
  --       case case_options is
  --         when b"00" => -- idle

  --         when b"10" => -- write

  --           int_ctrl_wr_data_out <= mem_ram(to_integer(unsigned(int_ctrl_rd_addr)));
  --           mem_ram(to_integer(unsigned(int_ctrl_wr_addr))) <= int_ctrl_wr_data_in;

  --         when b"01" => -- read
          
  --           int_rd_data <= mem_ram(to_integer(unsigned(int_rd_addr)));

  --         when b"11" => -- read & write 

  --           int_rd_data <= mem_ram(to_integer(unsigned(int_rd_addr)));
  --           mem_ram(to_integer(unsigned(int_ctrl_wr_addr))) <= int_ctrl_wr_data_in;
  --           int_ctrl_wr_data_out <= mem_ram(to_integer(unsigned(int_ctrl_rd_addr)));

  --         when others =>
  --           -- ERROR
          
  --       end case;
        
  --     end if;
  --   end if;
  -- end process RAM_1;
  
  
  
end architecture beh;





--  Xilinx Simple Dual Port Single Clock RAM
--  This code implements a parameterizable SDP single clock memory.
--  If a reset or enable is not necessary, it may be tied off or removed from the code.
--  Modify the parameters for the desired RAM characteristics.

-- Following libraries have to be used
--use ieee.std_logic_1164.all;
--use std.textio.all;
--use ieee.numeric_std.all;


--Insert the following in the architecture before the begin keyword
--  The following function calculates the address width based on specified RAM depth
function clogb2( depth : natural) return integer is
  variable temp    : integer := depth;
  variable ret_val : integer := 0;
  begin
      while temp > 1 loop
          ret_val := ret_val + 1;
          temp    := temp / 2;
      end loop;
      return ret_val;
  end function;
  
  
  -- Note :
  -- If the chosen width and depth values are low, Synthesis will infer Distributed RAM.
  -- C_RAM_DEPTH should be a power of 2
  constant C_RAM_WIDTH : integer := <ram_width>;            		-- Specify RAM data width
  constant C_RAM_DEPTH : integer := <ram_depth>; 				        -- Specify RAM depth (number of entries)
  constant C_RAM_PERFORMANCE : string := <ram_performance>; 		-- Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
  constant C_INIT_FILE : string := <init_file>;    				 -- Specify name/location of RAM initialization file if using one (leave blank if not)
  
  signal <addra> : std_logic_vector((clogb2(C_RAM_DEPTH)-1) downto 0);     -- Write address bus, width determined from RAM_DEPTH
  signal <addrb> : std_logic_vector((clogb2(C_RAM_DEPTH)-1) downto 0);     -- Read address bus, width determined from RAM_DEPTH
  signal <dina>  : std_logic_vector(C_RAM_WIDTH-1 downto 0);		  -- RAM input data
  signal clk  : std_logic;                       			  -- Clock
  signal <wea>   : std_logic;                       			  -- Write enable
  signal <enb>   : std_logic;                       			  -- RAM Enable, for additional power savings, disable port when not in use
  signal rst  : std_logic;                       			  -- Output reset (does not affect memory contents)
  signal <regceb>: std_logic;                       			  -- Output register enable
  signal <doutb> : std_logic_vector(C_RAM_WIDTH-1 downto 0); 		  -- RAM output data
  
  signal o_rd_data : std_logic_vector(C_RAM_WIDTH-1 downto 0) := (others => '0');
  type ram_type is array (C_RAM_DEPTH-1 downto 0) of std_logic_vector (C_RAM_WIDTH-1 downto 0);          -- 2D Array Declaration for RAM signal
  signal <ram_data> : std_logic_vector(C_RAM_WIDTH-1 downto 0) ;
  
  -- The folowing code either initializes the memory values to a specified file or to all zeros to match hardware
  function initramfromfile (ramfilename : in string) return ram_type is
  file ramfile	: text is in ramfilename;
  variable ramfileline : line;
  variable ram_name	: ram_type;
  variable bitvec : bit_vector(C_RAM_WIDTH-1 downto 0);
  begin
      for i in ram_type'range loop
          readline (ramfile, ramfileline);
          read (ramfileline, bitvec);
          ram_name(i) := to_stdlogicvector(bitvec);
      end loop;
      return ram_name;
  end function;
  
  function init_from_file_or_zeroes(ramfile : string) return ram_type is
  begin
      if ramfile = "<Init File Name>" then
          return InitRamFromFile("<Init File Name>") ;
      else
          return (others => (others => '0'));
      end if;
  end;
  
  -- Define RAM
  signal <ram_name> : ram_type := init_from_file_or_zeroes(C_INIT_FILE);
  
  --Insert the following in the architecture after the begin keyword
  -- process(clk)
  -- begin
  --     if(clk'event and clk = '1') then
  --         if(<wea> = '1') then
  --             <ram_name>(to_integer(unsigned(<addra>))) <= <dina>;
  --         end if;
  --         if(<enb> = '1') then
  --             <ram_data> <= <ram_name>(to_integer(unsigned(<addrb>)));
  --         end if;
  --     end if;
  -- end process;
  
  --  Following code generates LOW_LATENCY (no output register)
  --  Following is a 1 clock cycle read latency at the cost of a longer clock-to-out timing
  
  -- no_output_register : if C_RAM_PERFORMANCE = "LOW_LATENCY" generate
  --     <doutb> <= <ram_data>;
  -- end generate;
  
  --  Following code generates HIGH_PERFORMANCE (use output register)
  --  Following is a 2 clock cycle read latency with improved clock-to-out timing
  
  output_register : if C_RAM_PERFORMANCE = "HIGH_PERFORMANCE"  generate
  process(clk)
  begin
      if(clk'event and clk = '1') then
          if(rst = '1') then
              o_rd_data <= (others => '0');
          elsif(<regceb> = '1') then
              o_rd_data <= <ram_data>;
          end if;
      end if;
  end process;
  <doutb> <= o_rd_data;
  end generate;

  --  Xilinx UltraRAM True Dual Port Mode.  This code implements 
--  a parameterizable UltraRAM block with write/read on both ports in 
--  No change behavior on both the ports . The behavior of this RAM is 
--  when data is written, the output of RAM is unchanged w.r.t each port. 
--  Only when write is inactive data corresponding to the address is 
--  presented on the output port.

-- Following libraries have to be used
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;

--Insert the following in the architecture before the begin keyword
constant C_AWIDTH : integer := <AWIDTH>;
constant C_DWIDTH : integer := <DWIDTH>;
constant C_NBPIPE : integer := <NBPIPE>;

signal   <clk> :  std_logic;                                  -- Clock 

-- Port A
signal   <rsta> :  std_logic;                                  -- Reset
signal   <wea> :  std_logic;                                   -- Write Enable
signal   <regcea> :  std_logic;                                -- Output Register Enablea>
signal   <mem_ena> :  std_logic;                               -- Memory Enable
signal   <dina> :  std_logic_vector(C_DWIDTH-1 downto 0);      -- Data Input  
signal   <addra> :  std_logic_vector(C_AWIDTH-1 downto 0);     -- Address Input
signal   <douta> : std_logic_vector(C_DWIDTH-1 downto 0);      -- Data Output

-- Port b 
signal   <rstb> :  std_logic;                                  -- Reset
signal   <web> :  std_logic;                                   -- Write Enable
signal   <regceb> :  std_logic;                                -- Output Register Enableb>
signal   <mem_enb> :  std_logic;                               -- Memory Enable
signal   <dinb> :  std_logic_vector(C_DWIDTH-1 downto 0);      -- Data Input  
signal   <addrb> :  std_logic_vector(C_AWIDTH-1 downto 0);     -- Address Input
signal   <doutb> : std_logic_vector(C_DWIDTH-1 downto 0);      -- Data Output

-- Internal Signals
type <mem_t> is array(natural range<>) of std_logic_vector(C_DWIDTH-1 downto 0);
type <pipe_data_t> is array(natural range<>) of std_logic_vector(C_DWIDTH-1 downto 0);
type <pipe_en_t> is array(natural range<>) of std_logic;

shared variable <mem> : <mem_t>(2**C_AWIDTH-1 downto 0);                -- Memory Declaration

signal <memrega> : std_logic_vector(C_DWIDTH-1 downto 0);              
signal <mem_pipe_rega> : <pipe_data_t>(C_NBPIPE-1 downto 0);    -- Pipelines for Memory
signal <mem_en_pipe_rega> : <pipe_en_t>(C_NBPIPE downto 0);     -- Pipelines for Memory enable  

signal <memregb> : std_logic_vector(C_DWIDTH-1 downto 0);              
signal <mem_pipe_regb> : <pipe_data_t>(C_NBPIPE-1 downto 0);    -- Pipelines for Memory
signal <mem_en_pipe_regb> : <pipe_en_t>(C_NBPIPE downto 0);     -- Pipelines for Memory enable  
attribute ram_style : string;

attribute ram_style of <mem> : variable is "ultra";
-- Insert the following after the begin keyword


-- process(<clk>)
-- begin
--   if(<clk>'event and <clk>='1')then
--     if(<mem_ena> = '1') then
--       if(<wea> = '1') then
--         <mem>(to_integer(unsigned(<addra>))) := <dina>;
--       else
--         <memrega> <= <mem>(to_integer(unsigned(<addra>)));
--       end if;
--     end if;
--   end if;
-- end process;

-- The enable of the RAM goes through a pipeline to produce a
-- series of pipelined enable signals required to control the data
-- pipeline.
process(<clk>)
begin
  if(<clk>'event and <clk> = '1') then
    <mem_en_pipe_rega>(0) <= <mem_ena>;
    for i in 0 to C_NBPIPE-1 loop
      <mem_en_pipe_rega>(i+1) <= <mem_en_pipe_rega>(i);
    end loop;
  end if;
end process;

-- RAM output data goes through a pipeline.
process(<clk>)
begin
  if(<clk>'event and <clk> = '1') then
    if(<mem_en_pipe_rega>(0) = '1') then
      <mem_pipe_rega>(0) <= <memrega>;
    end if;
    for i in 0 to C_NBPIPE-2 loop
      if(<mem_en_pipe_rega>(i+1) = '1') then
        <mem_pipe_rega>(i+1) <= <mem_pipe_rega>(i);
      end if;
    end loop;
  end if;
end process;

-- Final output register gives user the option to add a reset and
-- an additional enable signal just for the data ouptut

process(<clk>)
begin
  if(<clk>'event and <clk> = '1') then
    if(<rsta> = '1') then
      <douta> <= (others => '0');
    elsif(<mem_en_pipe_rega>(C_NBPIPE) = '1' and <regcea> = '1' ) then
      <douta> <= <mem_pipe_rega>(C_NBPIPE-1);
    end if;
  end if;    
end process;


process(<clk>)
begin
  if(<clk>'event and clk='1')then
    if(<mem_enb> = '1') then
      if(<web> = '1') then
        <mem>(to_integer(unsigned(<addrb>))) := <dinb>;
      else
        <memregb> <= <mem>(to_integer(unsigned(<addrb>)));
      end if;
    end if;
  end if;
end process;

-- The enable of the RAM goes through a pipeline to produce a
-- series of pipelined enable signals required to control the data
-- pipeline.
process(<clk>)
begin
  if(<clk>'event and <clk> = '1') then
    <mem_en_pipe_regb>(0) <= <mem_enb>;
    for i in 0 to C_NBPIPE-1 loop
      <mem_en_pipe_regb>(i+1) <= <mem_en_pipe_regb>(i);
    end loop;
  end if;
end process;

-- RAM output data goes through a pipeline.
process(<clk>)
begin
  if(<clk>'event and <clk> = '1') then
    if(<mem_en_pipe_regb>(0) = '1') then
      <mem_pipe_regb>(0) <= <memregb>;
    end if;
    for i in 0 to C_NBPIPE-2 loop
      if(<mem_en_pipe_regb>(i+1) = '1') then
        <mem_pipe_regb>(i+1) <= <mem_pipe_regb>(i);
      end if;
    end loop;
  end if;
end process;

-- Final output register gives user the option to add a reset and
-- an additional enable signal just for the data ouptut

process(<clk>)
begin
  if(<clk>'event and <clk> = '1') then
    if(<rstb> = '1') then
      <doutb> <= (others => '0');
    elsif(<mem_en_pipe_regb>(C_NBPIPE) = '1' and <regceb> = '1' ) then
      <doutb> <= <mem_pipe_regb>(C_NBPIPE-1);
    end if;
  end if;    
end process;

						
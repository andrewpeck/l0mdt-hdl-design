library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
-- use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
-- use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
-- use shared_lib.config_pkg.all;

-- library ctrl_lib;
-- use ctrl_lib.DAQ_CTRL.all;

library daq_lib;

library daq_core;
use daq_core.daq_defs.all;
-- use daq_core.yml2hdl.all;

entity daq_fifo_pipeline is
  generic (g_FIFO_DEPTH : integer;
           g_FIFO_MEMORY_TYPE : string);
  port (i_clk : std_logic;
        i_rst : std_logic;
        -- priority -----------------------------------
        i_1st_src_payload : in  std_logic_vector;
        i_1st_src_wr_strb : in  std_logic;
        -- secondary ----------------------------------
        i_2nd_src_nempty   : in  std_logic;
        i_2nd_src_payload  : in  std_logic_vector;
        o_2nd_src_rd_strb  : out std_logic;
        -- read ---------------------------------------
        i_dst_rd_strb : in  std_logic;
        o_dst_nempty  : out std_logic;
        o_dst_payload : out std_logic_vector);        
end entity daq_fifo_pipeline;

architecture behavioral of daq_fifo_pipeline is
  signal fifo_payload : std_logic_vector(i_1st_src_payload'range);
  signal fifo_wr_strb : std_logic; 
begin

  process (i_clk)
  begin
    if rising_edge(i_clk) then
      
      if i_1st_src_wr_strb = '1' then
        fifo_wr_strb  <= '1';
        fifo_payload  <= i_1st_src_payload;
      else
        fifo_wr_strb <= i_2nd_src_nempty;
        fifo_payload <= i_2nd_src_payload;
      end if;

      if i_1st_src_wr_strb = '0' and i_2nd_src_nempty = '1' then 
        o_2nd_src_rd_strb <= '1';
      else
        o_2nd_src_rd_strb <= '0';
      end if;
      
    end if;
  end process;
  
  
  u_chamber_fifo : entity daq_lib.daq_fifo
    generic map (g_FIFO_DEPTH       => g_FIFO_DEPTH, -- : integer;
                 g_FIFO_MEMORY_TYPE => g_FIFO_MEMORY_TYPE) -- : integer range 0 to 3 := 0)
    port map (i_sys_clk_fast => i_clk, -- : in std_logic;
              i_sys_rst      => i_rst, -- : in std_logic;
              ---------------------------------------------
              i_src_payload  => fifo_payload, -- : in  std_logic_vector;
              i_src_wr_strb  => fifo_wr_strb, -- : in  std_logic;
              ---------------------------------------------
              i_dst_rd_strb  => i_dst_rd_strb, -- : in  std_logic;
              o_dst_nempty   => o_dst_nempty, -- : out std_logic;
              o_dst_payload  => o_dst_payload); -- : out std_logic_vector);
  
end architecture behavioral;

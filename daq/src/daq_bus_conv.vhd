library IEEE;
library types_def;
library daq_def;

use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

use types_def.common_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_bus_conv is
  generic (G : bconv_grt);
  port (port_ir : in  bconv_irt; port_or : out bconv_ort);
end entity daq_bus_conv;

architecture V2 of daq_bus_conv is

  constant K : natural := ((G.INPUT_DATA_LEN-1) / G.OUTPUT_DATA_LEN) + 1;

  subtype pld_src_t is std_logic_vector(K*G.OUTPUT_DATA_LEN-1 downto 0);
  subtype pld_dst_t is std_logic_vector(G.OUTPUT_DATA_LEN-1 downto 0);

  type mux_at is array(K-1 downto 0) of pld_dst_t;

  signal pld_src : pld_src_t := (others => '0');
  signal mux_a : mux_at := (others => (others => '0'));
  
  signal sel : natural := K-1;

  signal src_rd_strb : std_logic;
  signal dst_rd_strb : std_logic;

  signal src_nempty : std_logic;
  signal dst_nempty : std_logic;
  
begin

  -- port assignments
  port_or.dst.data <= ((port_or.dst.data'left downto mux_a(sel)'length => '0') & mux_a(sel));
  pld_src <= port_ir.src.data(pld_src'range);

  port_or.dst.nempty <= dst_nempty;
  src_nempty <= port_ir.src.nempty;

  dst_rd_strb <=  port_ir.dst.rd_strb;
  port_or.src.rd_strb <= src_rd_strb;
  
  -- nempty signal from src is sent directly to the dst
  dst_nempty <= src_nempty;

  fg: for i in 0 to K-1 generate
    mux_a(i) <= pld_src((i+1)*pld_dst_t'length-1 downto i*pld_dst_t'length);
  end generate fg;

  -- expose rd strb
  src_rd_strb <= dst_rd_strb when (K > 1 and sel = 0) or K = 1 else '0';
  
  -- exposing data
  process (port_ir.sys.clk320)
  begin
    if rising_edge(port_ir.sys.clk320) then
   
      if port_ir.sys.rst = '1' then
        sel <= K-1;
      else
        if (dst_rd_strb = '1' and src_nempty = '1') then
          if sel > 0 then
            sel <= sel - 1;
          else
            sel <= K-1;
          end if; 
        end if; -- pkt bldr rd strb
      end if; -- sync reset
    end if; -- rising edge
      
  end process; -- clock
end V2;

--------------------------------------------------------------------------------

library IEEE;
library types_def;
library daq_def;

use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

use types_def.common_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_bus_conv_wrap is
  generic (G : bconv_grt);
  port (port_iv : in  bconv_ivt; port_ov : out bconv_ovt);
end entity daq_bus_conv_wrap;

architecture V2 of daq_bus_conv_wrap is
  signal port_ir : bconv_irt;
  signal port_or : bconv_ort;
begin
  port_ir <= structify(port_iv, port_ir);
  port_ov <= vectorify(port_or, port_ov);
  u_bconv : entity work.daq_bus_conv
    generic map (G) port map (port_ir, port_or);
end V2;

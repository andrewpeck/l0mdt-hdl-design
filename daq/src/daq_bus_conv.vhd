library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library daq_lib;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;
use daq_lib.daq_row_defs_pkg.all;

package daq_bus_conv_pkg is
  component daq_bus_conv is
    generic(G : bconv_generics_rt);
    port (i : in bconv_irt; o : out bconv_ort); 
  end component daq_bus_conv;
end package daq_bus_conv_pkg;

-----------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library daq_lib;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;
use daq_lib.daq_row_defs_pkg.all;

entity daq_bus_conv is
  generic(G : bconv_generics_rt := (INPUT_DATA_LEN => daq_hdr_rvt'length,
                                    OUTPUT_DATA_LEN => 16,
                                    COUNTER_LEN => 16));
  port (i : in bconv_irt; o : out bconv_ort);    
end entity daq_bus_conv;

architecture V2 of daq_bus_conv is

  -- K is the number of words needed for the packet builder to send
  -- the input data out.
  constant K : integer := ((i.cell.data'length-1) / o.pkt_bldr.data'length)+1;
  constant ADJUSTED_LEN : integer := K * o.pkt_bldr.data'length;

  -- word map is a one-hot map to address the words
  signal word_map
    : std_logic_vector(K-1 downto 0)
    := '1' & (K-2 downto 0 => '0');

  -- adjusting word size to multiple of "G.read_len"
  signal aligned: std_logic_vector(ADJUSTED_LEN-1 downto 0) := (others => '0');
  
  -- -- reading control counter and related registered signal (delayed)
  signal rd_cnt   : natural := 0;
  signal rd_cnt_r : natural;

  -- holding the data to be received by pkt_builder
  signal data : std_logic_vector(o.pkt_bldr.data'range);

  -- registered nempty signal.
  -- signal nempty_r : std_logic;

  function get_onehot_index(onehot : std_logic_vector) return integer is
  begin
    for i in onehot'range loop
      if (onehot(i) = '1') then
        return i;
      end if;
    end loop;
    return -1;
  end function;
  
begin

  -- output signals cannot be read inside block.
  o.pkt_bldr.data <= data;

  -- received data is kept left aligned in the following vector
  aligned(aligned'left downto aligned'length - i.cell.data'length)
    <= i.cell.data;
  
  -- nempty signal is just mirrored from the local FIFO. This is
  -- possible if the read strobe sent to the prior FIFO happens only
  -- when the last slice of the current information is being
  -- retrieved. Input nempty signal is kept for one extra cycle to the
  -- receiving module be able to register the data.
  -- nempty_r <= nempty_i when rising_edge(clk320_i);
  -- nempty_o <= nempty_i or nempty_r;
  o.pkt_bldr.nempty <= i.cell.nempty;

  -- convert one hot bit to an word index during bus conversion
  rd_cnt <= get_onehot_index(word_map);


  -- output bus always slides over the input bus controlled by the
  -- read counter. The number of times that this happens varies
  -- according to the output bus width.
  data <= aligned(rd_cnt * o.pkt_bldr.data'length + o.pkt_bldr.data'left
                  downto rd_cnt * o.pkt_bldr.data'length);

  
  
  -- exposing data
  process (i.sys.clk320)
  begin
    if rising_edge(i.sys.clk320) then

      if i.sys.rst = '1' then

        -- one_hot should start from the left as well
        -- word_map <= (word_map'left downto 1 => '0') & '1'; 
        word_map <= '1' & (word_map'left-1 downto 0 => '0'); 

        -- rd_cnt <= 0;
        -- rd_cnt_r <= 0;

      else


        -- output data is one clock delayed
        -- data_o <= data;

        -- generating a delayed counter to detect end of word.
        rd_cnt_r <= rd_cnt;

        -- receiving a read strobe from the Packet Builder means that it
        -- already have used that piece of information.
        if i.pkt_bldr.rd_strb = '1' then

          -- thus we have to update the output payload slice. If it is
          -- in the last slice of data, it shall restart.

          -- wrong order...
          -- word_map(word_map'left downto 1) <= word_map(word_map'left-1 downto 0);
          -- word_map(0) <= word_map(word_map'left);

          -- must be from right to left
          word_map(word_map'left-1 downto 0) <= word_map(word_map'left downto 1);
          word_map(word_map'left) <= word_map(0);

          -- if rd_cnt+1 < K then 
          --   rd_cnt <= rd_cnt + 1;
          -- else
          --   rd_cnt <= 0;
          -- end if;
          
        end if;

        -- read enable is sent to the previous node to inform it that the
        -- current data is done. It is tied to the read enable coming from the
        -- next node, which will only happen if there is data available still
        -- (mirrored nempty signals).

        -- when sending right to left
        -- if K >= 3 then
        --   if rd_cnt_r = K-3 and rd_cnt = K-2 then
        --     rd_en_o <= rd_en_i;
        --   else
        --     rd_en_o <= '0';
        --   end if;
        -- elsif K = 2 then
        --   if rd_cnt = 0 then
        --     rd_en_o <= rd_en_i;
        --   else
        --     rd_en_o <= '0';
        --   end if;
        -- else
        --   rd_en_o <= rd_en_i;
        -- end if;


        if rd_cnt = 1 then
          o.cell.rd_strb <= i.pkt_bldr.rd_strb;
        else
          o.cell.rd_strb <= '0';
        end if;       

        -- stop logic also needs to be inverted...
        -- sending left to right
        -- if K >= 2 then
        --   if rd_cnt_r = 1 and rd_cnt = 0 then
        --     rd_en_o <= rd_en_i;
        --   else
        --     rd_en_o <= '0';
        --   end if;
        -- elsif K = 2 then
        --   if rd_cnt = 0 then
        --     rd_en_o <= rd_en_i;
        --   else
        --     rd_en_o <= '0';
        --   end if;
        -- else
        --   rd_en_o <= rd_en_i;
        -- end if;
        
      end if;
      
    end if;
  end process;

end V2;

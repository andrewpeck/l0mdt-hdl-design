-- MNGR coordinates when the Packet Manager should act. when enabled,
-- it will sequentially drain all cells of a given column, which is
-- defined by the MNGR. For each cell, it reads the related counter
-- and after that its payload. All data is serialized to the elink
-- output. Row selection (in that given column) is coordinated by the
-- Packet Builder.

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
use daq_lib.daq_user_defs_pkg.all;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;
use daq_lib.daq_row_defs_pkg.all;
use daq_lib.daq_header_cell_pkg.all;
use daq_lib.daq_data_cell_pkg.all;
use daq_lib.daq_bus_conv_pkg.all;

library ttc_lib;
use ttc_lib.ttc_defs_pkg.all;

package daq_packet_builder_pkg is
  component daq_packet_builder is
    generic (G: pkt_bldr_generics_rt);
    port(i: in pkt_bldr_irt; o: out pkt_bldr_ort);
  end component daq_packet_builder;
end package daq_packet_builder_pkg;

-----------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.math_real.all;


library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library daq_lib;
use daq_lib.daq_user_defs_pkg.all;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;
use daq_lib.daq_row_defs_pkg.all;
use daq_lib.daq_header_cell_pkg.all;
use daq_lib.daq_data_cell_pkg.all;
use daq_lib.daq_bus_conv_pkg.all;

library ttc_lib;
use ttc_lib.ttc_defs_pkg.all;

entity daq_packet_builder is
  generic (G: pkt_bldr_generics_rt);
  port(i: in pkt_bldr_irt; o: out pkt_bldr_ort);
end entity daq_packet_builder;

architecture V2 of daq_packet_builder is


  type state_t is (IDLE, -- waiting for data to send
                   COUNTER, -- send counter information of the related fifo
                   DRAIN, -- getting all data from processing column FIFOs
                   LOCKED); -- when f2e is not available...
  signal state : state_t := IDLE; 
  signal previous : state_t := IDLE; 

  -- row selection
  signal row_sel : natural := 0;

  -- end of transmission
  signal done : std_logic := '0';

  -- start of packet word in f2e
  constant STA : std_logic_vector := "10" & (o.f2e.data'left-2 downto 0 => '0');
  -- end of packet word in f2e
  constant STO : std_logic_vector := "01" & (o.f2e.data'left-2 downto 0 => '0');

begin

  -- done_o <= done;
  o.mngt.done <= done;
  
  -- rd_sel_o <= std_logic_vector(to_unsigned(row_sel, rd_sel_o'length));
  o.mngt.row_sel <= std_logic_vector(to_unsigned(row_sel,
                                                 o.mngt.row_sel'length));

  process (state, i.mngt.en, i.row.nempty)
  begin
    if (state = DRAIN -- or state = COUNTER check order of tests
        and i.mngt.en = '1'
        and i.row.nempty = '1') then
      o.row.rd_strb <= '1';
    else
      o.row.rd_strb <= '1';
    end if;
  end process;

  
  process (i.sys.clk320)
  begin

    if rising_edge(i.sys.clk320) then

      if i.sys.rst = '1' then

        row_sel <= 0;
        state <= IDLE;
        done <= '0';

        o.row.rd_strb <= '0';
        o.f2e.wr_en <= '0';
        o.f2e.data <= (others => '0');
        
      else
        
        case state is

          -- wait for data ready to be sent
          when IDLE =>
            -- disable f2e write enable by default when idle
            o.f2e.wr_en <= '0';
            -- keeps first row selected in preparation for next round
            row_sel <= 0;
            -- just send data out if fifo2elink is not overloaded.
            if i.f2e.hfull = '1' then
              state <= LOCKED;
              previous <= IDLE;
            elsif i.mngt.en = '1' then
              -- start packet word...
              o.f2e.data <= STA;
              -- inform fifo2elink that data is available
              o.f2e.wr_en <= '1';
              -- move to next state
              state <= COUNTER;
            else -- not enabled
              done <= '0';
              state <= IDLE;
            end if;

          -- send counter information, and move to the draining mode
          -- fifo2elink write strobe is kept high
          when COUNTER =>
            -- ensure f2c write enable is not active if not needed.
            o.f2e.wr_en <= '0';
            -- pause sending if f2e is full
            if i.f2e.hfull = '1' then
              state <= LOCKED;
              previous <= COUNTER;
            elsif i.mngt.en = '1' then
              o.f2e.data(o.f2e.data'left downto o.f2e.data'left-i.row.counter'length)
                <= (others => '0');   
              o.f2e.data(i.row.counter'range) <= i.row.counter;
              o.f2e.wr_en <= '1';
              state <= DRAIN;
            else -- not enabled
              done <= '0';
              state <= IDLE;
            end if; -- enabled or not

          -- then drain related FIFO
          -- fifo2elink write strobe is kept high
          when DRAIN =>
            -- ensure f2c write enable is not active if not needed.
            o.f2e.wr_en <= '0';
            -- pause sending if f2e is full
            if i.f2e.hfull = '1' then
              state <= LOCKED;
              previous <= DRAIN;
            elsif i.mngt.en = '1' then
              -- if there is still data to be retrieved, expose it to
              -- the fifo2elink input
              if i.row.nempty = '1' then
                -- -- inform FIFO that data was used
                -- rd_en_o <= '1';
                -- expose data to the elink interface
                o.f2e.wr_en <= '1';
                
              -- if there are no more data in the current row
              else
                -- move to the next row if available
                if row_sel < DEV_ROWS-1 then
                  row_sel <= row_sel + 1;
                  state <= COUNTER;
                -- or end the packet.
                else
                  -- enfure that stop word is sent just once
                  if done = '0' then
                    o.f2e.data <= STO;
                    o.f2e.wr_en <= '1';
                    done <= '1';
                  end if;
                end if; -- sweeping rows
              end if; -- data available
            else -- not enabled
              done <= '0';
              state <= IDLE;
            end if; -- enabled or not
          when LOCKED =>
            -- ensure f2c write enable is not active
            o.f2e.wr_en <= '0';
            -- return to previous state if situation is good again.
            if i.f2e.hfull = '0' then
              state <= previous;
            end if;
        end case;
      end if;
    end if;    
  end process;

end V2;

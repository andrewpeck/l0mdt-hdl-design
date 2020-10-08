-- MNGR coordinates when the Packet Manager should act. when enabled,
-- it will sequentially drain all cells of a given column, which is
-- defined by the MNGR. For each cell, it reads the related counter
-- and after that its payload. All data is serialized to the elink
-- output. Row selection (in that given column) is coordinated by the
-- Packet Builder.

library ieee;
library types_def;
library ttc_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use types_def.common_defs.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;

entity daq_packet_builder is
  generic (G: daq_pbldr_grt);
  port(port_ir: in daq_pbldr_irt; port_or: out daq_pbldr_ort);
end entity daq_packet_builder;

architecture V2 of daq_packet_builder is


  type state_t is (IDLE, -- waiting for data to send
                   DRAIN, -- getting all data from processing column FIFOs
                   LOCKED); -- when f2e is not available...
  signal state : state_t := IDLE; 
  signal previous : state_t := IDLE; 

  -- row selection
  signal row_sel : natural := 0;

  -- end of transmission
  signal sto_sent : std_logic := '0';

  -- start of packet word in f2e
  constant STA : std_logic_vector(G.DATA_LEN+1 downto 0) := "10" & (G.DATA_LEN-1 downto 0 => '0');
  -- end of packet word in f2e
  constant STO : std_logic_vector(G.DATA_LEN+1 downto 0) := "01" & (G.DATA_LEN-1 downto 0 => '0');

begin

  fg: for j in port_or.row.sel'range generate
    port_or.row.sel(j) <= '1' when row_sel = j else '0';
  end generate fg;

  -- process (state, port_ir.mngt.en, port_ir.row.payload.nempty)
  -- begin
  --   if (state = DRAIN 
  --       and port_ir.mngt.en = '1'
  --       and port_ir.row.payload.nempty = '1') then
  --     port_or.row.payload.rd_strb <= '1';
  --   else
  --     port_or.row.payload.rd_strb <= '1';
  --   end if;
  -- end process;

  
  process (port_ir.sys.clk320)
  begin

    if rising_edge(port_ir.sys.clk320) then

      if port_ir.sys.rst = '1' then

        row_sel <= 0;
        state <= IDLE;
        sto_sent <= '0';

        port_or.row.payload.rd_strb <= '0';
        port_or.f2e.wr_en <= '0';
        port_or.f2e.data <= (others => '0');
        
      else
        
        case state is

          -- wait for data ready to be sent
          when IDLE =>
            -- disable f2e write enable by default when idle
            port_or.f2e.wr_en <= '0';
            -- keeps first row selected in preparation for next round
            row_sel <= 0;
            -- just send data out if fifo2elink is not overloaded.
            if port_ir.f2e.hfull = '1' then
              state <= LOCKED;
              previous <= IDLE;
            elsif port_ir.mngt.en = '1' then
              -- start packet word...
              port_or.f2e.data <= ((port_or.f2e.data'left downto STA'length => '0'), STA);
              -- inform fifo2elink that data is available
              port_or.f2e.wr_en <= '1';
              -- move to next state
              state <= DRAIN;
            else -- not enabled
              sto_sent <= '0';
              state <= IDLE;
            end if;

          -- then drain related FIFO
          -- fifo2elink write strobe is kept high
          when DRAIN =>
            -- ensure f2e and row write enables are only active when needed
            port_or.f2e.wr_en <= '0';
            port_or.row.payload.rd_strb <= '0';
            
            -- pause sending if f2e is full
            if port_ir.f2e.hfull = '1' then
              state <= LOCKED;
              previous <= DRAIN;
            elsif port_ir.mngt.en = '1' then
              -- if there is still data to be retrieved, expose it to
              -- the fifo2elink input
              if port_ir.row.payload.nempty = '1' then
                -- inform ROW that data was used
                port_or.row.payload.rd_strb <= '1';
                -- expose data to the elink interface
                port_or.f2e.wr_en <= '1';
                port_or.f2e.data <= port_ir.row.payload.data;
                
              -- if there are no more data in the current row
              else
                -- move to the next row if available
                if row_sel < DAQ_MAX_STREAMS-1 then
                  row_sel <= row_sel + 1;
                -- or end the packet.
                else
                  -- enfure that stop word is sent just once
                  if sto_sent = '0' then
                    port_or.f2e.data <= ((port_or.f2e.data'left downto STO'length => '0'), STO);
                    port_or.f2e.wr_en <= '1';
                    sto_sent <= '1';
                  end if;
                end if; -- sweeping rows
              end if; -- data available
            else -- not enabled
              sto_sent <= '0';
              state <= IDLE;
            end if; -- enabled or not
          when LOCKED =>
            -- ensure f2c write enable is not active
            port_or.f2e.wr_en <= '0';
            -- return to previous state if situation is good again.
            if port_ir.f2e.hfull = '0' then
              state <= previous;
            end if;
        end case;
      end if;
    end if;    
  end process;

end V2;

--------------------------------------------------------------------------------

library ieee;
library types_def;
library ttc_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use types_def.common_defs.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;

entity daq_packet_builder_wrap is
  generic (G: daq_pbldr_grt);
  port(port_iv: in daq_pbldr_ivt; port_ov: out daq_pbldr_ovt);
end entity daq_packet_builder_wrap;

architecture V2 of daq_packet_builder_wrap is
  signal port_ir : daq_pbldr_irt;
  signal port_or : daq_pbldr_ort;
begin
  port_ir <= structify(port_iv, port_ir);
  port_ov <= vectorify(port_or, port_ov);
  u_pbldr : entity work.daq_packet_builder
    generic map (G => G)
    port map (port_ir => port_ir, port_or => port_or);
end architecture V2;

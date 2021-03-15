library ieee;
library types_def;
library ttc_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use types_def.common_defs.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_data_node is
  generic(G: dnode_grt);
  port (port_ir : in dnode_irt; port_or : out node_ort);
end entity daq_data_node;

architecture V2 of daq_data_node is

  -- window information should be registered when process starts since
  -- other nodes will be configured whenever a new request arrives.
  signal win_start : bcid_t;
  signal remaining : bcid_t;

  signal done : std_logic;

  -- FIFO related signals ------------------------------------------------------

  signal fifo_er : daq_node_fifo_ert;

  type cnt_rt is record
    nempty  : std_logic;
    data    : std_logic_vector(G.COUNTER_WIDTH-1 downto 0);
    rd_strb : std_logic;
  end record cnt_rt;
  signal cnt_r : cnt_rt := ('0', (others => '0'), '0');

  type pld_out_rt is record
    nempty : std_logic;
    data   : std_logic_vector(DAQ_FELIX_STREAM_WIDTH-1 downto 0);
    rd_strb : std_logic;
  end record pld_out_rt;
  signal pld_out_r : pld_out_rt := ('0', (others => '0'), '0');

  type pld_in_rt is record
    bcid  : bcid_t;
    data  : std_logic_vector(G.INPUT_DATA_WIDTH-1 downto 0);
    valid : std_logic;
  end record pld_in_rt;
  signal stream_dr : pld_in_rt := ((others => '0'), (others => '0'), '0');

  -- idle   : waiting activation
  -- start  : waiting for window to open
  -- gather : data gathering in process (window is open)
  -- send   : gathering is finished (data to be retrieved)
  -- halt   : wait for other streams
  type pld_st_t is (idle, start, gather, send, halt);
  signal pld_st : pld_st_t := idle;

  type cnt_st_t is (idle, send, halt);
  signal cnt_st : cnt_st_t := idle;


  impure function FIFO_READ_DATA_WIDTH return integer is
    variable y : integer := G.INPUT_DATA_WIDTH;
  begin
    while y < DAQ_FELIX_STREAM_WIDTH loop
      y := y * 2;
    end loop;
    return y;
  end function FIFO_READ_DATA_WIDTH;

begin

  -- mapping ports -------------------------------------------------------------

  pld_out_r.nempty <= not fifo_er.o.dst.nempty;

  port_or.mngt.done <= done;

  port_or.bconv.counter.nempty <= cnt_r.nempty;
  port_or.bconv.payload.nempty <= pld_out_r.nempty;
  port_or.mngt.nempty <= pld_out_r.nempty;

  cnt_r.rd_strb <= port_ir.bconv.counter.rd_strb;
  port_or.bconv.counter.data
    <= (port_or.bconv.counter.data'left downto cnt_r.data'length => '0')
    & cnt_r.data;

  pld_out_r.rd_strb <= port_ir.bconv.payload.rd_strb;
  port_or.bconv.payload.data
    <= (port_or.bconv.payload.data'left downto pld_out_r.data'length => '0')
    & pld_out_r.data;


  -- FIFO ----------------------------------------------------------------------

  data_fifo_u : entity work.daq_node_fifo
    generic map (G => (WRITE_DATA_WIDTH => G.INPUT_DATA_WIDTH,
                       READ_DATA_WIDTH => FIFO_READ_DATA_WIDTH,
                       READ_COUNT_WIDTH => G.COUNTER_WIDTH))
    port map (port_ir => fifo_er.i, port_or => fifo_er.o);

  -- converting widths
  ig0 : if cnt_r.data'length >= fifo_er.o.dst.count'length generate
    cnt_r.data(fifo_er.o.dst.count'range) <= fifo_er.o.dst.count;
  end generate ig0;

  ig1: if cnt_r.data'length < fifo_er.o.dst.count'length generate
    cnt_r.data <= fifo_er.o.dst.count(cnt_r.data'range);
  end generate ig1;

  -- Logic ---------------------------------------------------------------------

  ig2: if pld_out_r.data'length < fifo_er.o.dst.data'length generate
    pld_out_r.data <= fifo_er.o.dst.data(pld_out_r.data'range);
  end generate ig2;

  ig3: if pld_out_r.data'length >= fifo_er.o.dst.data'length generate
    pld_out_r.data(fifo_er.o.dst.data'range) <= fifo_er.o.dst.data;
  end generate ig3;

  fifo_er.i.src.wr_en <= stream_dr.valid;
  fifo_er.i.dst.rd_en <= '1'
                         when (port_ir.bconv.payload.rd_strb = '1'
                               and port_ir.mngt.rd_en = '1')
                         else '0';

  ig4: if fifo_er.i.src.data'length < stream_dr.data'length generate
    fifo_er.i.src.data <= stream_dr.data(fifo_er.i.src.data'range);
  end generate ig4;

  ig5: if fifo_er.i.src.data'length > stream_dr.data'length generate
    fifo_er.i.src.data <= (fifo_er.i.src.data'left downto stream_dr.data'length => '0')
                    & stream_dr.data;
  end generate ig5;

  ig6: if fifo_er.i.src.data'length = stream_dr.data'length generate
    fifo_er.i.src.data <= stream_dr.data;
  end generate ig6;

  -- FSM -----------------------------------------------------------------------

  -- type state_t is (idle, still, gather, send, halt);
  process (port_ir.sys.clk320)
  begin
    if rising_edge(port_ir.sys.clk320) then
      if port_ir.sys.rst = '1' then
        pld_st <= idle;
        cnt_st <= idle;
      else

        -- payload -------------------------------------------------------------
        case pld_st is
          when idle =>
            if port_ir.mngt.en = '1' and port_ir.req.strb = '1' then
              pld_st <= start;
              win_start <= port_ir.req.win_start;
              remaining <= port_ir.req.win_width;
            end if;
          when start =>
            if port_ir.stream.bcid = win_start then
              pld_st <= gather;
              stream_dr.valid <= port_ir.stream.valid;
              stream_dr.bcid <= port_ir.stream.bcid;
              stream_dr.data <= port_ir.stream.data(stream_dr.data'range);
            end if;
          when gather =>
            if remaining = 0 and port_ir.stream.bcid /= stream_dr.bcid then
              pld_st <= send;
              done <= '1';
              stream_dr.valid <= '0'; -- do not store data from now on
            else
              if port_ir.stream.bcid /= stream_dr.bcid then
                remaining <= remaining - 1;
              end if;
              stream_dr.valid <= port_ir.stream.valid;
              stream_dr.bcid <= port_ir.stream.bcid;
              stream_dr.data <= port_ir.stream.data(stream_dr.data'range);
            end if;
          when send =>
            if pld_out_r.nempty = '0' then
              pld_st <= halt;
            end if;
          when halt =>
            if port_ir.mngt.en = '0' then
              pld_st <= idle;
              done   <= '0';
            end if;
        end case;

        -- counter -------------------------------------------------------------
         case cnt_st is
          when idle =>
            if port_ir.mngt.en = '1' then
              cnt_st <= send;
              cnt_r.nempty <= '1';
            end if;
          when send =>
            if cnt_r.rd_strb = '1' then
              cnt_st <= halt;
              cnt_r.nempty <= '0';
            end if;
          when halt =>
            if port_ir.mngt.en = '0' then
              cnt_st <= idle;
            end if;
        end case;
      end if; -- reset
    end if; -- clock rising edge
  end process; -- clock

  -- -- storing data
  -- process (port_ir.sys.clk320)
  -- begin
  --   if rising_edge(port_ir.sys.clk320) then
  --
  --     -- Whenever the processing node is disabled, it must be in the
  --     -- reset state: not busy, not active, not done, and no errors.
  --     if port_ir.mngt.en = '0' then
  --       busy   <= '0';
  --       active <= '0';
  --       done   <= '0';
  --       port_or.mngt.unexpected <= '0';
  --       cnt_r.nempty <= '0';
  --
  --     -- When node is enabled, load the window limit values and start
  --     -- gathering.
  --     else
  --
  --       if cnt_r.rd_strb = '1' then
  --         cnt_r.nempty <= '0';
  --       end if;
  --
  --       -- `busy` signal ensures that window limits are loaded just
  --       -- once. It is assumed that window limits will be configured
  --       -- before data comes, the overhead of a fast clock should not
  --       -- impact on latency.
  --       if busy = '0' and done = '0' then
  --         win_start <= port_ir.req.win_start;
  --         remaining <= port_ir.req.win_zwidth;
  --         busy <= '1';
  --       end if;
  --
  --       -- With window configured and while window is open, data
  --       -- should be gathered.
  --       if busy = '1' and remaining > 0 then
  --
  --         -- look for lower edge of the window. If found, open window
  --         -- and start recording data. After that point, all data is
  --         -- forwarded to the FIFOs
  --         if port_ir.stream.bcid = win_start then
  --           active <= '1';
  --           stream_dr.valid <= port_ir.stream.valid;
  --           stream_dr.bcid <= port_ir.stream.bcid;
  --           stream_dr.data <= port_ir.stream.data(stream_dr.data'range);
  --         end if;
  --
  --         -- if window is active, decrement window width in the case
  --         -- of changed bcid and keep recording data. Deactivate
  --         -- window when finished and set done.
  --         if active = '1' then
  --
  --           -- Window width cannot be decremented for every clock. It
  --           -- should count the actual BCID values passing through.
  --           -- It cannot be compared with bcid+1 due to bcid wrapping.
  --           if port_ir.stream.bcid /= stream_dr.bcid then
  --             remaining <= remaining - 1;
  --           end if;
  --
  --           -- When width is greater than 1, all data should be
  --           -- forwarded. If it is 1, the data should be forwarded
  --           -- only if bcid did not change. Width of 0 is not allowed
  --           -- here.
  --           if remaining > 1
  --             or (remaining = 0 and port_ir.stream.bcid = stream_dr.bcid) then
  --             stream_dr.valid <= port_ir.stream.valid;
  --             stream_dr.bcid <= port_ir.stream.bcid;
  --             stream_dr.data <= port_ir.stream.data(stream_dr.data'range);
  --           else
  --             port_or.mngt.unexpected <= '1';
  --           end if;
  --
  --         end if;
  --
  --       elsif busy = '1' and remaining = 0 then
  --         done <= '1';
  --         cnt_r.nempty <= '1';
  --         active <= '0';
  --       end if;
  --     end if;
  --
  --   end if;
  -- end process;

end V2;

--------------------------------------------------------------------------------

library ieee;
library ttc_def;
library daq_def;
library types_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use types_def.common_defs.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_data_node_wrap is
  generic(G: dnode_grt);
  port (port_iv : in dnode_ivt; port_ov : out node_ovt);
end entity daq_data_node_wrap;

architecture V2 of daq_data_node_wrap is
  signal port_ir : dnode_irt;
  signal port_or : node_ort;
begin
  port_ir <= structify(port_iv, port_ir);
  port_ov <= vectorify(port_or, port_ov);
  u_dnode : entity work.daq_data_node
    generic map (G => G) port map (port_ir => port_ir, port_or => port_or);
end V2;

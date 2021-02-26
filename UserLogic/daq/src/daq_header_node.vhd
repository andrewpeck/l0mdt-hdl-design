library ieee;
library types_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use types_def.common_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_header_node is
  generic (G : hnode_grt);
  port (port_ir : in hnode_irt; port_or : out node_ort);
end entity daq_header_node;

architecture V2 of daq_header_node is

  -- the 'loaded' flag helps to avoid overwriting values once the processing
  -- node is activated.
  signal loaded : std_logic := '0';
  signal done : std_logic := '0';

  type cnt_rt is record
    nempty    : std_logic;
    data      : std_logic_vector(G.COUNTER_WIDTH-1 downto 0);
    rd_strb   : std_logic;
  end record cnt_rt;
  signal cnt_r : cnt_rt := ('0', std_logic_vector(to_unsigned(1, G.COUNTER_WIDTH)), '0');

  type pld_out_rt is record
    nempty : std_logic;
    data   : std_logic_vector(daq_hdr_vt'range);
    rd_strb : std_logic;
  end record pld_out_rt;
  signal pld_out_r : pld_out_rt := ('0', (others => '0'), '0');
  
  type state_t is (idle, ready, delivered);
  signal cnt_st : state_t := idle;
  signal pld_st : state_t := idle;

  -- header info
  signal hdr_r : daq_hdr_rt;
  signal hdr_v : daq_hdr_vt;

begin

  -- there is no FIFO or counters so no errors for now.
  port_or.mngt.err <= '0';
  -- port_or.mngt.unexpected <= '0';
  port_or.mngt.done <= done;

  cnt_r.rd_strb <= port_ir.bconv.counter.rd_strb;
  
  port_or.bconv.counter.nempty <= cnt_r.nempty;
  port_or.bconv.payload.nempty <= pld_out_r.nempty;
  port_or.mngt.nempty <= pld_out_r.nempty;
    
  port_or.bconv.counter.data
    <= (port_or.bconv.counter.data'left downto cnt_r.data'length => '0') & cnt_r.data;

  pld_out_r.rd_strb <= port_ir.bconv.payload.rd_strb;
  port_or.bconv.payload.data
    <= (port_or.bconv.payload.data'left downto pld_out_r.data'length => '0') & pld_out_r.data;


  -- always update  output with the header content
  hdr_v <= vectorify(hdr_r, hdr_v);
        
  -- pkt header ----------------------------------------------------------------
  -- continuously updated with possible values
  hdr_r.extra.win_start     <= port_ir.req.common.win_start;
  hdr_r.extra.win_width     <= port_ir.req.common.win_width;
  hdr_r.swrod.evid          <= port_ir.req.extra.evid;
  hdr_r.extra.daq_bcid      <= port_ir.req.extra.daq_bcid;
  hdr_r.extra.latency_ref   <= port_ir.req.extra.latency;
  hdr_r.extra.win_lower_ref <= port_ir.req.extra.win_lower;
  hdr_r.extra.win_upper_ref <= port_ir.req.extra.win_upper;
  hdr_r.extra.bcid          <= port_ir.req.extra.bcid;
  hdr_r.swrod.flag_0        <= (others => '0');
  hdr_r.swrod.flag_1        <= (others => '0');
  hdr_r.swrod.flag_2        <= (others => '0');

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
            if port_ir.mngt.en = '1' and port_ir.req.common.strb = '1' then
              pld_st <= ready;
              pld_out_r.data <= hdr_v;
              pld_out_r.nempty <= '1';
              done <= '1';
            end if;
          when ready =>
            if pld_out_r.rd_strb = '1' then
              pld_st <= delivered;
              pld_out_r.nempty <= '0';
            end if;
          when delivered =>
            if port_ir.mngt.en = '0' then
              pld_st <= idle;
              done <= '0';
            end if;
        end case;

        -- counter -------------------------------------------------------------
         case cnt_st is
          when idle =>
            if port_ir.mngt.en = '1' then
              cnt_st <= ready;
              cnt_r.nempty <= '1';
            end if;
          when ready =>
            if cnt_r.rd_strb = '1' then
              cnt_st <= delivered;
              cnt_r.nempty <= '0';
            end if;
          when delivered =>
            if port_ir.mngt.en = '0' then
              cnt_st <= idle;
            end if;
        end case;
      end if; -- reset
    end if; -- clock rising edge
  end process; -- clock

end V2;

--------------------------------------------------------------------------------

library ieee;
library types_def;
library daq_def;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use types_def.common_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_header_node_wrap is
  generic (G : hnode_grt);
  port (port_iv : in hnode_ivt; port_ov : out node_ovt);
end entity daq_header_node_wrap;

architecture V2 of daq_header_node_wrap is
  signal port_ir : hnode_irt;
  signal port_or : node_ort;
begin
  port_ir <= structify(port_iv, port_ir);
  port_ov <= vectorify(port_or, port_ov);
  u_daq_header_node : entity work.daq_header_node
    generic map (G => G) port map (port_ir => port_ir, port_or => port_or);
end V2;

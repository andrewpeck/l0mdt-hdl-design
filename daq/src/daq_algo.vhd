-- This is the top level file for the NSW L1A algorithm. It is based
-- on a scheme that can be described as a matrix where each row
-- (besides the first one) is a data stream and every column is a
-- concurrent request handler. The first row is reserved to handle
-- header information that is common to all the processing nodes and
-- that need to be sent out later.
--
-- The data input interface, named as Stream Interface after a joke
-- during discussions on a white board where lines representing this
-- path where marked with an "stream" pattern. The Stream Interface is
-- very simple: a variable length payload, a BCID signal to
-- characterize the payload information and a write strobe to validate
-- the payload. Each Stream Interface is dedicated to a processing row
-- in the L1A processing matrix.
--
-- Upon receiving an L1A request, a processing column will be
-- activated, which will happen always from left to right. If all the
-- columns are busy, it will wait for the current pointed column to be
-- released. 
--
-- In the L1A processing matrix, multiple columns can be activated in
-- parallel, however there is just one lane to send data out, which is
-- a elink in a CERN GBT link. Another constraint is that data related
-- to L1A requests must be sent in the same order that the L1A
-- requests were received. Thus information is retrieved by a packet
-- builder block for one column at a time and it will go always from
-- left to right as well, which will solve both constraints.

-- Important details:
--
-- The L1A algo is based on 3 counters: 
-- - l1a_bcid_cnt used to compare to the L1A BCID
-- - l1a_win_lower_cnt used to compare to the lower window limit
--
-- Since latency and limits cannot be calculated because the BCID counter
-- is restarted by an external signal (BCR), matching BCID and window limits
-- must involve delayed counters. 
--
-- l1a_cnt is the internal base counter (ref)
-- l1a_cnt resets on ttc_bcr_i
--
-- l1a_latency_i syncronizes the bcid from outside with the one inside
-- l1a_latency_i holds the BCID number of clocks that the BCID counter
--  must be delayed
-- 
-- l1a_bcid_cnt is l1a_cnt delayed by l1a_latency_i
-- l1a_latency_i < BCR period (otherwise l1a_bcid_cnt never resets)
--
-- l1a_win_lower_cnt is l1a_cnt delayed by l1a_win_lower_i

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
use daq_def.daq_row_defs.all;

entity daq_algo is
  generic(G: daq_algo_grt := (PIPELINES => 4,
                              BRANCH_STRUCT => (96, 128, others => 0),
                              COUNTER_WIDTH => 64));
  port(port_ir: in daq_algo_irt; port_or: out daq_algo_ort);
end entity daq_algo;

architecture V2 of daq_algo is
  
  signal mngt_er : daq_mngt_ert;
  
  signal req_er : daq_req_ert;
  
  signal hdr_v : daq_hdr_vt;

  function nullify return daq_branch_t is
    variable aux : daq_branch_t;
  begin
    return nullify(aux);
  end function nullify;
  
  signal stream_lar : daq_branch_t := nullify;
  
  --------------

  signal hrow_ir : daq_hrow_irt;

  type drow_airt is array (1 to DAQ_MAX_STREAMS) of daq_drow_irt;
  signal drow_air : drow_airt;
  
  type row_aort is array (0 to DAQ_MAX_STREAMS) of daq_row_ort;
  signal row_aor : row_aort;
  
  signal pbldr_er : daq_pbldr_ert;

  function get_nstreams return natural is
    variable n : natural := 0;
  begin
    for j in G.BRANCH_STRUCT'range loop
      if G.BRANCH_STRUCT(j) /= 0 then
        n := n + 1;
      end if;
    end loop;
    return n;
  end function;
  
begin

  g_branch: for j in G.BRANCH_STRUCT'range generate
    g_stream: if G.BRANCH_STRUCT(j) /= 0 generate
      stream_lar(j).bcid  <= port_ir.branch(j).bcid;
      stream_lar(j).valid <= port_ir.branch(j).valid;
      stream_lar(j).data <= port_ir.branch(j).data(stream_lar(j).data'range);
    end generate g_stream;
  end generate g_branch;
  
  --------------------------------------------
  -- INSTANTIATIONS AND RELATED ASSIGNMENTS --
  --------------------------------------------

  -- daq request ---------------------------------------------------------------
  
  u_daq_mngt : entity work.daq_mngt
    generic map(G => (STREAMS => get_nstreams, PIPELINES => G.PIPELINES))
    port map (mngt_er.i, mngt_er.o);
  mngt_er.i.sys  <= port_ir.sys;
  mngt_er.i.ttc  <= port_ir.ttc;

  u_daq_req : entity work.daq_req port map (req_er.i, req_er.o);
  
  req_er.i.sys  <= port_ir.sys;
  req_er.i.ttc  <= port_ir.ttc;
  req_er.i.ctrl <= port_ir.ctrl;
  
  port_or.status.stability <= req_er.o.status.stability;
  -- hdr_r <= structify(req_er.o.stream.data(hdr_v'range), hdr_r);

  -- header row ----------------------------------------------------------------
  u_hrow : entity work.daq_hrow
    generic map (G => (PIPELINES => G.PIPELINES,
                       INPUT_DATA_WIDTH => daq_hdr_vt'length,
                       COUNTER_WIDTH => 32))
    port map (hrow_ir, row_aor(0));
  hrow_ir.sys            <= port_ir.sys;
  hrow_ir.req            <= req_er.o.row;
  hrow_ir.mngt           <= mngt_er.o.row;
  hrow_ir.pbldr.payload  <= pbldr_er.o.row.payload;
  hrow_ir.pbldr.sel      <= pbldr_er.o.row.sel(0);
  pbldr_er.i.row.payload <= row_aor(0).pbldr.payload;
  mngt_er.i.row          <= row_aor(0).mngt;
  
  -- data rows -----------------------------------------------------------------
  gen_data_rows: for j in 1 to DAQ_MAX_STREAMS generate
    ig: if G.BRANCH_STRUCT(j-1) /= 0 generate
      u_drow : entity work.daq_drow
        generic map (G => (PIPELINES => G.PIPELINES,
                           INPUT_DATA_WIDTH => G.BRANCH_STRUCT(j-1),
                           COUNTER_WIDTH => G.COUNTER_WIDTH))
        port map (drow_air(j), row_aor(j));
      drow_air(j).sys           <= port_ir.sys;
      drow_air(j).req           <= req_er.o.row.common;
      drow_air(j).stream        <= stream_lar(j-1);
      drow_air(j).mngt          <= mngt_er.o.row;
      drow_air(j).pbldr.payload <= pbldr_er.o.row.payload;
      drow_air(j).pbldr.sel     <= pbldr_er.o.row.sel(j);
      pbldr_er.i.row.payload    <= row_aor(j).pbldr.payload;
      mngt_er.i.row             <= row_aor(j).mngt;
    end generate ig;
  end generate gen_data_rows;
  
  -- -- row connections -----------------------------------------------------------
  -- gen_rows_con: for j in row_ar'range generate
  --   row_ar(j).i.sys <= port_ir.sys;
  --   row_ar(j).i.mngt.col_rd_en <= col_rd_en_v;
  --   row_ar(j).i.mngt.win_lower <= hdr_r.extra.win_lower;
  --   row_ar(j).i.mngt.win_width <= hdr_r.extra.win_width_ref;
  -- 
  --   row_nempty_v(j) <= row_ar(j).o.pbldr.nempty;
  --   row_done_v(j) <= row_ar(j).o.mngt.done;
  -- end generate gen_rows_con;
  -- 
  -- row_sel <= to_integer(unsigned(pbldr_er.o.mngt.row_sel));
  -- pbldr_er.i.row <= row_ar(row_sel).o.pbldr;
  -- 
  -- packet builder ------------------------------------------------------------
  
  -- The package builder is enabled under the scope of a given column
  -- and will sweep all rows retrieving the available data and
  -- exposing it to fifo2elink block.
  
  u_pbldr : entity work.daq_packet_builder
    port map (port_ir => pbldr_er.i, port_or => pbldr_er.o);
  
  pbldr_er.i.sys <= port_ir.sys;
  port_or.f2e <= pbldr_er.o.f2e;
  pbldr_er.i.f2e <= port_ir.f2e;
  pbldr_er.i.mngt <= mngt_er.o.pbldr;

  -- ---- -- -- transposing busy and nempty signals per col as "cols" so can be
  -- ---- -- -- accessed like col_busy(0) /= (ROWS-1 downto 0 => '0') for an
  -- ---- -- -- "and" port.
  -- ---- -- L0: for i in 0 to DAQ_PIPELINES-1 generate
  -- ---- --   L1: for j in 0 to ROWS-1 generate
  -- ---- --     col_row_row_done_va(i)(j)   <= row_col_row_done_va(j)(i);
  -- ---- --   end generate L1;
  -- ---- -- end generate L0;
  -- ---- 
  -- ---- -- timing isssues -- calculating the total number of bytes that were produced for the
  -- ---- -- timing isssues -- current processing col. This value is directly delivered to the
  -- ---- -- timing isssues -- counter port of the pkt mux in the first input position, which is
  -- ---- -- timing isssues -- related to the header.
  -- ---- -- timing isssues process(counter_a)
  -- ---- -- timing isssues   variable local_v : unsigned(31 downto 0);
  -- ---- -- timing isssues begin
  -- ---- -- timing isssues 
  -- ---- -- timing isssues   -- temp counter starts with the length of header
  -- ---- -- timing isssues   local_v := to_unsigned(DAQ_COUNTER_WIDTH, local_v'length)
  -- ---- -- timing isssues              + to_unsigned(PAYLOAD_WIDTH(0), local_v'length);
  -- ---- -- timing isssues   S0 : for i in 1 to ROWS-1 loop
  -- ---- -- timing isssues     local_v := local_v
  -- ---- -- timing isssues              + DAQ_COUNTER_WIDTH
  -- ---- -- timing isssues              + unsigned(counter_a(i)) * PAYLOAD_WIDTH(i);
  -- ---- -- timing isssues   end loop S0;
  -- ---- -- timing isssues   counter_a(0)(DAQ_COUNTER_WIDTH-1 downto 0) <= "000" &
  -- ---- -- timing isssues     std_logic_vector(local_v(DAQ_COUNTER_WIDTH-1 downto 3));
  -- ---- -- timing isssues end process;
  
end architecture V2;

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
use daq_def.daq_row_defs.all;

entity daq_algo_wrap is
  generic(G_v: daq_algo_gvt);
  port(port_iv: in daq_algo_ivt; port_ov: out daq_algo_ovt);
end entity daq_algo_wrap;

architecture V2 of daq_algo_wrap is

  impure function G return daq_algo_grt is
    variable aux : daq_algo_grt;
  begin
    return structify(G_v, aux);
  end function G;
  
  signal port_ir : daq_algo_irt;
  signal port_or : daq_algo_ort;
begin
  port_ir <= structify(port_iv, port_ir);
  port_ov <= vectorify(port_or, port_ov);
  u_daq_algo: entity work.daq_algo
    generic map (G => G)
    port map (port_ir => port_ir, port_or => port_or);
end architecture V2;


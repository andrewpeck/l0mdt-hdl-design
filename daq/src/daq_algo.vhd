-- This is the top level file for the NSW L1A algorithm. It is based
-- on a scheme that can be described as a matrix where each row
-- (besides the first one) is a data stream and every column is a
-- concurrent request handler. The first row is reserved to handle
-- header information that is common to all the processing cells and
-- that need to be sent out later.
--
-- The data input interface, named as Snake Interface after a joke
-- during discussions on a white board where lines representing this
-- path where marked with an "snake" pattern. The Snake Interface is
-- very simple: a variable length payload, a BCID signal to
-- characterize the payload information and a write strobe to validate
-- the payload. Each Snake Interface is dedicated to a processing row
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
use daq_lib.daq_header_cell_pkg.all;
use daq_lib.daq_data_cell_pkg.all;
use daq_lib.daq_bus_conv_pkg.all;

library ttc_lib;
use ttc_lib.ttc_defs_pkg.all;

package daq_algo_pkg is
  component daq_algo is
    port(i: in algo_irt; o: out algo_ort);
  end component daq_algo;
end package daq_algo_pkg;

-----------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

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
use daq_lib.daq_header_cell_pkg.all;
use daq_lib.daq_data_cell_pkg.all;
use daq_lib.daq_bus_conv_pkg.all;
use daq_lib.daq_row_pkg.all;
use daq_lib.daq_packet_builder_pkg.all;

library ttc_lib;
use ttc_lib.ttc_defs_pkg.all;

entity daq_algo is
  port(i: in algo_irt; o: out algo_ort);
end entity daq_algo;

architecture V2 of daq_algo is

  component fifo_daq_req
    port (
      rst : in std_logic;
      wr_clk : in std_logic;
      rd_clk : in std_logic;
      din : in std_logic_vector(511 downto 0);
      wr_en : in std_logic;
      rd_en : in std_logic;
      dout : out std_logic_vector(511 downto 0);
      full : out std_logic;
      empty : out std_logic;
      wr_data_count : out std_logic_vector(10 downto 0);
      wr_rst_busy : out std_logic;
      rd_rst_busy : out std_logic
      );
  end component;
  
  constant DEV_ROWS : natural := DEV_ROWS;

  signal cnt_r : daq_counters_rt;
  
  signal stability_r : stability_rt;

  signal req_fifo_r : lxa_req_fifo_rt;

  signal col_rd_en   : natural range DAQ_N_PIPELINES-1 downto 0;
  signal col_rd_en_v : std_logic_vector(DEV_COL_SEL_WIDTH-1 downto 0);

  signal row_sel : integer := 0;

  -- effective information for the window limits
  signal ctrl_r : daq_ctrl_rt;
  
  -- header info
  signal daq_hdr_r : daq_hdr_rt;
  signal daq_hdr_dr : daq_hdr_rt; -- delayed, after FIFO

  -- column handling
  signal col_en    : std_logic_vector(DAQ_N_PIPELINES-1 downto 0);
  signal col_wr_en : natural range DAQ_N_PIPELINES-1 downto 0;
  signal row_nempty_v  : std_logic_vector(DEV_ROWS-1 downto 0);
  signal row_done_v    : std_logic_vector(DEV_ROWS-1 downto 0);

  signal row_ar : row_bus_at;

  signal pkt_bldr_r : pkt_bldr_rt;


begin

  o.ctrl.invalid_values <= '0';
  o.ctrl.stability <= vectorify(stability_r);

  -- pkt header ----------------------------------------------------------------
  -- continuously updated with possible values
  daq_hdr_r.swrod.flag_0 <= (others => '0');
  daq_hdr_r.swrod.flag_1 <= (others => '0');
  daq_hdr_r.swrod.flag_2 <= (others => '0');
  daq_hdr_r.swrod.eventid <= i.ttc.cnt.eventid;
  daq_hdr_r.extra.win_lower <= cnt_r.win_lower;
  daq_hdr_r.extra.daq_bcid <= cnt_r.daq_bcid;
  daq_hdr_r.extra.win_width <= ctrl_r.win_width;
  daq_hdr_r.extra.win_lower_ref <= ctrl_r.win_lower;
  daq_hdr_r.extra.win_upper_ref <= ctrl_r.win_upper;

  -- daq_hdr_dr <= structify(req_fifo_r.o.rd.data(daq_hdr_rvt'range));

  
  --------------------------------------------
  -- INSTANTIATIONS AND RELATED ASSIGNMENTS --
  --------------------------------------------

  -- header row ----------------------------------------------------------------
  daq_header_row_u : component daq_row
    generic map (G => (INPUT_DATA_LEN => daq_hdr_rvt'length,
                       OUTPUT_DATA_LEN => 16,
                       COUNTER_LEN => 16,
                       CELL_TYPE => 0))
    port map (i => row_ar(0).i, o => row_ar(0).o);

  -- data rows -----------------------------------------------------------------
  gen_data_rows: for j in i.stream_bus'range generate
    daq_data_row_u : component daq_row
      generic map (G => (INPUT_DATA_LEN => DAQ_STREAMS(j),
                         OUTPUT_DATA_LEN => 16,
                         COUNTER_LEN => 16,
                         CELL_TYPE => 1))
      port map (i => row_ar(j+1).i, o => row_ar(j+1).o);
    row_ar(j+1).i.stream <= i.stream_bus(j);
  end generate gen_data_rows;

  -- row connections -----------------------------------------------------------
  gen_rows_con: for j in row_ar'range generate
    row_ar(j).i.sys <= i.sys;
    row_ar(j).i.mngt.col_rd_en <= col_rd_en_v;
    row_ar(j).i.mngt.win_lower <= daq_hdr_dr.extra.win_lower;
    row_ar(j).i.mngt.win_width <= daq_hdr_dr.extra.win_width;

    row_nempty_v(j) <= row_ar(j).o.pkt_bldr.nempty;
    row_done_v(j) <= row_ar(j).o.mngt.done;
  end generate gen_rows_con;

  row_sel <= to_integer(unsigned(pkt_bldr_r.o.mngt.row_sel));
  pkt_bldr_r.i.row <= row_ar(row_sel).o.pkt_bldr;
  
  -- packet builder ------------------------------------------------------------
  
  -- The package builder is enabled under the scope of a given column
  -- and will sweep all rows retrieving the available data and
  -- exposing it to fifo2elink block.
  
  daq_packet_builder_u : component daq_packet_builder
    generic map (G => (PAYLOAD_LEN => 16))
    port map (i => pkt_bldr_r.i, o => pkt_bldr_r.o);

  pkt_bldr_r.i.sys <= i.sys;
  o.f2e <= pkt_bldr_r.o.f2e;
  pkt_bldr_r.i.f2e <= i.f2e;
  
  -- daq request FIFO ----------------------------------------------------------

  -- This is the fifo (FWFT) to store information related to the daq
  -- events. Values are concatenated in a single word to avoid synchronization
  -- faults.
  -- 
  -- TODO: handling of full situation.
  daq_req_fifo_u : component fifo_daq_req port map (
    rst           => i.sys.rst,
    wr_clk        => req_fifo_r.i.wr.clk,
    rd_clk        => req_fifo_r.i.rd.clk,
    din           => req_fifo_r.i.wr.data,
    wr_en         => req_fifo_r.i.wr.en,
    rd_en         => req_fifo_r.i.rd.en,
    dout          => req_fifo_r.o.rd.data,
    full          => req_fifo_r.o.wr.full, -- TODO
    empty         => req_fifo_r.o.rd.empty,
    wr_data_count => req_fifo_r.o.rd.count, -- usable?
    wr_rst_busy   => req_fifo_r.o.wr.rst_busy, -- usable?
    rd_rst_busy   => req_fifo_r.o.rd.rst_busy); -- usable?

  req_fifo_r.i.wr.clk <= i.sys.clk320;
  req_fifo_r.i.rd.clk <= i.sys.clk320;

  --------------
  -- MANAGING --
  --------------
  
  -- the DAQ BCID should follow the latency pipeline. For that, a
  -- counter is used as base for resets on the the DAQ BCID and DAQ
  -- window limits counters later on.
  
  -- Because the way the calculation of the DAQ window limits is done,
  -- every change in these will result in an temporary incorrect
  -- state, this is exposed by the `stability` flags. 

  stability_r.win_upper <= '1';
  ctrl_r.win_width <= ctrl_r.win_lower + 1 + ctrl_r.win_upper;
  
  process (i.sys.clk320)
  begin
    if rising_edge(i.sys.clk320) then
      
      if i.sys.rst = '1' then
        ctrl_r.win_lower <= i.ctrl.win_lower;
        ctrl_r.latency <= i.ctrl.latency;
        ctrl_r.win_upper <= i.ctrl.win_upper;
        stability_r <= nullify(stability_r);
      else

        -- window information is registered when wr_en is active. Ready signals
        -- are deactivated to indicate the transition period.
        if i.ctrl.wr_en = '1' then
          ctrl_r.win_lower <= i.ctrl.win_lower;
          ctrl_r.latency   <= i.ctrl.latency;
          ctrl_r.win_upper <= i.ctrl.win_upper;
          stability_r <= nullify(stability_r);

        else

          -- wait for BX strobe to update the 40MHz counters
          if i.ttc.cmds.bx = '1' then

            -- handling of the counter for the lower limit of the window
            if  i.ttc.cnt.bcid = ctrl_r.latency + ctrl_r.win_lower then
              cnt_r.win_lower <= to_unsigned(0, cnt_r.win_lower'length);
              stability_r.win_lower <= '1';
            else
              cnt_r.win_lower <= cnt_r.win_lower + 1;
            end if;
            
            -- handling of the counter for the latency delay
            if  i.ttc.cnt.bcid = ctrl_r.latency then
              cnt_r.daq_bcid <= to_unsigned(0, cnt_r.daq_bcid'length);
              stability_r.latency <= '1';
            else
              cnt_r.daq_bcid <= cnt_r.daq_bcid + 1;
            end if;
          end if; -- BX strobe

          -- send request info to fifo on lxa commands
          if(i.ttc.cmds.lxa = '1'
             and stability_r.win_lower = '1'
             and stability_r.latency = '1') then
            req_fifo_r.i.wr.en <= '1';
            req_fifo_r.i.wr.data(daq_hdr_rvt'range) <= vectorify(daq_hdr_r);
          else
            req_fifo_r.i.wr.en <= '0';
          end if;
        end if;  
      end if; -- i.sys.rst = '1'
    end if; -- clk
  end process;

  col_rd_en_v <= std_logic_vector(to_unsigned(col_rd_en, col_rd_en_v'length));
  
  req_fifo_r.i.rd.en <= '1' when (req_fifo_r.o.rd.empty = '0'
                                  and col_en(col_wr_en) = '0') else '0';
  
  -- When an DAQ request information is available on the output of the
  -- daq_req_fifo, it should be transferred to a processing column as
  -- soon as possible, which is indicated by col_wr_en. It will only
  -- happen if that column is not active. If the processing column is
  -- already active, it means that all processing columns are busy at
  -- that moment (counter wrapped around) and it shall wait there
  -- waiting for a chance.
  --
  -- When DAQ data was selected for the pointed reading column, the
  -- packet builder must be enabled and it will drain all cells of
  -- this column (each row corresponds to a stream of data). Once no
  -- more data is available for that column, col_rd_en must be
  -- updated to the next one. It will sit there until that processing
  -- column is done gathering data.
  -- 
  -- col_en(i) here means that the col "i" is activated when '1', that
  -- is, the processing col is busy with configuring, gathering or
  -- sending information. Afer sending, the column is deactivated and
  -- waits for a new DAQ request.
  process (i.sys.clk320)
  begin
    if rising_edge(i.sys.clk320) then
      if i.sys.rst = '1' then
        col_en <= (others => '0');
      else
        -- handling received DAQ requests, only activate processing
        -- column if current target column is inactive
        if req_fifo_r.o.rd.empty = '0' and col_en(col_wr_en) = '0' then
          -- set col as active (includes wr_strobe)
          col_en(col_wr_en) <= '1';
          
          -- move write col target to the next one
          if col_wr_en < DAQ_N_PIPELINES-1 then
            col_wr_en <= col_wr_en + 1;
          else
            col_wr_en <= 0;
          end if; -- wrapping col_wr_en
        end if; -- there is data and current wr col is not enabled

        -- send information out when all processing column data is
        -- ready. After sending, processing column must be disabled to
        -- be able to accept a new DAQ request.
        if (col_en(col_rd_en) = '1') then
          
          -- if all cells are done and there is data to be sent,
          -- packet builder should be enabled
          if pkt_bldr_r.i.mngt.en = '0' and row_done_v = (row_done_v'range => '1') then
            pkt_bldr_r.i.mngt.en <= '1';
          end if;
          
          -- if packet builder is enabled but there is not data to be sent
          -- anymore, disable packet manager and move to next column
          if(pkt_bldr_r.i.mngt.en = '1'
             and row_nempty_v = (row_nempty_v'range => '0')
             and pkt_bldr_r.o.mngt.done = '1') then
            
            -- disable packet builder
            pkt_bldr_r.i.mngt.en <= '0';
          
            -- free current processing column
            col_en(col_rd_en) <= '0';
            
            -- move target to the next processing column
            if col_rd_en < DAQ_N_PIPELINES-1 then
              col_rd_en <= col_rd_en + 1;
            else
              col_rd_en <= 0;
            end if; -- wrap col counter
            
          end if;
        end if;
      end if;
    end if;
  end process;
  
  ---- -- -- transposing busy and nempty signals per col as "cols" so can be
  ---- -- -- accessed like col_busy(0) /= (ROWS-1 downto 0 => '0') for an
  ---- -- -- "and" port.
  ---- -- L0: for i in 0 to DAQ_N_PIPELINES-1 generate
  ---- --   L1: for j in 0 to ROWS-1 generate
  ---- --     col_row_row_done_va(i)(j)   <= row_col_row_done_va(j)(i);
  ---- --   end generate L1;
  ---- -- end generate L0;
  ---- 
  ---- -- timing isssues -- calculating the total number of bytes that were produced for the
  ---- -- timing isssues -- current processing col. This value is directly delivered to the
  ---- -- timing isssues -- counter port of the pkt mux in the first input position, which is
  ---- -- timing isssues -- related to the header.
  ---- -- timing isssues process(counter_a)
  ---- -- timing isssues   variable local_v : unsigned(31 downto 0);
  ---- -- timing isssues begin
  ---- -- timing isssues 
  ---- -- timing isssues   -- temp counter starts with the length of header
  ---- -- timing isssues   local_v := to_unsigned(DAQ_COUNTER_LEN, local_v'length)
  ---- -- timing isssues              + to_unsigned(PAYLOAD_LEN(0), local_v'length);
  ---- -- timing isssues   S0 : for i in 1 to ROWS-1 loop
  ---- -- timing isssues     local_v := local_v
  ---- -- timing isssues              + DAQ_COUNTER_LEN
  ---- -- timing isssues              + unsigned(counter_a(i)) * PAYLOAD_LEN(i);
  ---- -- timing isssues   end loop S0;
  ---- -- timing isssues   counter_a(0)(DAQ_COUNTER_LEN-1 downto 0) <= "000" &
  ---- -- timing isssues     std_logic_vector(local_v(DAQ_COUNTER_LEN-1 downto 3));
  ---- -- timing isssues end process;
  

end architecture V2;
  

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

entity daq_mngt is
  generic (G: daq_mngt_grt);
  port (port_ir: in daq_mngt_irt; port_or: out daq_mngt_ort);
end entity daq_mngt;

architecture V1 of daq_mngt is

  signal pipeline_next : natural := 0;
  signal pipeline_read : natural := 0;

  type flag_matrix_t is array(0 to DAQ_PIPELINES-1) of std_logic_vector(0 to G.STREAMS);
  signal done_matrix : flag_matrix_t := (others => (others => '0'));
  signal nempty_matrix : flag_matrix_t := (others => (others => '0'));

  signal pipeline_wren   : std_logic_vector(0 to DAQ_PIPELINES-1);
  signal pipeline_rden   : std_logic_vector(0 to DAQ_PIPELINES-1);
  signal pipeline_done   : std_logic_vector(0 to DAQ_PIPELINES-1);
  signal pipeline_nempty : std_logic_vector(0 to DAQ_PIPELINES-1);

begin

  port_or.err <= (others => '0');

  port_or.row.en(pipeline_wren'range) <= pipeline_wren;
  port_or.row.rd_en(pipeline_wren'range) <= pipeline_rden;

  gen_flag_matrix: for j in 0 to DAQ_PIPELINES-1 generate
    gen_flag_streams: for k in 0 to G.STREAMS-1 generate
      done_matrix(j)(k) <= port_ir.row.done(k);
      nempty_matrix(j)(k) <= port_ir.row.nempty(k);
    end generate gen_flag_streams;
  end generate gen_flag_matrix;

  gen_pipeline_flags: for j in 0 to DAQ_PIPELINES-1 generate
    pipeline_done(j) <= '1' when done_matrix(j) = (done_matrix'range => '1') else '0';
    pipeline_nempty(j) <= '1' when nempty_matrix(j) = (nempty_matrix'range => '1') else '0';
  end generate gen_pipeline_flags;



  process (port_ir.sys.clk320)
  begin
    if rising_edge(port_ir.sys.clk320) then
      if port_ir.sys.rst = '1' then
        pipeline_next <= 0;
        pipeline_read <= 0;
        port_or.pbldr.en <='0';
        pipeline_wren <= (others => '0');
        pipeline_rden <= (others => '0');
      else

        -- use next available pipeline when request comes
        if (port_ir.ttc.cmds.lxa = '1'
            and pipeline_wren(pipeline_next) = '0') then
          pipeline_wren(pipeline_next) <= '1';
          if pipeline_next = DAQ_PIPELINES-1 then
            pipeline_next <= 0;
          else
            pipeline_next <= pipeline_next + 1;
          end if;
        end if;

        -- drain pipeline if done and move to next one
        if (pipeline_done(pipeline_read) = '1') then
          if (pipeline_nempty(pipeline_read) = '1') then
            port_or.pbldr.en <= '1';
            pipeline_rden(pipeline_read) <= '1';
          else
            port_or.pbldr.en <='0';
            pipeline_rden(pipeline_read) <= '0';
            pipeline_wren(pipeline_read) <= '0';
            if (pipeline_read = DAQ_PIPELINES-1) then
              pipeline_read <= 0;
            else
              pipeline_read <= pipeline_read + 1;
            end if; -- counter wrap
          end if; -- pipeline nempty
        end if; -- pipeline done

      end if; -- reset
    end if; -- rising edge
  end process; -- clk


  --------------------------------------------
  -- INSTANTIATIONS AND RELATED ASSIGNMENTS --
  --------------------------------------------

  -- -- matrix management ---------------------------------------------------------
  --
  -- col_rd_en_v <= std_logic_vector(to_unsigned(col_rd_en, col_rd_en_v'length));
  --
  -- -- When an DAQ request information is available on the output of the
  -- -- daq_req_fifo, it should be transferred to a processing column as
  -- -- soon as possible, which is indicated by col_wr_en. It will only
  -- -- happen if that column is not active. If the processing column is
  -- -- already active, it means that all processing columns are busy at
  -- -- that moment (counter wrapped around) and it shall wait there
  -- -- waiting for a chance.
  -- --
  -- -- When DAQ data was selected for the pointed reading column, the
  -- -- packet builder must be enabled and it will drain all nodes of
  -- -- this column (each row corresponds to a stream of data). Once no
  -- -- more data is available for that column, col_rd_en must be
  -- -- updated to the next one. It will sit there until that processing
  -- -- column is done gathering data.
  -- --
  -- -- col_en(i) here means that the col "i" is activated when '1', that
  -- -- is, the processing col is busy with configuring, gathering or
  -- -- sending information. Afer sending, the column is deactivated and
  -- -- waits for a new DAQ request.
  --
  -- process (port_ir.sys.clk320)
  -- begin
  --   if rising_edge(port_ir.sys.clk320) then
  --     if port_ir.sys.rst = '1' then
  --       col_en <= (others => '0');
  --     else
  --       -- handling received DAQ requests, only activate processing
  --       -- column if current target column is inactive
  --       if req_er.o.stream.valid = '1' and col_en(col_wr_en) = '0' then
  --         -- set col as active (includes wr_strobe)
  --         col_en(col_wr_en) <= '1';
  --
  --         -- move write col target to the next one
  --         if col_wr_en < DAQ_PIPELINES-1 then
  --           col_wr_en <= col_wr_en + 1;
  --         else
  --           col_wr_en <= 0;
  --         end if; -- wrapping col_wr_en
  --       end if; -- there is data and current wr col is not enabled
  --
  --       -- send information out when all processing column data is
  --       -- ready. After sending, processing column must be disabled to
  --       -- be able to accept a new DAQ request.
  --       if (col_en(col_rd_en) = '1') then
  --
  --         -- if all nodes are done and there is data to be sent,
  --         -- packet builder should be enabled
  --         if pbldr_er.i.mngt.en = '0' and row_done_v = (row_done_v'range => '1') then
  --           pbldr_er.i.mngt.en <= '1';
  --         end if;
  --
  --         -- if packet builder is enabled but there is not data to be sent
  --         -- anymore, disable packet manager and move to next column
  --         if(pbldr_er.i.mngt.en = '1'
  --            and row_nempty_v = (row_nempty_v'range => '0')
  --            and pbldr_er.o.mngt.done = '1') then
  --
  --           -- disable packet builder
  --           pbldr_er.i.= '0';
  --
  --           -- free current processing column
  --           col_en(col_rd_en) <= '0';
  --
  --           -- move target to the next processing column
  --           if col_rd_en < DAQ_PIPELINES-1 then
  --             col_rd_en <= col_rd_en + 1;
  --           else
  --             col_rd_en <= 0;
  --           end if; -- wrap col counter
  --
  --         end if;
  --       end if;
  --     end if;
  --   end if;
  -- end process;
  --
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
  -- ---- -- timing isssues   local_v := to_unsigned(DAQ_COUNTER_LEN, local_v'length)
  -- ---- -- timing isssues              + to_unsigned(PAYLOAD_LEN(0), local_v'length);
  -- ---- -- timing isssues   S0 : for i in 1 to ROWS-1 loop
  -- ---- -- timing isssues     local_v := local_v
  -- ---- -- timing isssues              + DAQ_COUNTER_LEN
  -- ---- -- timing isssues              + unsigned(counter_a(i)) * PAYLOAD_LEN(i);
  -- ---- -- timing isssues   end loop S0;
  -- ---- -- timing isssues   counter_a(0)(DAQ_COUNTER_LEN-1 downto 0) <= "000" &
  -- ---- -- timing isssues     std_logic_vector(local_v(DAQ_COUNTER_LEN-1 downto 3));
  -- ---- -- timing isssues end process;

end architecture V1;

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

entity daq_mngt_wrap is
  generic (G: daq_mngt_grt);
  port(port_iv: in daq_mngt_ivt; port_ov: out daq_mngt_ovt);
end entity daq_mngt_wrap;

architecture V1 of daq_mngt_wrap is
  signal port_ir : daq_mngt_irt;
  signal port_or : daq_mngt_ort;
begin
  port_ir <= structify(port_iv, port_ir);
  port_ov <= vectorify(port_or, port_ov);
  u_daq_mngt: entity work.daq_mngt
    generic map (G) port map (port_ir, port_or);
end architecture V1;
